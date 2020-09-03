import firedancer.vm.ProgramPackage;
import firedancer.script.Api.*;
import firedancer.script.ApiEx.*;

class BulletPatterns {
	/**
		Define your own pattern here.
	**/
	public static function create(): ProgramPackage {
		final main = [
			shot.speed.set(3),
			parallel([
				loop([
					radial(2, nWay(7, { angle: 30 })),
					shot.direction.add(30),
					wait(15)
				]),
				[
					shot.direction.add(90),
					loop([
						radial(2, line(7, {
							shotSpeedChange: 1.2 })),
						shot.direction.add(30),
						wait(15)
					])
				]
			])
		];

		final assembly = compileToAssembly(["main" => main], true);
		// trace("\n" + assembly.toString());

		final programPackage = assembly.assemble();
		// trace("\n" + programPackage.toString());

		return programPackage;
	}
}
