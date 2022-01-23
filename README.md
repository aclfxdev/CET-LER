# CET-LER
Combined engine toggle and leave engine running resource for FiveM.

**Intro**

Hi, this is my first sort-of script, so if there's any suggestions to optimize the code or any features you'd like added, please feel free to let me know! :)

**Resource**

I wanted to find a resource for my server that would force the player to use their scroll wheel to toggle the engine on and off to use vehicles, as well as leaving the engine running if they got out of the car with it running. I searched all over the forums for such a script and couldn't find it, so I made one myself. 

The resource limits the player to the following:

* Cannot start engine with 'W' key.
* Disables auto-start when a player enters a vehicle or when vehicle is turned off.
* Toggle engine state with Scrollwheel Up only (*editable in client.lua*).
* Engine stays on after exiting the vehicle.

Due to how basic the script is, if you get into and out of the vehicle too fast the engine will turn off, I will look into this over the next few days to see what I can do about it.

Download the resource from my Github: 
