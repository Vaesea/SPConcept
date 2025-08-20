package;

import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState
{
	var bambi:Bambi;

	override public function create()
	{
		bambi = new Bambi(0, 0);
		add(bambi);

		super.create();

		FlxG.camera.zoom = 0.9;

	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
