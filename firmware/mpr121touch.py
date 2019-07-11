#*** Precision Microdrives [PMD] ***
#* Haptic Feedback Evaluation Kit 2.0 [HFEK2]
#- Tristan Cool
#- July 2109

#***************************************************#
#    This script is the Adafruit MPR121 touchpad    #
#***************************************************#

### --- TITLE ---
print("............. -PMD HFEK2- ..................")
print("mpr121touch.py")

### --- IMPORT ---
import time
import board
import busio
import adafruit_mpr121
import subprocess

### --- SYSTEM ---
#I2C bus
i2c = busio.I2C(board.SCL, board.SDA)

#MPR121
mpr121 = adafruit_mpr121.MPR121(i2c)

#Touchpad keys
#[0] : Return
#[1] : Left
#[2] : Play
#[3] : Select
#[4] : PMD
#[0] : Right

### --- FUNCTION ---
def mpr121_run():
    for i in range(12):
        if mpr121[i].value:
            print('Input {} touched!'.format(i))
    time.sleep(0.25)

    touched = mpr121.touched_pins

    #Reset = Return + PMD
    if touched[0] and touched[4]:
        print("*** MPR121: RESET ***")
        subprocess.call("./reset.bash", shell=True);

    #Shutdown = Left + Play + Right
    if touched[1] and touched[2] and touched[5]:
        print("*** MPR121: SHUTDOWN ***")
        subprocess.call("./shutodwn.bash", shell=True);


### --- TEST/DEBUG ---
def mpr121_test():
    print("*** MPR: TEST ***")
    for i in range(12):
        if mpr121[i].value:
            print('Input {} touched!'.format(i))

### --- RUN ---
print("MPR121 - touchpad")

while True:
	mpr121_run()
