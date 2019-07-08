#!/bin/bash

#*** Precision Microdrives [PMD] ***
#* Haptic Feedback Evaluation Kit 2.0 [HFEK2]
#- Tristan Cool
#- July 2109

#***************************************************#
#    This script installs systems.				    #
#	 -executes test script							#
#***************************************************#

echo "............. -PMD HFEK2- .................."
echo "install.bash"

# TFT touchscreen calibration
echo "install....Touchscreen"
echo "Copy: SUBSYSTEM==\"input\", ATTRS{name}==\"stmpe-ts\", ENV{DEVNAME}==\"*event*\", SYMLINK+=\"input/touchscreen\""
#SUBSYSTEM=="input", ATTRS{name}=="stmpe-ts", ENV{DEVNAME}=="*event*", SYMLINK+="input/touchscreen" 
echo "Exit: Ctrl + X ; Y"
sudo nano /etc/udev/rules.d/95-stmpe.rules
sudo rmmod stmpe_ts; sudo modprobe stmpe_ts
ls -l /dev/input/touchscreen
sudo apt-get install evtest tslib libts-bin
echo "Test"
sudo evtest /dev/input/touchscreen

## call test.bash
sudo sh test.bash

echo "install.....COMPLETE"
echo "............................................"

exit