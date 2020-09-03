import Settings.*;
import system.ActorSystem;

class Main extends hxd.App {
	static function main()
		new Main();

	var system: ActorSystem;

	override function init():Void {
		hxd.Res.initEmbed();

		this.engine.backgroundColor = 0xfffefdff;

		this.s2d.scaleMode = LetterBox(WORLD_WIDTH, WORLD_HEIGHT);
		final window = hxd.Window.getInstance();
		window.displayMode = Windowed;
		window.resize(WORLD_WIDTH, WORLD_HEIGHT);

		final programPackage = BulletPatterns.create();
		this.system = new ActorSystem(programPackage, s2d);
	}

	override function update(dt:Float) {
		this.system.update();
	}
}
