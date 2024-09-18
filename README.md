# ultimate-godot-midi-input-visualizer
The utimate MIDI signal visualizer made using the godot engine

This program can be used as a template for any kind of project :))
This is a godot project made using godot 4.3
It uses the primitive2D plugin from peter-kish:
https://github.com/peter-kish/primitives2d

This project is a total upgrade/rework of a more "simple" midi visualizer I made earlier:
https://github.com/filemon-filemon/godot_midi_gradation_template

A lot of the code is from my godot_sensor_midi_input_template, which is well commented if you want to work with it:
https://github.com/filemon-filemon/godot_sensor_midi_input_template

You need to plug in your control change // the interface to put your pc and your sensors in relation, before launching the program.
The program will automatically find out your sensors once you send signal thrue them.
This program is made to work with sensors sending float/integers of value between 0 and 127, which should be what a sensor pulled via midi should send.

Once launched, whenever a new sensor is activated, a pop up window will appear, with a midi visualizer linked to this particular sensor.
You can open as many windows as you want.
Each window will track the value sent by the sensor linked to them.

The first window that opened acts like a settings menu, and to close the program, it is the window to close.
Changing the speed will change the velocity of the points representing the midi value.
Changing the spawn_rate will change how frequently these points spawn.
Changing the size will change the size of the points
You cannot input values inferior to 0

On each "visualizer window", there is, on the top left corner, a little number.
This number is a count of the windows.
For exemple, if you spawn 3 windows, the first one will be "named" 0, the second 1, and the third 2, and it goes on and on.
You can change these names to organize your MIDI sensors testing as you desire.

I made this project, seeing that there wasnt really any plug and play, easy solution, released in binary // open sourced, to actually test out my MIDI sensors.
I hope it's user-friendly enough, and don't hesitate to open issues // contact me directly :)

I'm more active as a game dev on my itch.io, actually (go check out my games / comics):
https://filemon-filemon.itch.io/
