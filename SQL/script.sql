create database QuanLyKho
go
use QuanLyKho
go

create table MeasuringUnit(
	id int identity(1,1) primary key,
	unit nvarchar(1000)
)
go
create table Supplier(
	id int identity(1,1) primary key,
	name nvarchar(1000),
	addrs nvarchar(1000),
	phoneNo nvarchar(15),
	email nvarchar(500),
	moreInfo nvarchar(1000),
	contractDate datetime
)
go
create table Customer(
	id int identity(1,1) primary key,
	name nvarchar(1000),
	addrs nvarchar(1000),
	phoneNo nvarchar(15),
	email nvarchar(500),
	moreInfo nvarchar(1000),
	contractDate datetime
)
go
create table Material(
	id nvarchar(128) primary key,
	name nvarchar(1000),
	unitId int not null,
	supplierId int not null,
	qrCode nvarchar(max),
	barcode nvarchar(max)
	
	foreign key(unitId) references MeasuringUnit(id),
	foreign key(supplierId) references Supplier(id)
)
go
create table AccountRole(
	id int identity(1,1) primary key,
	roleDescription nvarchar(100)
)
go
create table Account(
	id int identity(1,1) primary key,
	userName nvarchar(1000),
	displayName nvarchar(500),
	password nvarchar(max),
	roleId int not null,
	
	foreign key(roleId) references AccountRole(id)
)
go
create table Import(
	id nvarchar(128) primary key,
	importDate DateTime
)
go
create table ImportInfo(
	id nvarchar(128) primary key,
	materialId nvarchar(128) not null,
	importId nvarchar(128) not null,
	count int,
	imPrice float default 0,
	exPrice float default 0,
	status nvarchar(1000)
	
	foreign key(materialId) references Material(id),
	foreign key(importId) references Import(id)
)
go
create table Export(
	id nvarchar(128) primary key,
	exportDate DateTime
)
go
create table ExportInfo(
	id nvarchar(128) primary key,
	materialId nvarchar(128) not null,
	exportId nvarchar(128) not null,
	customerId int not null,
	count int,
	status nvarchar(1000)
	
	foreign key(materialId) references Material(id),
	foreign key(customerId) references Customer(id),
	foreign key(exportId) references Export(id)
)
go
