package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;

class OptionsState extends FlxState
{
	override public function create()
	{
		super.create();
        var noOptions:FlxText;
        var goToMenu:FlxButton;

        noOptions = new FlxText(0, 50, 0, "No Options Exist Yet!", 32);
        noOptions.setFormat(null, 32, FlxColor.RED, FlxTextAlign.CENTER);
        noOptions.screenCenter(FlxAxes.X);
        add(noOptions);
        goToMenu = new FlxButton(0, 430, "Go Back", clickBack);
        goToMenu.screenCenter(FlxAxes.X);
        add(goToMenu);

        FlxG.sound.playMusic("assets/music/options.ogg", 1, true);
	}

    function clickBack()
    {
        FlxG.sound.music.stop();
        FlxG.switchState(new MainMenuState());
    }

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}