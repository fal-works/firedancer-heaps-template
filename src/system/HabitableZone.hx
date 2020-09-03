package system;

import Settings.*;

/**
	Bounds of the habitable zone of actors.
	Horizontally centered.
**/
class HabitableZone {
	static inline final leftX:Float = -WORLD_WIDTH / 2 - HABITABLE_ZONE_MARGIN;
	static inline final topY:Float = 0 - HABITABLE_ZONE_MARGIN;
	static inline final rightX:Float = WORLD_WIDTH / 2 + HABITABLE_ZONE_MARGIN;
	static inline final bottomY:Float = WORLD_HEIGHT + HABITABLE_ZONE_MARGIN;

	/**
		@return `true` if the point `(x, y)` is in the habitable zone.
	**/
	public static inline function containsPoint(x:Float, y:Float):Bool
		return y < bottomY && topY <= y && leftX <= x && x < rightX;
}
