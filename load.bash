#!/bin/bash

#*** Precision Microdrives [PMD] ***
#* Haptic Feedback Evaluation Kit 2.0 [HFEK2]
#- Tristan Cool
#- July 2109

#***************************************************#
#    This script is run first. 						#
#	 -configures TFT/HDMI screen					#
#    -loads dependencies and clones firmware code.	#
#	 -creates a guest user with limited access.		#
#	 -executes firmware install script				#
#***************************************************#


echo "............. -PMD HFEK2- .................."
echo "load.bash"

sudo apt-get update
sudo apt-get dist-upgrade

sudo apt-get install unzip

# TFT screen configuration
echo "load.....TFT display - Adafruit 3.5 480x320"
wget https://raw.githubusercontent.com/adafruit/Raspberry-Pi-Installer-Scripts/master/adafruit-pitft.sh
chmod +x adafruit-pitft.sh
sudo ./adafruit-pitft.sh

sudo apt-get install mplayer


# SSH configuration
echo "load....SSH RealVNC"
cd ~
sudo apt-get install realvnc-vnc-server
sudo apt-get install realvnc-vnc-viewer

# Raspberry Pi - GPIO - Python
echo "load....Python3"
sudo apt-get install python3
#echo "load....GPIO"
#sudo apt-get install python-dev python-rpi.gpio
#echo "load....PIP"
#sudo apt-get install python3-pip
##echo "load....SPI"
#sudo apt-get install python3-spidev python-spidev

# GITHUB repos code clone
echo "load.....GIT code"
sudo apt-get install git bc 
git clone https://github.com/pmd-hfek2/firmware.git
git config --global user.name "pmd-hfek2"

# Enable firmware
echo "load......firmware"
cd firmware/firmware
sudo chmod +x install.bash
sudo chmod +x update.bash
sudo chmod +x update_auto.bash
sudo chmod +x test.bash

# Create Guest user / remove Home access
cd ~
echo "load......guest user"
sudo adduser guest 
sudo chmod g+rw /home/guest
sudo chmod o-rwx /home/* 
sudo usermod -aG guest pi

echo "load.....COMPLETE"
echo "............................................"

## call install.bash
sudo sh firmware/install.bash
exit