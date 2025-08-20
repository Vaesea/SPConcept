package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class Bambi extends FlxSprite
{
    var speed = 100;
    var deceleration = 600; // set it to a number like 1000 for it to stop basically instantly

    // stole this from friday night funkin' but i dont think i ever could've found a way to do this if i tried
    // and this is for something related to an fnf mod anyways. i just needed to do something quickly, and at least i know how to use xml spritesheets now!
	public function new(x:Float, y:Float)
	{
        super(x, y);

        var bambiSpritesheet = FlxAtlasFrames.fromSparrow("assets/images/characters/bambi.png", "assets/images/characters/bambi.xml");
        frames = bambiSpritesheet;

        animation.addByPrefix("idle", "idle", 24, false);
        animation.addByPrefix("left", "left", 24, false); // unused, might use it for a cutscene.
        animation.addByPrefix("right", "right", 24, false);

        animation.play("idle", false, false, 0);
    }
    
    function movement()
    {
        if (FlxG.keys.anyPressed([LEFT, A]))
        {
            velocity.x = -speed;
        }
        else if (FlxG.keys.anyPressed([RIGHT, D]))
        {
            velocity.x = speed;
        }
        // else if (FlxG.keys.anyPressed([LEFT, A]) && FlxG.keys.anyPressed([RIGHT, D]))
        // {
        //     velocity.x = 0; // this might be the absolute worst way to do this...
        // }
        // commented shit above didnt work lol
        if (velocity.x == 0)
        {
            animation.play("idle", false, false, 0);
        }
        else if (velocity.x > 0)
        {
            animation.play("right", false, false, 0);
            flipX = false;
        }
        else if (velocity.x < 0)
        {
            animation.play("right", false, false, 0);
            flipX = true;
        }
        drag.x = deceleration;
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
        movement();
    }
}
