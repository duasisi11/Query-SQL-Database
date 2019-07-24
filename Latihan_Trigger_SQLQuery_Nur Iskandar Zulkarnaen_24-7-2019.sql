use siswa
create table Log_tabel_dtSiswa
(
id int identity(1,1) primary key,
no_induk int,
PerformedAction varchar(50)
)

--=============No 1. Trigger Insert====================
create trigger AfterInsert_dtSiswa_Trigger
ON dtSiswa
AFTER INSERT
AS
BEGIN
INSERT INTO Log_tabel_dtSiswa values ((select TOP 1 inserted.no_induk from inserted), 'insert')
PRINT 'Data berhasil diinputkan'
END

insert dbo.dtSiswa values(6,'Nadine', 'SMA 7 Jakarta','Banten',512)
 
select * from dtSiswa
select * from Log_tabel_dtSiswa

insert dbo.dtSiswa values(6,'Nadine', 'SMA 7 Jakarta','Banten',512)

--=============No 2. Trigger Delete====================
create trigger AfterDelete_dtSiswa_Trigger
ON dtSiswa
AFTER DELETE
AS
BEGIN
INSERT INTO Log_tabel_dtSiswa values ((select TOP 1 deleted.no_induk from deleted), 'Delete Data')
print 'Data telah terhapus'
END

select * from dtSiswa
select * from Log_tabel_dtSiswa

delete from dbo.dtSiswa where no_induk=6

--=============No 3. Trigger Update====================
insert dbo.dtSiswa values(6,'Nadine', 'SMA 7 Jakarta','Banten',512)

create trigger AfterUpdate_dtSiswa_Trigger
ON dtSiswa
AFTER UPDATE
AS
BEGIN
INSERT INTO Log_tabel_dtSiswa values ((select TOP 1 inserted.no_induk from inserted), 'Update Data')
print 'Berhasil mengupdate data'
END

select * from dtSiswa
select * from Log_tabel_dtSiswa

update dbo.dtSiswa set asal_sekolah='SMA 1 Jakarta' where no_induk=1
select * from Log_tabel_dtSiswa

--===========================No 4. Trigger INSTEAD OF INSERT================
select * from kelas
Create table Log_tabel_kelas(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	kode_kelas INT,
	Keterangan VARCHAR(50)
)

create TRIGGER InsteadOfInsert_kelas_Trigger
ON kelas 
INSTEAD OF INSERT
AS
BEGIN
INSERT INTO Log_tabel_kelas VALUES
((SELECT TOP 1 inserted.kode_kelas FROM inserted), 'Mencoba menginput data kelas baru')
PRINT 'Dilarang menambahkan data baru pada tabel Kelas'
END

select * from kelas

insert kelas values(4, 'Favorit', 'GU5')

select * from kelas
select * from Log_tabel_kelas