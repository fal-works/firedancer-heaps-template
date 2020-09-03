import sinker.Maybe;
import firedancer.vm.Thread;
import firedancer.vm.PositionRef;

class EventHandler extends firedancer.vm.EventHandler {
	public function new() {}

	override public function onGlobalEvent(glotalEventCode:Int):Void {
		// Note: You may branch the process according to `glotalEventCode`.

		trace('Invoked global event. (code: $glotalEventCode)');
	}

	override public function onLocalEvent(localEventCode:Int, x:Float, y:Float, thread:Thread, originPositionRef:Maybe<PositionRef>,
			targetpositionRef:PositionRef):Void {
		// Note: You may branch the process according to `localEventCode` and other values.

		trace('Invoked local event. (code: $localEventCode)');
	}
}
