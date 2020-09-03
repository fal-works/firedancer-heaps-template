import sinker.Maybe;
import firedancer.vm.Program;
import firedancer.vm.PositionRef;
import system.ActorGroup;

class Emitter extends firedancer.vm.Emitter {
	final bullets:ActorGroup;

	public function new(bullets:ActorGroup) {
		this.bullets = bullets;
	}

	override public function emit(x:Float, y:Float, vx:Float, vy:Float, fireCode:Int, program:Maybe<Program>, originPositionRef:Maybe<PositionRef>):Void {
		// Note: You may branch the process according to `fireCode`.

		this.bullets.use().reset(x, y, vx, vy, program.nullable(), originPositionRef.nullable());
	}
}
