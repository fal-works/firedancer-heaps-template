class Settings {
	/**
		The world width.
	**/
	public static inline final WORLD_WIDTH = 600;

	/**
		The world height.
	**/
	public static inline final WORLD_HEIGHT = 800;

	/**
		The margin for `HabitableZone`.
	**/
	public static inline final HABITABLE_ZONE_MARGIN = 64;

	/**
		Maximum number of `Thread` available per each `Actor`.
	**/
	public static inline final THREAD_POOL_CAPACITY = 8;

	/**
		Memory capacity in bytes per each `Thread`.
	**/
	public static inline final MEMORY_CAPACITY = 256;

	/**
		The y-component of the initial position of the first actor.
	**/
	public static inline final FIRST_ACTOR_X = 0.0;

	/**
		The y-component of the initial position of the first actor.
	**/
	public static inline final FIRST_ACTOR_Y = 200.0;

	/**
		The x-component of the target position of all actors.
	**/
	public static inline final TARGET_X = 0.0;

	/**
		The y-component of the target position of all actors.
	**/
	public static inline final TARGET_Y = 0.75 * WORLD_HEIGHT;
}
