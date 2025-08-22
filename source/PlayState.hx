package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;
import flixel.tile.FlxTilemap;

class PlayState extends FlxState
{
	// Basically all of this code is from the official Turn Based RPG HaxeFlixel tutorial.
	var bambi:Bambi;
	var map:FlxOgmo3Loader;
	var walls:FlxTilemap;
	var redOrb:RedOrb;

	override public function create()
	{
		map = new FlxOgmo3Loader("assets/data/thebambivoidproject.ogmo", "assets/data/level1.json");
		walls = map.loadTilemap("assets/images/tiles.png", "walls");
		walls.follow();
		walls.setTileProperties(1, NONE);
		walls.setTileProperties(2, ANY);
		add(walls);
		redOrb = new RedOrb();
		bambi = new Bambi();
		map.loadEntities(placeEntities, "entities");
		add(bambi);
		add(redOrb);
		FlxG.camera.follow(bambi, TOPDOWN_TIGHT, 2);
		FlxG.camera.zoom = 2.0;
		FlxG.sound.playMusic("assets/music/void.ogg", 1, true);
		super.create();
	}

	function placeEntities(entity:EntityData)
	{
		if (entity.name == "player")
		{
			bambi.setPosition(entity.x, entity.y);
		}
		if (entity.name == "redOrb")
		{
			redOrb.setPosition(entity.x, entity.y);
		}
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.collide(bambi, walls);
		FlxG.overlap(bambi, redOrb, bambiTouchRedOrb);
	}

	function bambiTouchRedOrb(bambi:Bambi, redOrb:RedOrb)
	{
		FlxG.switchState(new UnlockState());
	}
}
