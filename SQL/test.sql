use QuanLyKho
go

select * from Supplier

insert into AccountRole(roleDescription) values(N'admin')
insert into AccountRole(roleDescription) values(N'staff')

insert into Import(id,importDate) values(N'1',GETDATE())

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


select * from ImportInfo, Material
where ImportInfo.materialId = Material.id;

select * from ExportInfo, Material
where ExportInfo.materialId = Material.id;


--use master
--drop database QuanLyKho