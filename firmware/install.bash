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

cd ~

# TFT touchscreen calibration
echo "install....TFT touchscreen"
echo "Copy: SUBSYSTEM==\"input\", ATTRS{name}==\"stmpe-ts\", ENV{DEVNAME}==\"*event*\", SYMLINK+=\"input/touchscreen\""
#SUBSYSTEM=="input", ATTRS{name}=="stmpe-ts", ENV{DEVNAME}=="*event*", SYMLINK+="input/touchscreen" 
echo "Exit: Ctrl + X ; Y"
sudo nano /etc/udev/rules.d/95-stmpe.rules
sudo rmmod stmpe_ts; sudo modprobe stmpe_ts
ls -l /dev/input/touchscreen
sudo apt-get install evtest tslib libts-bin
#sudo TSLIB_FBDEVICE=/dev/fb1 TSLIB_TSDEVICE=/dev/input/touchscreen ts_calibrate

# MPR121 Adafruit touchpad
echo "install...MPR121 touchpad"
sudo pip3 install adafruit-blinka
sudo pip3 install adafruit-circuitpython-mpr121
#git clone https://github.com/adafruit/Adafruit_CircuitPython_MPR121.git
#cd Adafruit_CircuitPython
#sudo python setup.py


# DRV2605 haptic driver
sudo pip3 install adafruit-circuitpython-drv2605
#git clone https://github.com/adafruit/Adafruit_CircuitPython_DRV2605.git
#cd Adafruit_CircuitPython
#sudo python setup.py

## call test.bash
cd firmware/firmware
sudo sh test.bash

echo "install.....COMPLETE"
echo "............................................"

exit
