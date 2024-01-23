import sqlite3, sys, os, time
from datetime import datetime
from pygame import mixer
from huskey.huskylib import *
from pirc522 import RFID
from functions.ttsmod import *
from playsound import playsound

con = sqlite3.connect("main.db", isolation_level=None)
cur = con.cursor()
reader = RFID(pin_irq = None, antenna_gain=7)
hl = HuskyLensLibrary("I2C", "", address=0x32)

def main():
    print("In program")
    while True:
        entry = False
        leave = False
        lateearly = ""
        try:
            ID = hl.learned().ID
        except KeyboardInterrupt:
            raise KeyboardInterrupt
        except:
            continue
        row = cur.execute("SELECT RfidID FROM Employee WHERE FaceID = ?", (ID, )).fetchone();
        if row:
            if len(row) > 0:
                rid = 0
                RfidID = row[0]
                uid = reader.read_id(as_number = True)
                if uid is not None:
                    rid = uid 
                if RfidID == rid:
                    r = cur.execute("SELECT * FROM Employee WHERE RfidID = ?", (rid, )).fetchone()
                    EID = r[0]
                    name = r[1]
                    rr = cur.execute("SELECT * FROM Record WHERE EmployeeID = ?", (EID, )).fetchall()
                    if len(rr) > 0:
                        if len(rr) % 2 == 0:
                            entry = True
                        else:
                            leave = True
                    else:
                        entry = True
                    rt = cur.execute("SELECT ShiftIn, ShiftOut FROM Shift WHERE ShiftID = ?", (r[2], )).fetchone()
                    sin = rt[0]
                    sout = rt[1]
                    if entry:
                        expsin = datetime.strptime(sin, '%H:%M %p').time()
                        dtcomb = datetime.combine(datetime.today(), expsin)
                        if dtcomb >= datetime.now():
                            lateearly = "You are early or on time for work."
                        else:
                            lateearly = "You are late for work."
                    elif leave:
                        expsin = datetime.strptime(sout, '%H:%M %p').time()
                        dtcomb = datetime.combine(datetime.today(), expsin)
                        if dtcomb >= datetime.now():
                            lateearly = "You are knocking off early or on time."
                        else:
                            lateearly = "You are knocking off late."
                    print(f"Entry {entry}, leave {leave}")
                    fileloc = speech(f'Welcome {name}, {lateearly}')
                    mixer.init()
                    mixer.music.load(fileloc)
                    mixer.music.play()
                    cur.execute("INSERT INTO Record (EmployeeID, TimeIn) VALUES (?,?)", (EID, datetime.today().strftime("%I:%M %p")))
                    print(f'Hello {name}, checked in')
                    time.sleep(2)
                    print("Played")
                    continue
if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print("Shutting Down")
        reader.cleanup()
        try:
            sys.exit(130)
        except SystemExit:
            os._exit(130)
