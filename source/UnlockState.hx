package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class UnlockState extends FlxState
{
	var unlockText:FlxText;

    override public function create()
    {
        unlockText = new FlxText(0, 0, 0, "If this was in Steel Paperclip, you would've unlocked a new song!", 16);
        unlockText.setFormat(null, 16, FlxColor.RED, FlxTextAlign.CENTER);
        unlockText.screenCenter();
        add(unlockText);
    }
}