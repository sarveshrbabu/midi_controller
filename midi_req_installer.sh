#!/bin/bash
#
# Installation Script
#
# Description: This script installs and starts the MIDI service on your Rasberry pi for the Worlde Easycontrol 9 and the StreamDeck. 
#
# Make sure to have the other python file and service unit files in the same directory.
#
# Author: Sarvesh Babu 
# Date: August 29, 2023 
# Version: 1.0 
#
# Usage: ./install.sh  

# Update package lists 
sudo apt update 
sudo apt install alsa-utils 
sudo apt install xdotool 

#let's load in python 
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
                         libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
                         xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

# Install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# Configure pyenv in the current shell session
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Install the desired Python version
pyenv install 3.11 

# Set the desired Python version as global
pyenv global 3.11

#setup the midi service 
sudo systemctl enable worlde_midi.service
sudo systemctl start worlde_midi.service

#install the streamdeck dependencies 
pip install pillow 
pip install streamdeck 

#setup the streamdeck service 
sudo systemctl enable streamdeck.service
sudo systemctl start streamdeck.service

