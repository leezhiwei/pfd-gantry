--uncomment this section to create the database first

/*
Create Database DataCollection_1
GO
*/

--then comment the "create database" and uncomment use Datacollection to create the table below
--use Datacollection;

--drop table if exists Employee
--drop table if exists shift
--drop table if exists Record

Use Datacollection_1
GO

/*
CREATE TABLE Shift(
  ShiftID int NOT NULL,
  ShiftIn datetime NOT NULL,
  ShiftOut datetime NOT NULL,
  CONSTRAINT PK_Shift PRIMARY KEY (ShiftID)
);
GO



CREATE TABLE Employee(
  EmployeeID int NOT NULL,
  FullName varchar(50) NOT NULL,
  ShiftID int NOT NULL,
  CONSTRAINT PK_Employee PRIMARY KEY (EmployeeID),
  CONSTRAINT FK_Employee_ShiftID FOREIGN KEY (ShiftID) 
  REFERENCES Shift(ShiftID)
  
);


--not splitting the names to make it easier

CREATE TABLE Record(
  RecordID int NOT NULL,
  EmployeeID int NOT NULL,
  RfidID int NOT NULL,
  TimeIn datetime NOT NULL,
  TimeOut datetime NULL,
  CONSTRAINT PK_Record PRIMARY KEY (RecordID),
  CONSTRAINT FK_Record_EmployeeID FOREIGN KEY (EmployeeID)
  REFERENCES Employee(EmployeeID),
);

insert into Shift (ShiftIn, ShiftOut, ShiftID) values ('9:00 AM', '5:00 PM', 1);
insert into Shift (ShiftIn, ShiftOut, ShiftID) values ('9:00 AM', '5:00 PM', 2);

insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Christoforo Surgenor', 1);
insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Des Kinnard', 2);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Krystle Hackford', 3);
insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Zack Pescod', 4);
insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Vivyanne Enrico', 5);
insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Hildegarde Chomicki', 6);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Barty Anfonsi', 7);
insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Englebert Orneblow', 8);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Krystal Sink', 9);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Osmond Tottle', 10);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Zarla Shapiro', 11);
insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Roley Klein', 12);
insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Papagena Moral', 13);
insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Leontine Perl', 14);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Ignazio Donson', 15);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Yoko Frowing', 16);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Jordan Landa', 17);
insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Renelle Gonnin', 18);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Victoria Cheak', 19);
insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Annetta Hughes', 20);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Kimble Narbett', 21);
insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Jeni Robelin', 22);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Kanya Slowly', 23);
insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Lorettalorna Walentynowicz', 24);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Blakeley Forlonge', 25);
insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Estelle Mounch', 26);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Germain Olpin', 27);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Janetta Daintree', 28);
insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Astra Pascow', 29);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Leola Cuttin', 30);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Adore Mottershead', 31);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Verile Millican', 32);
insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Zuzana Patters', 33);
insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Ritchie Rumsey', 34);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Pearce Waddams', 35);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Morgan Robson', 36);
insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Arley Harsant', 37);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Fransisco Wharfe', 38);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Ximenez Tong', 39);
insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Marlene Simms', 40);
insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Paulita Magovern', 41);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Karl Aucock', 42);
insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Sonni Nisco', 43);
insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Tiffy Hawking', 44);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Cassi Discombe', 45);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Reta McKevin', 46);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Andrei Fenwick', 47);
insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Angus Lammertz', 48);
insert into Employee (ShiftID, FullName, EmployeeID) values (1, 'Gisela Keepin', 49);
insert into Employee (ShiftID, FullName, EmployeeID) values (2, 'Keith Saint', 50);



insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (10, 1, 1, '2023-02-22 07:32:41', '2023-10-08 19:56:17');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (28, 2, 2, '2023-04-11 12:07:13', '2023-02-25 05:49:15');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (26, 3, 3, '2023-08-13 13:58:49', '2023-05-19 00:31:52');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (43, 4, 4, '2023-04-09 09:20:07', '2023-05-06 10:44:26');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (31, 5, 5, '2023-07-01 06:58:56', '2022-12-12 23:31:34');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (27, 6, 6, '2023-08-14 18:06:36', '2022-12-21 10:21:06');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (17, 7, 7, '2023-10-27 21:57:28', '2023-09-25 04:02:15');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (30, 8, 8, '2023-07-24 12:40:56', '2023-05-24 21:38:53');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (24, 9, 9, '2023-08-23 18:19:37', '2023-10-20 12:45:09');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (28, 10, 10, '2023-06-09 02:20:18', '2023-03-23 16:31:44');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (33, 11, 11, '2023-01-06 17:45:53', '2023-10-23 09:37:06');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (17, 12, 12, '2023-08-04 22:34:11', '2023-07-14 08:33:35');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (43, 13, 13, '2023-06-07 05:58:46', '2023-07-08 19:45:57');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (18, 14, 14, '2022-12-03 09:21:31', '2023-01-20 14:43:46');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (1, 15, 15, '2023-09-06 14:10:10', '2022-12-09 00:01:25');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (49, 16, 16, '2023-05-28 06:03:58', '2023-06-21 03:39:58');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (28, 17, 17, '2023-07-04 20:19:58', '2023-07-27 15:58:58');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (24, 18, 18, '2023-07-28 14:01:06', '2023-04-13 16:07:24');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (48, 19, 19, '2023-06-21 14:38:42', '2023-10-22 07:43:36');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (20, 20, 20, '2023-09-15 00:35:24', '2022-11-10 05:41:40');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (43, 21, 21, '2023-09-20 15:33:04', '2023-08-19 21:00:16');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (32, 22, 22, '2023-01-16 23:49:44', '2023-06-05 14:53:35');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (23, 23, 23, '2023-03-02 08:26:07', '2022-12-11 02:48:50');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (22, 24, 24, '2023-09-02 13:17:03', '2023-05-25 02:20:48');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (45, 25, 25, '2023-04-30 15:40:41', '2023-04-18 11:55:18');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (32, 26, 26, '2023-01-06 03:32:38', '2023-06-29 11:55:11');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (44, 27, 27, '2023-10-06 00:25:53', '2023-11-03 07:33:00');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (3, 28, 28, '2023-01-18 22:10:29', '2023-05-24 14:24:38');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (48, 29, 29, '2023-08-03 07:38:26', '2023-05-05 23:33:20');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (24, 30, 30, '2023-05-09 03:13:55', '2023-04-16 05:34:20');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (3, 31, 31, '2023-04-06 00:21:11', '2023-11-01 15:35:11');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (46, 32, 32, '2023-01-01 21:36:22', '2023-06-25 21:15:31');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (43, 33, 33, '2023-09-05 16:04:25', '2023-07-06 19:30:42');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (25, 34, 34, '2023-03-15 16:08:56', '2023-06-24 03:26:59');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (6, 35, 35, '2022-12-29 08:58:46', '2023-07-29 22:01:10');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (39, 36, 36, '2023-07-24 15:57:37', '2023-05-14 08:29:04');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (30, 37, 37, '2023-04-26 14:47:40', '2023-06-12 17:58:31');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (14, 38, 38, '2023-01-02 07:14:14', '2023-01-27 20:33:06');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (21, 39, 39, '2023-05-09 06:36:14', '2022-12-24 04:40:02');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (48, 40, 40, '2023-10-30 02:52:39', '2022-12-15 11:25:34');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (28, 41, 41, '2023-03-16 06:53:05', '2023-09-15 13:45:41');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (29, 42, 42, '2023-03-09 00:46:34', '2023-01-20 15:20:33');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (49, 43, 43, '2023-09-13 23:59:15', '2023-05-21 22:39:00');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (8, 44, 44, '2023-02-22 00:40:13', '2023-04-17 20:52:49');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (9, 45, 45, '2022-12-02 10:16:57', '2023-03-01 01:03:06');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (50, 46, 46, '2023-05-26 11:15:58', '2023-03-04 09:46:56');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (28, 47, 47, '2023-08-07 13:01:35', '2023-01-16 04:52:23');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (45, 48, 48, '2023-10-18 11:36:44', '2023-02-28 02:48:04');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (2, 49, 49, '2023-04-20 23:10:58', '2023-09-29 05:13:27');
insert into Record (EmployeeID, RecordID, RfidID, TimeIn, TimeOut) values (14, 50, 50, '2023-09-16 15:01:13', '2023-05-11 19:38:19');
*/

SELECT * FROM Record;