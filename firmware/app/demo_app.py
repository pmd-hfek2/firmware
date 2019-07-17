#*** Precision Microdrives [PMD] ***
#* Haptic Feedback Evaluation Kit 2.0 [HFEK2]
#- Tristan Cool
#- July 2109

#***************************************************#
#    This script is the PMD HFEK2 Demo App			#
#***************************************************#

### --- TITLE ---
print("............. -PMD HFEK2- APP ..................")
print("demo_app.py")

### --- IMPORT ---
import pygame
import os
import pygameui as ui
import logging
import RPi.GPIO as GPIO


## - GPIO setup
GPIO.setmode(GPIO.BCM)
#GPIO.setup(4, GPIO.OUT)

## - Format: console, logger, handler
log_format = '%(asctime)-6s: %(name)s - %(levelname)s - %(message)s'
console_handler = logging.StreamHandler()
console_handler.setFormatter(logging.Formatter(log_format))
logger = logging.getLogger()
logger.setLevel(logging.DEBUG)
logger.addHandler(console_handler)

## - Format: OS, mouse, touchscreen 
os.putenv('SDL_FBDEV', '/dev/fb1')
os.putenv('SDL_MOUSEDRV', 'TSLIB')
os.putenv('SDL_MOUSEDEV', '/dev/input/touchscreen')

### --- BACKGROUND ---
MARGIN = 20


### --- CLASS ---
class PiTft(ui.Scene):
    def __init__(self):
        ui.Scene.__init__(self)	
	
    #motor select button	
    self.motor_button = ui.Button(ui.Rect(MARGIN, MARGIN, 130, 90), 'Motor')
    self.motor_button.on_clicked.connect(self.gpi_button)
    self.add_child(self.motor_button)	

    #PMD DRV2605 button	
    self.pmd_button = ui.Button(ui.Rect(170, MARGIN, 130, 90), 'PMD')
    self.pmd_button.on_clicked.connect(self.gpi_button)
    self.add_child(self.pmd_button)	

    #Back button	
    self.back_button = ui.Button(ui.Rect(MARGIN, 130, 130, 90), '<--')
    self.back_button.on_clicked.connect(self.gpi_button)
    self.add_child(self.back_button)

    #Play button	
    self.play_button = ui.Button(ui.Rect(170, 130, 130, 90), 'PLAY')
    self.play_button.on_clicked.connect(self.gpi_button)
    self.add_child(self.play_button)
	
    def gpi_button(self, btn, mbtn):
        logger.info(btn.text)
         
        if btn.text == 'Motor':
            #GPIO.output(4, False)
        elif btn.text == 'PMD':
            #GPIO.output(4, False)
        elif btn.text == '<--':
            #GPIO.output(4, False)
        elif btn.text == 'PLAY':
            #GPIO.output(4, False)
	
## - UI / RUN 
ui.init('PMD HFEK2 Demo', (320, 240))
pygame.mouse.set_visible(False)
ui.scene.push(PiTft())
ui.run()