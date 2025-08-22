# Steel Paperclip Concept (The Bambi Void)
This is a concept for VS Dave And Bambi: Steel Paperclip Edition. Temporary Title is not it's title.

## How To Compile
These are the versions of the things I use. You may be able to install later or earlier versions of these, however, I wouldn't recommend it
1. Install Haxe 4.3.0
2. Open the terminal and enter these commands:

haxelib install lime 8.1.2

haxelib install openfl 9.3.3

haxelib install flixel 5.6.1

haxelib install flixel-addons 3.2.2

haxelib install flixel-tools 1.5.1 (Not sure what this is used for, but the haxeflixel website says you should install it, and I have it installed, so you should probably install it)

haxelib run lime setup (Needed for you to use the lime test / build platform command)

3. Now, open a terminal and build the game using one of these commands:

lime test os -debug (builds it as a debug build)

lime build os -release (builds it as a release build)

"os" can be replaced with "windows", "mac" or "linux", however you need to be on the OS you're compiling for to compile for that OS as far as I know, so for example, you need to be on Linux to compile for Linux. However, you can use virtual machines.
