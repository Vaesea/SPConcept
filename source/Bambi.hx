package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Bambi extends FlxSprite
{
    // basically all of this code is from haxeflixel's turn based rpg tutorial.
    var speed = 100;
    var deceleration = 800;
    
    public function new(x:Float = 0, y:Float = 0)
    {
        super(x, y);
        loadGraphic("assets/images/characters/bambi.png", true, 32, 64);

        setFacingFlip(LEFT, true, false);
        setFacingFlip(RIGHT, false, false);

        setSize(18, 6);
        offset.set(8, 58);

        // Animation Adding. Obviously.
        animation.add("d_idle", [0], 8.0, false);
        animation.add("lr_idle", [6], 8.0, false);
        animation.add("u_idle", [3], 8.0, false);
        animation.add("d_walk", [1, 0, 2, 0], 8.0, true);
        animation.add("lr_walk", [7, 6, 8, 6], 8.0, true);
        animation.add("u_walk", [4, 3, 5, 3], 8.0, true);
    }

    override function update(elapsed:Float) 
    {
        updateMovement();
        super.update(elapsed);
    }

    function updateMovement()
    {
        var up = false;
        var down = false;
        var left = false;
        var right = false;
        var newAngle = 0;
        
        up = FlxG.keys.anyPressed([UP, W]);
        down = FlxG.keys.anyPressed([DOWN, S]);
        left = FlxG.keys.anyPressed([LEFT, A]);
        right = FlxG.keys.anyPressed([RIGHT, D]);

        if (up && down)
            up = down = false;
        if (left && right)
            left = right = false;

        if (up || down || left || right)
        {
            var newAngle = -90;
            if (up)
            {
                newAngle = -90;
                if (left)
                    newAngle -= 45;
                else if (right)
                    newAngle += 45;
                facing = UP;
            }
            else if (down)
            {
                newAngle = 90;
                if (left)
                    newAngle += 45;
                else if (right)
                    newAngle -= 45;
                facing = DOWN;
            }
            else if (left)
            {
                newAngle = 180;
                facing = LEFT;
            }
            else if (right)
            {
                newAngle = 0;
                facing = RIGHT;
            }

            // determine our velocity based on angle and speed
            velocity.setPolarDegrees(speed, newAngle);

            drag.x = drag.y = deceleration;
        }

        var action = "idle";
        // check if the player is moving, and not walking into walls
        if ((velocity.x != 0 || velocity.y != 0) && touching == NONE)
        {
            action = "walk";
        }

        switch (facing)
        {
            case LEFT, RIGHT:
                animation.play("lr_" + action);
            case UP:
                animation.play("u_" + action);
            case DOWN:
                animation.play("d_" + action);
            case _:
        }
    }
}