package;

import flixel.FlxSprite;

class RedOrb extends FlxSprite
{
    public function new(x:Float = 0, y:Float = 0)
    {
        super(x, y);
        loadGraphic("assets/images/characters/redorb.png");

        setSize(32, 32);
    }
}