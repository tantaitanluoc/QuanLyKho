use QuanLyKho
go

insert into AccountRole(roleDescription) values(N'admin')
insert into AccountRole(roleDescription) values(N'staff')

insert into Account(displayName,userName,password,roleId) values(
	N'Hoan',
	N'admin',
	N'root',
	1
)
insert into Account(displayName,userName,password,roleId) values(
	N'Nhân viên quèn',
	N'staff',
	N'staff',
	2
)


--use master
--drop database QuanLyKho