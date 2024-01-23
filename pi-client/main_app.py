import sqlite3, sys, os, time
from datetime import datetime
from pygame import mixer
from huskey.huskylib import *
from pirc522 import RFID
from functions.ttsmod import *
from playsound import playsound
import requests

#con = sqlite3.connect("main.db", isolation_level=None)
#cur = con.cursor()
reader = RFID(pin_irq = None, antenna_gain=7)
hl = HuskyLensLibrary("I2C", "", address=0x32)
sitename = "http://192.168.211.28"
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
        #row = cur.execute("SELECT RfidID FROM Employee WHERE FaceID = ?", (ID, )).fetchone();
        timereq = requests.post(f"{sitename}/api/retrievefromfaceid.php", data={"FaceID":ID})
        print("Face Detected")
        try:
            data = timereq.json()
        except:
            print("Invalid FaceID")
            continue
        if data:
            if len(data) == 1:
                rid = 0
                RfidID = data[0]["RfidID"]
                uid = reader.read_id(as_number = True)
                if uid is not None:
                    rid = uid 
                    print("GetRFID")
                if RfidID == rid:
                    print("Matched")
                    EID = data[0]["EmployeeID"]
                    name = data[0]["FullName"]
                    try:
                        r = requests.post(f"{sitename}/api/retrieverecordcount.php", data={"EmployeeID": EID})
                        rr = int(r.content)
                    except:
                        print("Cannot retrieve record count")
                        continue
                    if rr > 0:
                        if rr % 2 == 0:
                            entry = True
                        else:
                            leave = True
                    else:
                        entry = True
                    #rt = cur.execute("SELECT ShiftIn, ShiftOut FROM Shift WHERE ShiftID = ?", (r[2], )).fetchone()
                    try:
                        req = requests.post(f"{sitename}/api/getshift.php", data={"ShiftID":data[0]["ShiftID"]})
                        rt = req.json()
                    except:
                        print("Cannot get shift")
                        continue
                    try:
                        #check double entry
                        req = requests.post(f"{sitename}/api/checkbytime.php", data={"EmployeeID": EID})
                        doubleentry = int(req.content)
                    except:
                        print("Did not contact doubleentry endpoint correctly")
                        continue
                    if doubleentry > 0:
                        print("Double Entry")
                        continue
                    sin = rt[0]["ShiftIn"]
                    sout = rt[0]["ShiftOut"]
                    if entry:
                        expsin = datetime.strptime(sin, '%H:%M:%S').time()
                        dtcomb = datetime.combine(datetime.today(), expsin)
                        if dtcomb >= datetime.now():
                            lateearly = "You are early or on time for work."
                        else:
                            lateearly = "You are late for work."
                    elif leave:
                        expsin = datetime.strptime(sout, '%H:%M:%S').time()
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
                    datasent = {}
                    if entry:
                        datasent.update({"EmployeeID": EID, "TimeIn": datetime.today().strftime("%Y-%m-%d %H:%M:%S")})
                    else:
                        datasent.update({"EmployeeID": EID, "TimeOut": datetime.today().strftime("%Y-%m-%d %H:%M:%S")})
                    #cur.execute("INSERT INTO Record (EmployeeID, TimeIn) VALUES (?,?)", (EID, datetime.today().strftime("%I:%M %p")))
                    try:
                        r = requests.post(f"{sitename}/api/senddata.php", json=datasent)
                    except:
                        print("Did not send data successfully")
                        continue
                    print(datasent)
                    if (r.status_code) != 200:
                        print("Did not successfully write to DB")
                        continue
                    print(f'Hello {name}, checked in')
                    time.sleep(2)
                    print("Played")
                    continue
        else:
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
