create table Employee(
	CardID varchar(20) not null,
	Name varchar(50) not null,
	TimeIn datetime not null,
	TimeOout datetime not null,
	employeeID int not null,
	primary key(employeeID)
);

create table Shift(
	shiftID int not null,
	shiftIn datetime not null,
	shiftOut datetime not null
);

create table Record(
	recordID int not null,
	employeeID int foreign key references employee(employeeID)
);