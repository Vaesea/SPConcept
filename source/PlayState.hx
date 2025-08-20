package;

import flixel.FlxState;

class PlayState extends FlxState
{
	var bambi:Bambi;

	override public function create()
	{
		bambi = new Bambi(0, 0);
		add(bambi);

		super.create();

	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
