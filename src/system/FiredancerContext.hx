package system;

import firedancer.vm.ProgramPackage;
import firedancer.vm.PositionRef;

@:structInit
class FiredancerContext {
	public final programPackage:ProgramPackage;
	public final emitter:Emitter;
	public final eventHandler:EventHandler;
	public final targetPositionRef:PositionRef;
}
