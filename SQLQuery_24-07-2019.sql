--============================================TRIGGER AFTER INSERT
create trigger trgInsPegawai
ON schkaryawan.pegawai
AFTER INSERT
AS
BEGIN
PRINT 'Data berhasil dimasukkan'
END
RETURN

select * from schkaryawan.pegawai;

delete from schkaryawan.pegawai where nip = 'P010'

insert schkaryawan.pegawai values('P010','Noni','Jl. Jambu No. 12 Komp. Cimanggis Permai','Depok','Jakarta','12/02/1980','S3','Wanita',
'Islam','G07','Menikah', 0) 

ALTER TRIGGER schkaryawan.trgInsPegawai
ON schkaryawan.pegawai
AFTER INSERT
AS
BEGIN
PRINT 'Data berhasil dimasukkan ke tabel pegawai'
END
RETURN

insert schkaryawan.pegawai values('P010','Noni','Jl. Jambu No. 12 Komp. Cimanggis Permai','Depok','Jakarta','12/02/1980','S3','Wanita',
'Islam','G07','Menikah', 0) 

insert schkaryawan.pegawai values('P007','Nana','Jl. Salemba','Bogor','Makasar','12/12/1987','S2','Pria',
'Islam','G07','Menikah', 0) 
--============================================TRIGGER AFTER DELETE
CREATE TRIGGER schkaryawan.trgDelPegawai
ON schkaryawan.pegawai
AFTER DELETE
AS
BEGIN
PRINT 'Data berhasil dihapus'
END
RETURN

--drop trigger schkaryawan.trgInsPegawai 
delete from schkaryawan.pegawai where nip='P010'

--============================================MEMBUAT LOG DATA PADA TABLE - TRIGGER AFTER INSERT=========================
create table DataPegawai(
NIP int identity(1,1) primary key,
nama varchar(50),
bagian varchar(50)
)

insert into DataPegawai values('Budi', 'Umum')
insert into DataPegawai values('Banu', 'Umum')
insert into DataPegawai values('Sinta', 'Umum')
insert into DataPegawai values('Joni', 'Umum')
insert into DataPegawai values('Dedi', 'Umum')
insert into DataPegawai values('Gunar', 'Umum')

select * from DataPegawai

create table DataTriggerLogPegawai
(
id int identity(1,1) primary key,
nip char(4),
aksi varchar(50)
)

create trigger trgInsPegawai2
ON DataPegawai
after insert
AS
BEGIN
PRINT 'Data berhasil di masukkan'
insert into DataTriggerLogPegawai  values((select top 1 inserted.NIP from inserted), 'insert')
END

select * from DataTriggerLogPegawai

--EXEC sp_rename 'dbo.DataPegawai.ID', 'NIP', 'COLUMN'; //merubah nama COLUMN

--============================================MEMBUAT LOG DATA PADA TABLE - TRIGGER AFTER INSERT - Log_tabelpegawai=========================
create table Log_tabelpegawai
(
ID int identity(1,1) primary key,
NIP char(4),
PerformedAction varchar(50)
)

create trigger AfterInsertTriggerNew
ON schkaryawan.pegawai
AFTER INSERT
AS
INSERT INTO Log_tabelpegawai values ((select TOP 1 inserted.nip from inserted), 'insert')
go

select * from schkaryawan.pegawai

insert schkaryawan.pegawai values('P006','fivi','Jl. Apel Permai','Bogor','Bekasi','12/11/1989','S1','Wanita',
'Islam','G07','Belum Menikah', 0) 

select * from Log_tabelpegawai

--============================================MEMBUAT LOG DATA PADA TABLE - TRIGGER AFTER DELETE - Log_tabelpegawai=========================
create trigger schkaryawan.AfterDeleteTriggerNew
ON schkaryawan.pegawai
AFTER DELETE --rubah disini
AS
BEGIN
INSERT INTO Log_tabelpegawai values ((select TOP 1 deleted.nip from deleted), 'Delete Data') --rubah disini
print 'Data sudah terhapus'
END

delete from schkaryawan.pegawai where nip='P007'  

select * from schkaryawan.pegawai
select * from Log_tabelpegawai


--============================================MEMBUAT LOG DATA PADA TABLE - TRIGGER AFTER UPDATE - Log_tabelpegawai=========================
alter trigger schkaryawan.AfterUpdateTriggerNew
ON schkaryawan.pegawai
AFTER UPDATE --rubah disini
AS
BEGIN
INSERT INTO Log_tabelpegawai values ((select TOP 1 inserted.nip from inserted), 'Update Data') --rubah disini
print 'Data sudah terupdate'
END

update schkaryawan.pegawai set nama='Rudi' where nip='P004'  

select * from schkaryawan.pegawai
select * from Log_tabelpegawai

--===========================SQL Server INSTEAD OF trigger syntax================
select * from schkaryawan.golongan
Create table Log_tabelGolongan(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Kode_Golongan INT,
	Keterangan VARCHAR(50)
)

CREATE TRIGGER schkaryawan.InsteadOfInsertGolTrigger
ON schkaryawan.golongan 
INSTEAD OF INSERT
AS
BEGIN
INSERT INTO Log_tabelGolongan VALUES
((SELECT TOP 1 inserted.Kode_Golongan FROM inserted), 'Trying to Insert new ID')
PRINT 'Dilarang menambahkan data pada label Golongan'
END

insert into schkaryawan.golongan values(6,900000,200000,700000,4000,50000)

select * from Log_tabelGolongan 
select * from schkaryawan.golongan
