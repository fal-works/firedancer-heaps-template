import system.Actor;

class EndCodeHandler {
	/**
		@param endCode The end code returned from `firedancer.vm.Vm.run()`.
	**/
	public static function run(actor:Actor, endCode:Int):Void {
		// Note: You may branch the process according to `endCode`.

		switch endCode {
			case -1: // Value `-1` is reserved to kill the actor.
				actor.state = Disused;
			default:
		}
	}
}
