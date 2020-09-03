package system;

import h2d.SpriteBatch;

class ActorGroup {
	static inline final actorRotationVelocity = 0.03;

	static function createBatch(tile:h2d.Tile, parent:h2d.Object):SpriteBatch {
		final batch = new SpriteBatch(tile, parent);
		batch.x = Settings.WORLD_WIDTH / 2;
		batch.hasUpdate = true;
		if (actorRotationVelocity != 0.0)
			batch.hasRotationScale = true;

		return batch;
	}

	final spriteBatch:SpriteBatch;
	final actors:Array<Actor>;
	final reservedActors:Array<Actor>;

	public function new(tile:h2d.Tile, parent:h2d.Object) {
		this.spriteBatch = createBatch(tile, parent);
		this.actors = [];
		this.reservedActors = [];
	}

	public function update(context:FiredancerContext):Void {
		this.updateActors(context);
		this.activateReservedActors();
	}

	/**
		Finds a new available actor (if not found, creates a new one) and reserves it to be activated.
		Be sure to call `reset()` on the returned `Actor`.
	**/
	public function use():Actor {
		final found = findAvailableActor();
		final actor = if (found != null) found else this.newActor();

		actor.state = Reserved;
		this.reservedActors.push(actor);

		return actor;
	}

	function findAvailableActor():Null<Actor> {
		final actors = this.actors;

		for (i in 0...actors.length) {
			final actor = actors[i];
			switch actor.state {
				case Dead:
					return actor;
				default:
			}
		}

		return null;
	}

	function newActor():Actor {
		final actor = new Actor(this.spriteBatch.tile);
		this.actors.push(actor);
		return actor;
	}

	function updateActors(context:FiredancerContext):Void {
		final actors = this.actors;
		for (i in 0...actors.length) {
			final actor = actors[i];
			switch actor.state {
				case Active:
					actor.update(context);
					actor.batchElement.rotation += actorRotationVelocity;
				default:
			}
		}
	}

	function activateReservedActors():Void {
		final reservedActors = this.reservedActors;
		for (i in 0...reservedActors.length) {
			final actor = reservedActors[i];
			actor.state = Active;
			final batchElement = actor.batchElement;
			batchElement.rotation = 0.0;
			this.spriteBatch.add(batchElement);
		}

		reservedActors.resize(0);
	}
}
