package system;

import firedancer.vm.PositionRef;
import Settings.*;

class ActorSystem extends h2d.Object {
	final agents:ActorGroup;
	final bullets:ActorGroup;
	final context:FiredancerContext;

	public function new(programPackage:firedancer.vm.ProgramPackage, ?parent:h2d.Object) {
		super(parent);

		final agentTile = hxd.Res.agent.toTile().center();
		final agents = new ActorGroup(agentTile, this);

		final bulletTile = hxd.Res.bullet.toTile().center();
		final bullets = new ActorGroup(bulletTile, this);

		final mainProgram = programPackage.getProgramByName("main");

		agents.use().reset(FIRST_ACTOR_X, FIRST_ACTOR_Y, 0.0, 0.0, mainProgram);

		this.context = {
			programPackage: programPackage,
			emitter: new Emitter(bullets),
			eventHandler: new EventHandler(),
			targetPositionRef: PositionRef.createImmutable(TARGET_X, TARGET_Y)
		};
		this.agents = agents;
		this.bullets = bullets;
	}

	public function update() {
		final context = this.context;
		this.agents.update(context);
		this.bullets.update(context);
	}
}
