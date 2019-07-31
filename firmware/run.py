#*** Precision Microdrives [PMD] ***
#* Haptic Feedback Evaluation Kit 2.0 [HFEK2]
#- Tristan Cool
#- July 2109

#***************************************************#
#    This script is the master system run           #
#***************************************************#

### --- TITLE ---
print("............. -PMD HFEK2- ..................")
print("run.py")

### --- IMPORT ---
import mpr121touch
import drv2605


### --- SYSTEM ---


### --- FUNCTION ---
def run():
   touched = mpr121touch.mpr121_run()
   if touched[3]:
       print("touchpad haptic")
       drv2605.drv_set_run(1,1)

### --- DEBUG ---


### --- RUN ---
while True:
	run()

print("run....stopping")
print("...........................................")
