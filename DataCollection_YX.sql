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