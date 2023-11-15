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
  ShiftIn datetime NOT NULL,
  ShiftOut datetime NOT NULL,
  CONSTRAINT PK_Shift PRIMARY KEY (ShiftID)
);
GO



CREATE TABLE Employee(
  EmployeeID int IDENTITY (1,1) NOT NULL,
  FullName varchar(50) NOT NULL,
  ShiftID int NOT NULL,
  CONSTRAINT PK_Employee PRIMARY KEY (EmployeeID),
  CONSTRAINT FK_Employee_ShiftID FOREIGN KEY (ShiftID) 
  REFERENCES Shift(ShiftID)
  
);


--not splitting the names to make it easier

CREATE TABLE Record(
  RecordID int IDENTITY (1,1) NOT NULL,
  EmployeeID int NOT NULL,
  RfidID int NOT NULL,
  TimeIn datetime NOT NULL,
  TimeOut datetime NULL,
  CONSTRAINT PK_Record PRIMARY KEY (RecordID),
  CONSTRAINT FK_Record_EmployeeID FOREIGN KEY (EmployeeID)
  REFERENCES Employee(EmployeeID)
);
*/

/*
insert into Shift(ShiftIn, ShiftOut) values ('9:00 AM', '5:03 PM');
insert into Shift(ShiftIn, ShiftOut) values ('9:00 AM', '5:11 PM');

insert into Employee (FullName, ShiftID) values ('Lizzie Limrick', 1);
insert into Employee (FullName, ShiftID) values ('Irwinn Kesper', 2);
insert into Employee (FullName, ShiftID) values ('Glenna Storch', 1);
insert into Employee (FullName, ShiftID) values ('Erna Harroway', 2);
insert into Employee (FullName, ShiftID) values ('Lydia Stairmand', 2);
insert into Employee (FullName, ShiftID) values ('Anne-corinne Braundt', 2);
insert into Employee (FullName, ShiftID) values ('Xaviera Scouller', 2);
insert into Employee (FullName, ShiftID) values ('Fairfax Kelle', 1);
insert into Employee (FullName, ShiftID) values ('Sean Crannage', 1);
insert into Employee (FullName, ShiftID) values ('Toby Merryman', 1);
insert into Employee (FullName, ShiftID) values ('Andree Seddon', 2);
insert into Employee (FullName, ShiftID) values ('Guillemette O''Lyhane', 2);
insert into Employee (FullName, ShiftID) values ('Selma Pley', 1);
insert into Employee (FullName, ShiftID) values ('Cello Rydzynski', 2);
insert into Employee (FullName, ShiftID) values ('Welch McVitie', 2);
insert into Employee (FullName, ShiftID) values ('Douglas Gainsbury', 1);
insert into Employee (FullName, ShiftID) values ('Cara Showt', 2);
insert into Employee (FullName, ShiftID) values ('Mickie Ventris', 2);
insert into Employee (FullName, ShiftID) values ('Lenee Harfoot', 2);
insert into Employee (FullName, ShiftID) values ('Lin Aiston', 2);
insert into Employee (FullName, ShiftID) values ('Valenka Barsby', 1);
insert into Employee (FullName, ShiftID) values ('Marga Coaker', 2);
insert into Employee (FullName, ShiftID) values ('Ira Cantopher', 1);
insert into Employee (FullName, ShiftID) values ('Cary Cracoe', 1);
insert into Employee (FullName, ShiftID) values ('Melisandra Bohlsen', 1);
insert into Employee (FullName, ShiftID) values ('Suzanne Savell', 1);
insert into Employee (FullName, ShiftID) values ('Cindi Redsull', 2);
insert into Employee (FullName, ShiftID) values ('Tomasina Arnal', 2);
insert into Employee (FullName, ShiftID) values ('Alanna Nicklinson', 1);
insert into Employee (FullName, ShiftID) values ('Patty McKeefry', 2);
insert into Employee (FullName, ShiftID) values ('Rey Heinecke', 1);
insert into Employee (FullName, ShiftID) values ('Elka Eginton', 2);
insert into Employee (FullName, ShiftID) values ('Kevina Beresford', 2);
insert into Employee (FullName, ShiftID) values ('Alden Shepley', 1);
insert into Employee (FullName, ShiftID) values ('Maisey Constanza', 2);
insert into Employee (FullName, ShiftID) values ('Artemas Burchett', 2);
insert into Employee (FullName, ShiftID) values ('Michael Harler', 2);
insert into Employee (FullName, ShiftID) values ('Mack Stapley', 2);
insert into Employee (FullName, ShiftID) values ('Kerry Fenty', 1);
insert into Employee (FullName, ShiftID) values ('Rayna Hinkensen', 1);
insert into Employee (FullName, ShiftID) values ('Darwin Hantusch', 1);
insert into Employee (FullName, ShiftID) values ('Yardley Bamforth', 1);
insert into Employee (FullName, ShiftID) values ('Jody Abbate', 2);
insert into Employee (FullName, ShiftID) values ('Prent Netti', 2);
insert into Employee (FullName, ShiftID) values ('Cleveland Agius', 1);
insert into Employee (FullName, ShiftID) values ('Walsh Schiementz', 2);
insert into Employee (FullName, ShiftID) values ('Eyde Rickesies', 2);
insert into Employee (FullName, ShiftID) values ('Philis Drysdale', 2);
insert into Employee (FullName, ShiftID) values ('Gusella Laming', 1);
insert into Employee (FullName, ShiftID) values ('Valera McAneny', 1);

insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (14, 21, '2023-06-24 03:36:52', '2023-02-06 04:11:02');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (4, 6, '2023-01-31 03:53:13', '2023-10-22 20:34:49');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (34, 165, '2023-02-03 22:07:00', '2023-02-06 05:37:41');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (12, 841, '2022-12-30 00:27:07', '2022-11-29 15:26:07');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (22, 633, '2022-12-03 13:40:01', '2023-03-02 06:18:29');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (16, 922, '2023-10-02 13:16:10', '2022-11-15 23:22:05');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (24, 636, '2023-05-27 03:06:31', '2023-04-03 23:07:43');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (16, 364, '2023-02-10 08:19:58', '2023-07-28 10:33:38');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (7, 320, '2023-04-20 15:56:07', '2023-02-19 02:49:29');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (34, 964, '2023-09-29 11:55:48', '2023-09-30 02:39:55');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (1, 274, '2022-11-30 23:36:46', '2023-11-05 17:45:34');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (44, 385, '2023-08-19 07:59:06', '2023-05-31 16:24:36');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (42, 989, '2023-01-03 06:04:29', '2023-08-25 06:02:02');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (6, 932, '2023-04-05 22:24:28', '2023-01-27 05:26:38');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (31, 3, '2023-08-29 10:53:26', '2023-08-16 20:34:10');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (2, 210, '2022-12-18 04:30:42', '2023-07-16 04:48:54');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (25, 8, '2023-07-23 00:09:22', '2023-10-22 13:33:28');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (3, 184, '2023-04-03 19:07:01', '2023-11-05 23:06:20');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (33, 756, '2022-12-12 01:00:22', '2023-07-03 09:02:24');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (41, 220, '2023-01-29 14:58:43', '2023-03-17 01:43:40');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (7, 112, '2023-05-17 15:59:17', '2023-08-28 01:43:09');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (46, 748, '2022-11-11 10:04:58', '2023-09-11 09:58:16');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (24, 248, '2023-06-23 19:28:17', '2023-07-31 21:30:37');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (28, 141, '2023-10-25 07:59:02', '2023-11-14 13:42:52');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (20, 609, '2023-01-09 12:14:00', '2023-04-05 20:42:15');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (17, 504, '2023-02-25 07:37:06', '2023-08-28 22:59:50');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (5, 170, '2023-02-14 23:18:09', '2022-12-26 21:40:35');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (49, 29, '2023-05-17 21:37:50', '2023-03-18 03:50:39');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (36, 981, '2023-05-07 13:04:14', '2023-02-11 21:19:00');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (34, 356, '2022-11-25 01:08:04', '2022-12-12 12:21:43');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (14, 606, '2023-01-04 11:10:19', '2023-07-16 04:40:29');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (12, 411, '2023-04-28 19:16:26', '2023-05-22 06:33:06');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (7, 974, '2023-08-04 12:13:01', '2023-10-10 16:02:09');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (20, 102, '2023-11-07 01:20:25', '2022-11-29 20:30:49');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (32, 266, '2023-01-25 06:19:23', '2022-11-13 13:08:42');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (32, 849, '2023-05-13 03:08:43', '2023-06-09 02:34:15');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (6, 187, '2023-06-08 20:23:11', '2023-04-04 18:51:04');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (25, 994, '2023-06-01 18:29:12', '2023-04-18 14:10:02');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (32, 645, '2023-04-14 16:04:44', '2022-11-19 05:00:35');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (21, 101, '2022-11-30 21:48:16', '2023-10-10 00:12:14');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (28, 170, '2023-03-30 12:14:00', '2023-06-04 09:14:17');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (9, 837, '2023-02-05 10:27:06', '2023-06-11 02:20:54');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (9, 198, '2023-05-11 03:27:16', '2023-10-14 22:13:48');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (44, 61, '2023-02-22 01:03:56', '2023-07-01 15:14:15');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (13, 698, '2023-01-27 22:48:41', '2023-08-22 20:42:42');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (45, 633, '2023-04-07 02:13:30', '2022-12-07 11:56:44');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (25, 760, '2023-08-13 16:08:07', '2023-01-13 19:30:41');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (38, 649, '2023-02-24 23:49:33', '2023-05-28 23:25:48');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (44, 477, '2023-06-23 10:12:36', '2023-01-25 11:12:59');
insert into Record (EmployeeID, RfidID, TimeIn, TimeOut) values (14, 304, '2023-07-22 01:44:11', '2022-12-18 22:27:56');

*/

SELECT * FROM Employee;