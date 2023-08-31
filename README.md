Hi! This is basically a rasberry host for a StreamDeck and MIDI device - which sends signals over UDP.

The assets folder is where the assets for the images displayed on the streamdeck are. If you would like for it to be different, feel free to edit it. 

Before you use this system for good to stream the inputs - you're going to have to configure the UDP IP stuff on the rasberry pi. 

I have a separate file called UDP_utils.py where you can input your specific settings, and it will go into the code. 

Other than that, run the installation file "midi_req_installer.sh" and you should be totally good to go on your raspi if you correctly inputted the output UDP_utils.py 

