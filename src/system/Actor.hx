package system;

import h2d.SpriteBatch.BatchElement;
import sinker.Maybe;
import firedancer.vm.Program;
import firedancer.vm.PositionRef;
import firedancer.vm.Vm;

class Actor extends firedancer.vm.Actor {
	public final batchElement:ActorBatchElement;
	public var state:ActorState;

	public function new(tile:h2d.Tile) {
		final threads = new firedancer.vm.ThreadList(Settings.THREAD_POOL_CAPACITY, Settings.MEMORY_CAPACITY);
		final batchElement = new ActorBatchElement(tile, this);
		final thisPositionRef:PositionRef = batchElement;
		super(threads, thisPositionRef);

		this.batchElement = batchElement;
		this.state = Dead;
	}

	public function update(context:FiredancerContext):Void {
		if (!HabitableZone.containsPoint(this.x, this.y)) {
			this.state = Disused;
		} else {
			final ctx = context;
			final endCode = Vm.run(ctx.programPackage.programTable, ctx.eventHandler, ctx.emitter, Settings.MEMORY_CAPACITY, this, ctx.targetPositionRef);

			EndCodeHandler.run(this, endCode);
		}
	}

	public function reset(x:Float, y:Float, vx:Float, vy:Float, ?program:Program, ?originPositionRef:PositionRef):Actor {
		this.x = x;
		this.y = y;
		this.vx = vx;
		this.vy = vy;

		if (program != null)
			this.threads.set(program);
		else
			this.threads.reset();

		this.originPositionRef = Maybe.from(originPositionRef);

		return this;
	}
}

class ActorBatchElement extends BatchElement {
	final actor:Actor;

	public function new(tile:h2d.Tile, actor:Actor) {
		super(tile);
		this.actor = actor;
	}

	override public function update(et:Float):Bool {
		final actor = this.actor;
		switch actor.state {
			case Active:
				this.x = actor.x;
				this.y = actor.y;
				return true;
			case Disused:
				PositionRef.invalidate(this);
				actor.state = Dead;
				return false;
			default:
				return false;
		}
	}
}

enum abstract ActorState(Int) {
	final Active;
	final Dead;
	final Reserved;
	final Disused;
}
