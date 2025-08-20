package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class Bambi extends FlxSprite
{
    // stole this from friday night funkin' but i dont think i ever could've found a way to do this if i tried
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
}
