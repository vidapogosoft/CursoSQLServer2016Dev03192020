
/*CUPONERA

1. CUPONES DE DESCUENTO
2. PROVEEDORES
2.1 PRODUTCOS
3. MULTIEMPERESA
4. BENEFICIARIOS

*/

---CREATE    (CREACIONES)
---ALTER    (MODIFICACIONES)
---DROP    (ELIMINACIONES)


USE MASTER
go

create database cuponera
on
(
	name = cuponera_data,
	filename = 'E:\SQLData16\cuponeradata.mdf',
	size = 10,
	maxsize = 50,
	filegrowth = 5
)
log on
(
	name = cuponera_log,
	filename = 'E:\SQLData16\cuponeralog.ldf',
	size = 10,
	maxsize = 50,
	filegrowth = 5
)
go

---Tablas
/*
Empresa
Proveedores
EmpresaProveedor
Productos
ProductosProveedor
Cupones
Cliente
CuponesCliente

*/

use cuponera
go

create table Empresa
(
	IdEmpresa int identity(1,1) not null,
	Identificacion varchar(15) not null,
	RazonSocial varchar(100) not null,
	FechaIngreso		date,
	HoraIngreso			Time,
	FechaModificacion   datetime,
	UsuarioIngreso		varchar(25) not null,
	UsuarioModificacion varchar(25) not null,

	constraint PK_IdEmpresa primary key clustered (IdEmpresa desc)
)

---------------------------------------------------------------------
create table Proveedores
(
	IdProveedor int identity(1,1) not null,
	Identificacion varchar(15) not null,
	RazonSocial varchar(100) not null,
	FechaIngreso		date,
	HoraIngreso			Time,
	FechaModificacion   datetime,
	UsuarioIngreso		varchar(25) not null,
	UsuarioModificacion varchar(25) not null,

	constraint PK_IdProveedor primary key clustered (IdProveedor desc)

)

---------------------------------------------------------------------

create table EmpresaProveedor
(
	IdEmpresaProveedor int identity(1,1) not null,
	
	IdEmpresa int not null,
	IdProveedor int not null,

	FechaIngreso		date,
	HoraIngreso			Time,
	FechaModificacion   datetime,
	UsuarioIngreso		varchar(25) not null,
	UsuarioModificacion varchar(25) not null,

	constraint PK_IdEmpresaProveedor primary key clustered (IdEmpresaProveedor asc)
)

---Crear relacion fk de Empresa
alter table EmpresaProveedor
with check add constraint FK_Empresa_EmpresaProveedor
foreign key (IdEmpresa)
references Empresa (IdEmpresa)

--Crear relacion de la fk Proveedor
alter table EmpresaProveedor
with check add constraint FK_Proveedor_EmpresaProveedor
foreign key (IdProveedor)
references Proveedores (IdProveedor)


----- Archivos secundarios de datos
use master
go

alter database cuponera add filegroup cuponera_data_2

alter database cuponera
add file(
	
	name = cuponera_data2,
	filename = 'E:\SQLData16\cuponeradata2.ndf',
	size = 1MB,
	maxsize = 200MB,
	filegrowth = 10MB
)to filegroup cuponera_data_2

-----------------------
use cuponera
go

select * from sys.objects

--if exists (select 1 from sys.objects where name = 'Cupones') 
--begin
--	drop table Cupones
--end



if not exists (select 1 from sys.objects where name = 'Cupones' and type = 'U' ) 
begin

	create table Cupones
	(
		IdCupon int identity(1,1) not null,
		CodigoCupon varchar(20) not null,

		IdEmpresaProveedor int not null,
	
		FechaIngreso		date,
		HoraIngreso			Time,
		FechaModificacion   datetime,
		UsuarioIngreso		varchar(25) not null,
		UsuarioModificacion varchar(25) not null,

		constraint PK_IdCupon primary key clustered (IdCupon desc)
	)on cuponera_data_2

	--Crear relacion de la fk Proveedor
	alter table Cupones
	with check add constraint FK_EmpresaProveedor_IdEmpresaProveedor
	foreign key (IdEmpresaProveedor)
	references EmpresaProveedor (IdEmpresaProveedor)

end

select * from cuponera..Cupones

---------------------------------
--restricciones en tablas sql server check y unique

use cuponera
go

---Unique
alter table proveedores
add constraint UN_Identificaion UNIQUE (Identificacion)
go

---check
alter table proveedores
add constraint CC_Identificacion CHECK (len(Identificacion) >= 10)


---------Tablas Temporales
---Fisicas
---Memoria

---Fisicas

create table #NombreTabla
(
	Secuecial int,
	Descripcion varchar(max)
)

select * from #NombreTabla

drop table #NombreTabla

---Memoria

declare @NombreTabla table
(
	Secuecial int,
	Descripcion varchar(max)
)

select * from @NombreTabla


