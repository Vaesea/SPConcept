package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxAssets;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.util.FlxAxes;
import flixel.util.FlxTimer;
import openfl.system.System;

class MainMenuState extends FlxState
{
    var playButton:FlxButton;
    var closeButton:FlxButton;
    var optionsButton:FlxButton;

    override public function create()
	{
        super.create();

        var bg = new FlxSprite();
        bg.loadGraphic("assets/images/menu/menubg.png", false);
        bg.x = 0;
        bg.y = 0;
        add(bg);

        var logo = new FlxSprite();
		logo.loadGraphic("assets/images/title/logo.png", false);
        logo.x = 0;
        logo.y = 25;
		logo.screenCenter(FlxAxes.X);
		add(logo);

        FlxTween.tween(logo, {y: logo.y + 35}, 0.8, {ease: FlxEase.circInOut, type: PINGPONG});

        // New button, center button, add button.
        
        playButton = new FlxButton(0, 250, "Play Game", clickPlay);
        playButton.screenCenter(FlxAxes.X);
        add(playButton);

        optionsButton = new FlxButton(0, 300, "Options", clickOptions);
        optionsButton.screenCenter(FlxAxes.X);
        add(optionsButton);
        
        closeButton = new FlxButton(0, 350, "Close Game", clickClose);
        closeButton.screenCenter(FlxAxes.X);
        add(closeButton);

        FlxG.sound.playMusic("assets/music/title.ogg", 1, true);
	}

	override public function update(elapsed:Float)
	{
        #if debug
        if (FlxG.keys.justPressed.Q) // The state will be changed to a level select once that is actually finished. For now it's a key where you go to PlayState quickly.
        {
            FlxG.sound.music.stop();
            FlxG.switchState(new PlayState());
        }
        #end
		super.update(elapsed);
	}
    
    function clickPlay() // Switches to PlayState.
    {
        FlxG.sound.music.stop();
        FlxG.sound.play("assets/music/titleEnd.ogg", 1.0);
        remove(closeButton, true);
        remove(optionsButton, true);
        remove(playButton, true);
        
        new FlxTimer().start(8.0, completeTimer); // creates timer, starts it, 8.0 seconds, does completeTimer function below. lets gooooooo.
    }

    function completeTimer(timer:FlxTimer)
    {
        FlxG.switchState(new PlayState());
    }

    function clickOptions() // Switches to OptionsState. Simple.
    {
        FlxG.sound.music.stop();
        FlxG.switchState(new OptionsState());
    }

    function clickClose() // Closes game.
    {
        System.exit(0);
    }
}
