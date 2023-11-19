from huskylib import HuskyLensLibrary
hl = HuskyLensLibrary("I2C", "", address=0x32)
while True:
    try:
        print(hl.learned().ID)
    except KeyboardInterrupt:
        break
    except:
        continue
