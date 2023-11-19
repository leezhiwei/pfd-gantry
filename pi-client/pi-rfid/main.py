#!/usr/bin/env python

import RPi.GPIO as GPIO
from mfrc522 import SimpleMFRC522
reader = SimpleMFRC522()
while True:
    try:
        print(f'Card ID is {reader.read()[0]}')
    except KeyboardInterrupt:
        exit()
    except:
        print("Error")
    finally:
        GPIO.cleanup()

