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
  ShiftID int IDENTITY (1,1) NOT NULL,
  ShiftIn time NOT NULL,
  ShiftOut time NOT NULL,
  CONSTRAINT PK_Shift PRIMARY KEY (ShiftID)
);
GO



CREATE TABLE Employee(
  EmployeeID int IDENTITY (1,1) NOT NULL,
  FullName varchar(50) NOT NULL,
  ShiftID int NOT NULL,
  RfidID int NOT NULL,
  CONSTRAINT PK_Employee PRIMARY KEY (EmployeeID),
  CONSTRAINT FK_Employee_ShiftID FOREIGN KEY (ShiftID) 
  REFERENCES Shift(ShiftID)
  
);


--not splitting the names to make it easier

CREATE TABLE Record(
  RecordID int IDENTITY (1,1) NOT NULL,
  EmployeeID int NOT NULL,
  TimeIn datetime NOT NULL,
  TimeOut datetime NULL,
  CONSTRAINT PK_Record PRIMARY KEY (RecordID),
  CONSTRAINT FK_Record_EmployeeID FOREIGN KEY (EmployeeID)
  REFERENCES Employee(EmployeeID),
  
);
*/

/*
--shift data
insert into Shift(ShiftIn, ShiftOut) values ('9:00 AM', '5:03 PM');
insert into Shift(ShiftIn, ShiftOut) values ('9:00 AM', '5:11 PM');

--employee data 50 rows
insert into Employee (FullName, ShiftID, RfidID) values ('Viviana Gascoyne', 2, 53);
insert into Employee (FullName, ShiftID, RfidID) values ('Rebbecca Belk', 2, 633);
insert into Employee (FullName, ShiftID, RfidID) values ('Jillene Crowdson', 1, 663);
insert into Employee (FullName, ShiftID, RfidID) values ('Karlotta Cuckson', 2, 908);
insert into Employee (FullName, ShiftID, RfidID) values ('Prentice Asey', 2, 259);
insert into Employee (FullName, ShiftID, RfidID) values ('Pryce Le Frank', 1, 436);
insert into Employee (FullName, ShiftID, RfidID) values ('Linus Castellani', 1, 250);
insert into Employee (FullName, ShiftID, RfidID) values ('Chariot Tallyn', 1, 793);
insert into Employee (FullName, ShiftID, RfidID) values ('Emmaline Wasbey', 1, 580);
insert into Employee (FullName, ShiftID, RfidID) values ('Seline Balma', 2, 664);
insert into Employee (FullName, ShiftID, RfidID) values ('Sigvard Lenney', 2, 678);
insert into Employee (FullName, ShiftID, RfidID) values ('Sella Mariel', 1, 381);
insert into Employee (FullName, ShiftID, RfidID) values ('Pedro Doldon', 1, 856);
insert into Employee (FullName, ShiftID, RfidID) values ('Correy Fonso', 1, 921);
insert into Employee (FullName, ShiftID, RfidID) values ('Feliza Wherry', 1, 517);
insert into Employee (FullName, ShiftID, RfidID) values ('Andie Tomkys', 1, 819);
insert into Employee (FullName, ShiftID, RfidID) values ('Lacey Fairbeard', 1, 365);
insert into Employee (FullName, ShiftID, RfidID) values ('Lizette Egiloff', 2, 473);
insert into Employee (FullName, ShiftID, RfidID) values ('Auroora Durbann', 1, 459);
insert into Employee (FullName, ShiftID, RfidID) values ('Beryle Hadfield', 1, 534);
insert into Employee (FullName, ShiftID, RfidID) values ('Evanne Stork', 1, 352);
insert into Employee (FullName, ShiftID, RfidID) values ('Charo Sillick', 2, 728);
insert into Employee (FullName, ShiftID, RfidID) values ('Nananne Hayworth', 1, 867);
insert into Employee (FullName, ShiftID, RfidID) values ('Bram Floch', 1, 73);
insert into Employee (FullName, ShiftID, RfidID) values ('Marius Bear', 2, 928);
insert into Employee (FullName, ShiftID, RfidID) values ('Hildegarde Ivanin', 2, 181);
insert into Employee (FullName, ShiftID, RfidID) values ('Katee Raoux', 1, 12);
insert into Employee (FullName, ShiftID, RfidID) values ('Rodolphe Gowthrop', 2, 995);
insert into Employee (FullName, ShiftID, RfidID) values ('Klement Liddall', 1, 873);
insert into Employee (FullName, ShiftID, RfidID) values ('Tucky Labdon', 2, 656);
insert into Employee (FullName, ShiftID, RfidID) values ('Nye Domelow', 2, 761);
insert into Employee (FullName, ShiftID, RfidID) values ('Gerianna Rowlatt', 2, 193);
insert into Employee (FullName, ShiftID, RfidID) values ('Cliff Sherland', 1, 467);
insert into Employee (FullName, ShiftID, RfidID) values ('Spence Jefferson', 1, 940);
insert into Employee (FullName, ShiftID, RfidID) values ('Trueman Rignall', 1, 989);
insert into Employee (FullName, ShiftID, RfidID) values ('Norri Moens', 1, 593);
insert into Employee (FullName, ShiftID, RfidID) values ('Neile Cardinal', 2, 601);
insert into Employee (FullName, ShiftID, RfidID) values ('Gale Carne', 2, 408);
insert into Employee (FullName, ShiftID, RfidID) values ('Marabel Jeannaud', 2, 217);
insert into Employee (FullName, ShiftID, RfidID) values ('Katherina Freschini', 1, 855);
insert into Employee (FullName, ShiftID, RfidID) values ('Ward Prandin', 1, 181);
insert into Employee (FullName, ShiftID, RfidID) values ('Maude Vedeshkin', 1, 790);
insert into Employee (FullName, ShiftID, RfidID) values ('Domenic Mimmack', 2, 683);
insert into Employee (FullName, ShiftID, RfidID) values ('Benoit Burgen', 1, 217);
insert into Employee (FullName, ShiftID, RfidID) values ('Willey Mountfort', 1, 788);
insert into Employee (FullName, ShiftID, RfidID) values ('Valera Skeech', 1, 926);
insert into Employee (FullName, ShiftID, RfidID) values ('Dolly Goodwin', 2, 386);
insert into Employee (FullName, ShiftID, RfidID) values ('Melony Kubacki', 2, 646);
insert into Employee (FullName, ShiftID, RfidID) values ('Adora MacDiarmond', 1, 728);
insert into Employee (FullName, ShiftID, RfidID) values ('Gillan Corry', 2, 8);

--record data 70 rows
insert into Record (EmployeeID, TimeIn, TimeOut) values (45, '2023-10-08 15:43:22', '2023-08-18 05:20:59');
insert into Record (EmployeeID, TimeIn, TimeOut) values (41, '2023-05-01 05:51:12', '2023-06-13 11:08:42');
insert into Record (EmployeeID, TimeIn, TimeOut) values (43, '2023-10-28 17:01:28', '2023-01-08 23:42:15');
insert into Record (EmployeeID, TimeIn, TimeOut) values (48, '2023-07-05 07:00:28', '2023-02-20 11:57:52');
insert into Record (EmployeeID, TimeIn, TimeOut) values (22, '2023-09-05 18:24:35', '2023-02-13 08:25:48');
insert into Record (EmployeeID, TimeIn, TimeOut) values (16, '2023-03-19 06:12:06', '2023-09-18 13:29:06');
insert into Record (EmployeeID, TimeIn, TimeOut) values (49, '2023-08-10 06:29:17', '2023-06-09 06:11:00');
insert into Record (EmployeeID, TimeIn, TimeOut) values (5, '2023-05-01 23:46:54', '2023-06-29 23:10:02');
insert into Record (EmployeeID, TimeIn, TimeOut) values (29, '2023-02-18 23:15:45', '2022-12-29 05:03:58');
insert into Record (EmployeeID, TimeIn, TimeOut) values (46, '2022-12-11 13:23:11', '2023-07-28 21:39:31');
insert into Record (EmployeeID, TimeIn, TimeOut) values (30, '2022-11-25 04:44:15', '2022-11-19 21:58:25');
insert into Record (EmployeeID, TimeIn, TimeOut) values (39, '2023-07-05 13:03:54', '2023-05-03 12:52:41');
insert into Record (EmployeeID, TimeIn, TimeOut) values (7, '2022-11-22 07:49:00', '2023-08-21 09:41:13');
insert into Record (EmployeeID, TimeIn, TimeOut) values (22, '2023-08-06 23:58:27', '2023-06-02 15:07:00');
insert into Record (EmployeeID, TimeIn, TimeOut) values (7, '2023-10-29 18:05:53', '2022-11-19 00:26:37');
insert into Record (EmployeeID, TimeIn, TimeOut) values (36, '2023-09-29 02:21:38', '2023-11-04 01:47:12');
insert into Record (EmployeeID, TimeIn, TimeOut) values (41, '2023-05-19 10:48:20', '2023-09-10 17:00:24');
insert into Record (EmployeeID, TimeIn, TimeOut) values (3, '2023-04-26 18:26:27', '2023-04-06 01:32:18');
insert into Record (EmployeeID, TimeIn, TimeOut) values (4, '2023-05-13 10:36:46', '2023-02-06 15:25:26');
insert into Record (EmployeeID, TimeIn, TimeOut) values (13, '2023-09-10 04:21:28', '2023-07-07 10:13:59');
insert into Record (EmployeeID, TimeIn, TimeOut) values (8, '2022-11-25 03:48:44', '2023-01-30 02:20:24');
insert into Record (EmployeeID, TimeIn, TimeOut) values (3, '2023-04-18 08:00:58', '2023-09-27 14:18:30');
insert into Record (EmployeeID, TimeIn, TimeOut) values (6, '2023-08-23 02:12:44', '2023-05-04 16:49:22');
insert into Record (EmployeeID, TimeIn, TimeOut) values (29, '2023-01-09 17:04:54', '2023-07-02 03:52:09');
insert into Record (EmployeeID, TimeIn, TimeOut) values (27, '2023-11-01 03:48:43', '2023-08-27 07:30:31');
insert into Record (EmployeeID, TimeIn, TimeOut) values (23, '2022-11-22 06:01:39', '2023-09-19 03:52:41');
insert into Record (EmployeeID, TimeIn, TimeOut) values (27, '2023-05-09 16:30:29', '2023-11-08 04:55:57');
insert into Record (EmployeeID, TimeIn, TimeOut) values (45, '2023-05-19 12:17:30', '2023-07-26 08:36:07');
insert into Record (EmployeeID, TimeIn, TimeOut) values (34, '2023-01-24 05:41:22', '2022-12-19 14:55:15');
insert into Record (EmployeeID, TimeIn, TimeOut) values (21, '2023-06-18 15:30:27', '2023-10-21 21:55:03');
insert into Record (EmployeeID, TimeIn, TimeOut) values (47, '2023-08-28 06:00:11', '2023-08-05 22:11:38');
insert into Record (EmployeeID, TimeIn, TimeOut) values (14, '2023-10-26 01:16:24', '2023-05-31 15:48:53');
insert into Record (EmployeeID, TimeIn, TimeOut) values (24, '2023-08-30 01:19:45', '2023-09-26 09:25:22');
insert into Record (EmployeeID, TimeIn, TimeOut) values (23, '2023-10-11 10:02:33', '2023-08-25 23:42:21');
insert into Record (EmployeeID, TimeIn, TimeOut) values (44, '2023-04-23 17:47:53', '2023-05-23 13:50:54');
insert into Record (EmployeeID, TimeIn, TimeOut) values (7, '2022-11-30 03:22:42', '2023-07-28 02:43:15');
insert into Record (EmployeeID, TimeIn, TimeOut) values (36, '2023-11-03 12:31:54', '2023-08-27 17:18:53');
insert into Record (EmployeeID, TimeIn, TimeOut) values (6, '2023-06-15 05:14:04', '2023-04-07 16:08:51');
insert into Record (EmployeeID, TimeIn, TimeOut) values (35, '2023-05-16 09:14:40', '2023-08-17 04:53:22');
insert into Record (EmployeeID, TimeIn, TimeOut) values (22, '2023-08-31 12:12:21', '2023-04-13 21:18:23');
insert into Record (EmployeeID, TimeIn, TimeOut) values (41, '2023-04-04 10:37:31', '2023-04-19 16:24:48');
insert into Record (EmployeeID, TimeIn, TimeOut) values (32, '2022-12-06 08:56:34', '2023-01-21 16:49:51');
insert into Record (EmployeeID, TimeIn, TimeOut) values (49, '2023-06-21 00:53:49', '2022-12-11 13:24:14');
insert into Record (EmployeeID, TimeIn, TimeOut) values (6, '2023-09-19 01:00:54', '2022-12-18 23:05:37');
insert into Record (EmployeeID, TimeIn, TimeOut) values (12, '2023-09-02 02:32:50', '2023-08-30 05:35:32');
insert into Record (EmployeeID, TimeIn, TimeOut) values (33, '2023-05-02 01:23:53', '2022-11-18 14:30:12');
insert into Record (EmployeeID, TimeIn, TimeOut) values (38, '2023-06-14 16:07:01', '2022-12-25 01:16:32');
insert into Record (EmployeeID, TimeIn, TimeOut) values (29, '2023-06-09 17:05:57', '2023-03-29 21:34:52');
insert into Record (EmployeeID, TimeIn, TimeOut) values (50, '2022-12-30 08:07:52', '2022-12-01 13:07:10');
insert into Record (EmployeeID, TimeIn, TimeOut) values (9, '2023-01-08 09:10:19', '2023-01-17 15:48:08');
insert into Record (EmployeeID, TimeIn, TimeOut) values (10, '2022-11-25 01:17:16', '2022-11-30 07:11:18');
insert into Record (EmployeeID, TimeIn, TimeOut) values (36, '2023-04-25 05:49:59', '2022-12-08 14:23:48');
insert into Record (EmployeeID, TimeIn, TimeOut) values (10, '2023-05-19 22:52:02', '2023-04-23 16:25:12');
insert into Record (EmployeeID, TimeIn, TimeOut) values (29, '2023-08-02 03:56:19', '2023-02-27 22:44:15');
insert into Record (EmployeeID, TimeIn, TimeOut) values (44, '2023-06-22 02:57:44', '2023-04-08 22:21:33');
insert into Record (EmployeeID, TimeIn, TimeOut) values (20, '2023-01-03 22:12:59', '2023-10-29 10:55:00');
insert into Record (EmployeeID, TimeIn, TimeOut) values (46, '2023-01-03 19:53:08', '2023-11-01 20:06:28');
insert into Record (EmployeeID, TimeIn, TimeOut) values (40, '2023-01-28 03:33:50', '2023-06-10 20:27:18');
insert into Record (EmployeeID, TimeIn, TimeOut) values (25, '2023-03-03 01:30:14', '2022-12-29 13:39:49');
insert into Record (EmployeeID, TimeIn, TimeOut) values (35, '2023-07-30 20:35:45', '2023-10-17 11:28:47');
insert into Record (EmployeeID, TimeIn, TimeOut) values (9, '2023-03-26 06:56:27', '2023-09-07 16:29:34');
insert into Record (EmployeeID, TimeIn, TimeOut) values (31, '2022-11-19 21:01:57', '2023-04-26 18:07:21');
insert into Record (EmployeeID, TimeIn, TimeOut) values (4, '2023-02-18 09:06:33', '2023-07-03 00:34:02');
insert into Record (EmployeeID, TimeIn, TimeOut) values (33, '2023-04-24 06:57:14', '2023-10-19 22:03:36');
insert into Record (EmployeeID, TimeIn, TimeOut) values (36, '2023-04-20 23:41:11', '2022-12-29 03:09:07');
insert into Record (EmployeeID, TimeIn, TimeOut) values (35, '2023-06-28 08:04:39', '2022-12-07 13:05:07');
insert into Record (EmployeeID, TimeIn, TimeOut) values (30, '2022-12-10 19:31:40', '2023-09-21 04:44:44');
insert into Record (EmployeeID, TimeIn, TimeOut) values (12, '2023-09-27 21:20:17', '2023-03-19 16:51:25');
insert into Record (EmployeeID, TimeIn, TimeOut) values (36, '2023-09-27 08:32:47', '2023-05-18 11:14:13');
insert into Record (EmployeeID, TimeIn, TimeOut) values (19, '2023-02-19 20:41:23', '2023-05-31 00:07:09');

*/
SELECT * FROM Record;
