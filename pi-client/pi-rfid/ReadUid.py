#!/usr/bin/env python

import pirc522

if __name__ == '__main__':

    try:
        reader = pirc522.RFID(pin_irq = None, antenna_gain = 4)
        while True:
            uid = reader.read_id(as_number=True)
            if uid is not None:
                print(f'{uid}')

    except KeyboardInterrupt:
        pass

    finally:
        reader.cleanup()
