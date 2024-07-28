create database Patitas_Felices_DB
GO

use Patitas_Felices_DB
GO

--Tables
create table Pet_Types(
	_ID bigint primary key not null identity(1,1),
	_Description varchar(50) not null,
	_State bit not null default(1)
)
create table Pet_Sexes(
	_ID bigint primary key not null identity(1,1),
	_Description varchar(50) not null,
	_State bit not null default(1)
)
create table Pet_Sizes(
	_ID bigint primary key not null identity(1,1),
	_Description varchar(50) not null,
	_State bit not null default(1)
)
create table Pet_Behaviors(
	_ID bigint primary key not null identity(1,1),
	_Description varchar(50) not null,
	_State bit not null default(1)
)
create table Pets(
	_ID bigint primary key not null identity(1,1),
	_Name varchar(100) not null,
	_Description varchar(4000) null,
	_Age varchar(50) not null,
	_Breed varchar(100) not null,
	_Color varchar(100) not null,
	_ID_Sex bigint not null foreign key references Pet_Sexes(_ID),
	_ID_Type bigint not null foreign key references Pet_Types(_ID),
	_ID_Size bigint not null foreign key references Pet_Sizes(_ID),
	_ID_Behavior bigint not null foreign key references Pet_Behaviors(_ID),
	_Location varchar(200) not null default('Sin Completar'),
	_Link varchar(1000) null,
	_Dischard_Date date not null default(getdate()),
	_State bit not null default(1)
)
create table Pets_Images(
	_ID bigint primary key not null identity(1,1),
	_Pet_ID bigint not null foreign key references Pets(_ID),
	_Link varchar(1000) not null,
	_Alternate_Text varchar(50) not null,
	_Order int not null,
	_State bit not null default(1)
)
GO

--Inserts
insert into Pet_Types(_Description) values
('Perro'),
('Gato')
insert into Pet_Sexes(_Description) values
('Macho'),
('Hembra')
insert into Pet_Sizes(_Description) values
('Chico'),
('Mediano'),
('Grande')
insert into Pet_Behaviors(_Description) values
('Tranquilo'),
('Territorial')
insert into Pets(_Name, _Age, _Breed, _Color, _ID_Sex, _ID_Type, _ID_Size, _ID_Behavior, _Location) values
('Rex', '2 Años', 'Labrador', 'Amarillo', 1, 1, 3, 2, 'Gral. San Martín'),
('Luna', '1 Año', 'Siamés', 'Blanco/Negro', 2, 2, 1, 1, 'Vicente López'),
('Rex', '2 Años', 'Labrador', 'Amarillo', 1, 1, 3, 2, 'Gral. San Martín'),
('Luna', '1 Año', 'Siamés', 'Blanco/Negro', 2, 2, 1, 1, 'Vicente López'),
('Rex', '2 Años', 'Labrador', 'Amarillo', 1, 1, 3, 2, 'Gral. San Martín'),
('Luna', '1 Año', 'Siamés', 'Blanco/Negro', 2, 2, 1, 1, 'Vicente López'),
('Rex', '2 Años', 'Labrador', 'Amarillo', 1, 1, 3, 2, 'Gral. San Martín'),
('Luna', '1 Año', 'Siamés', 'Blanco/Negro', 2, 2, 1, 1, 'Vicente López'),
('Rex', '2 Años', 'Labrador', 'Amarillo', 1, 1, 3, 2, 'Gral. San Martín'),
('Luna', '1 Año', 'Siamés', 'Blanco/Negro', 2, 2, 1, 1, 'Vicente López'),
('Rex', '2 Años', 'Labrador', 'Amarillo', 1, 1, 3, 2, 'Gral. San Martín'),
('Luna', '1 Año', 'Siamés', 'Blanco/Negro', 2, 2, 1, 1, 'Vicente López'),
('Rex', '2 Años', 'Labrador', 'Amarillo', 1, 1, 3, 2, 'Gral. San Martín'),
('Luna', '1 Año', 'Siamés', 'Blanco/Negro', 2, 2, 1, 1, 'Vicente López'),
('Rex', '2 Años', 'Labrador', 'Amarillo', 1, 1, 3, 2, 'Gral. San Martín'),
('Luna', '1 Año', 'Siamés', 'Blanco/Negro', 2, 2, 1, 1, 'Vicente López'),
('Rex', '2 Años', 'Labrador', 'Amarillo', 1, 1, 3, 2, 'Gral. San Martín'),
('Luna', '1 Año', 'Siamés', 'Blanco/Negro', 2, 2, 1, 1, 'Vicente López')
insert into Pets_Images(_Pet_ID, _Link, _Alternate_Text, _Order) values
(1, '../Multimedia/Adopcion/foto-labrador.jpg', 'Foto 1', 1),
(1, '../Multimedia/Adopcion/Foto2.jpg', 'Foto 2', 2),
(1, '../Multimedia/Adopcion/Foto3.jpg', 'Foto 3', 3),
(1, '../Multimedia/Adopcion/Foto4.jpg', 'Foto 4', 4),
(2, '../Multimedia/Adopcion/foto-siames.jpg', 'Foto 1', 1),
(2, '../Multimedia/Adopcion/Foto2.jpg', 'Foto 2', 2),
(2, '../Multimedia/Adopcion/Foto3.jpg', 'Foto 3', 3),
(2, '../Multimedia/Adopcion/Foto4.jpg', 'Foto 4', 4),
(3, '../Multimedia/Adopcion/foto-labrador.jpg', 'Foto 1', 1),
(3, '../Multimedia/Adopcion/Foto2.jpg', 'Foto 2', 2),
(3, '../Multimedia/Adopcion/Foto3.jpg', 'Foto 3', 3),
(3, '../Multimedia/Adopcion/Foto4.jpg', 'Foto 4', 4),
(4, '../Multimedia/Adopcion/foto-siames.jpg', 'Foto 1', 1),
(4, '../Multimedia/Adopcion/Foto2.jpg', 'Foto 2', 2),
(4, '../Multimedia/Adopcion/Foto3.jpg', 'Foto 3', 3),
(4, '../Multimedia/Adopcion/Foto4.jpg', 'Foto 4', 4),
(5, '../Multimedia/Adopcion/foto-labrador.jpg', 'Foto 1', 1),
(5, '../Multimedia/Adopcion/Foto2.jpg', 'Foto 2', 2),
(5, '../Multimedia/Adopcion/Foto3.jpg', 'Foto 3', 3),
(5, '../Multimedia/Adopcion/Foto4.jpg', 'Foto 4', 4),
(6, '../Multimedia/Adopcion/foto-siames.jpg', 'Foto 1', 1),
(6, '../Multimedia/Adopcion/Foto2.jpg', 'Foto 2', 2),
(6, '../Multimedia/Adopcion/Foto3.jpg', 'Foto 3', 3),
(6, '../Multimedia/Adopcion/Foto4.jpg', 'Foto 4', 4),
(7, '../Multimedia/Adopcion/foto-labrador.jpg', 'Foto 1', 1),
(7, '../Multimedia/Adopcion/Foto2.jpg', 'Foto 2', 2),
(7, '../Multimedia/Adopcion/Foto3.jpg', 'Foto 3', 3),
(7, '../Multimedia/Adopcion/Foto4.jpg', 'Foto 4', 4),
(8, '../Multimedia/Adopcion/foto-siames.jpg', 'Foto 1', 1),
(8, '../Multimedia/Adopcion/Foto2.jpg', 'Foto 2', 2),
(8, '../Multimedia/Adopcion/Foto3.jpg', 'Foto 3', 3),
(8, '../Multimedia/Adopcion/Foto4.jpg', 'Foto 4', 4),
(9, '../Multimedia/Adopcion/foto-labrador.jpg', 'Foto 1', 1),
(9, '../Multimedia/Adopcion/Foto2.jpg', 'Foto 2', 2),
(9, '../Multimedia/Adopcion/Foto3.jpg', 'Foto 3', 3),
(9, '../Multimedia/Adopcion/Foto4.jpg', 'Foto 4', 4),
(10, '../Multimedia/Adopcion/foto-siames.jpg', 'Foto 1', 1),
(10, '../Multimedia/Adopcion/Foto2.jpg', 'Foto 2', 2),
(10, '../Multimedia/Adopcion/Foto3.jpg', 'Foto 3', 3),
(10, '../Multimedia/Adopcion/Foto4.jpg', 'Foto 4', 4),
(11, '../Multimedia/Adopcion/foto-labrador.jpg', 'Foto 1', 1),
(11, '../Multimedia/Adopcion/Foto2.jpg', 'Foto 2', 2),
(11, '../Multimedia/Adopcion/Foto3.jpg', 'Foto 3', 3),
(11, '../Multimedia/Adopcion/Foto4.jpg', 'Foto 4', 4),
(12, '../Multimedia/Adopcion/foto-siames.jpg', 'Foto 1', 1),
(12, '../Multimedia/Adopcion/Foto2.jpg', 'Foto 2', 2),
(12, '../Multimedia/Adopcion/Foto3.jpg', 'Foto 3', 3),
(12, '../Multimedia/Adopcion/Foto4.jpg', 'Foto 4', 4),
(13, '../Multimedia/Adopcion/foto-labrador.jpg', 'Foto 1', 1),
(13, '../Multimedia/Adopcion/Foto2.jpg', 'Foto 2', 2),
(13, '../Multimedia/Adopcion/Foto3.jpg', 'Foto 3', 3),
(13, '../Multimedia/Adopcion/Foto4.jpg', 'Foto 4', 4),
(14, '../Multimedia/Adopcion/foto-siames.jpg', 'Foto 1', 1),
(14, '../Multimedia/Adopcion/Foto2.jpg', 'Foto 2', 2),
(14, '../Multimedia/Adopcion/Foto3.jpg', 'Foto 3', 3),
(14, '../Multimedia/Adopcion/Foto4.jpg', 'Foto 4', 4),
(15, '../Multimedia/Adopcion/foto-labrador.jpg', 'Foto 1', 1),
(15, '../Multimedia/Adopcion/Foto2.jpg', 'Foto 2', 2),
(15, '../Multimedia/Adopcion/Foto3.jpg', 'Foto 3', 3),
(15, '../Multimedia/Adopcion/Foto4.jpg', 'Foto 4', 4),
(16, '../Multimedia/Adopcion/foto-siames.jpg', 'Foto 1', 1),
(16, '../Multimedia/Adopcion/Foto2.jpg', 'Foto 2', 2),
(16, '../Multimedia/Adopcion/Foto3.jpg', 'Foto 3', 3),
(16, '../Multimedia/Adopcion/Foto4.jpg', 'Foto 4', 4),
(17, '../Multimedia/Adopcion/foto-labrador.jpg', 'Foto 1', 1),
(17, '../Multimedia/Adopcion/Foto2.jpg', 'Foto 2', 2),
(17, '../Multimedia/Adopcion/Foto3.jpg', 'Foto 3', 3),
(17, '../Multimedia/Adopcion/Foto4.jpg', 'Foto 4', 4),
(18, '../Multimedia/Adopcion/foto-siames.jpg', 'Foto 1', 1),
(18, '../Multimedia/Adopcion/Foto2.jpg', 'Foto 2', 2),
(18, '../Multimedia/Adopcion/Foto3.jpg', 'Foto 3', 3),
(18, '../Multimedia/Adopcion/Foto4.jpg', 'Foto 4', 4)
GO

--Views
create or alter view Pets_List
as
	select P.*,
	(select _Description from Pet_Sexes PSe where P._ID_Sex = PSe._ID) _Description_Sex,
	(select _Description from Pet_Types PT where P._ID_Type = PT._ID) _Description_Type,
	(select _Description from Pet_Sizes PSi where P._ID_Size = PSi._ID) _Description_Size,
	(select _Description from Pet_Behaviors PB where P._ID_Behavior = PB._ID) _Description_Behavior
	from Pets P
GO

--StoredProcedures


--Triggers


--Querys
select * from Pet_Types
select * from Pet_Sexes
select * from Pets
select * from Pets_Images