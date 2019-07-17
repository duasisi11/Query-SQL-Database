--use kepegawaian
--sp_renamedb kepegawaian, kepegawaian1

--create database kepegawaian
--use kepegawaian

--drop database kepegawaian1

--exec sp_databases
--use AdventureWorksDW20
--sp_renamedb kepegawaian0, kepegawaian

--use kepegawaian

--create schema schkaryawan
--select * from sys.schemas

--create table schkaryawan.jabatan(
--kode_jabatan char(4) NOT NULL PRIMARY KEY,
--Nama_jabatan varchar(50) NOT NULL,
--Tunjangan_Jabatan int
--)

--create table schkaryawan.golongan(
--Kode_Golongan int NOT NULL PRIMARY KEY,
--Tj_istri_suami int,
--Tj_anak int,
--U_makan_hari int,
--U_lembur_jam int,
--Askes int
--)

--select * from sys.tables
--alter table schkaryawan.golongan add primary key(Kode_Golongan)  --menambah primary key


--create table schkaryawan.gaji_pokok(
--Kode_Gapok char(4) NOT NULL constraint pkkodegapok PRIMARY KEY,
--Kode_Jabatan char(4) NOT NULL constraint fkkodejabatan references schkaryawan.jabatan(kode_jabatan),
--Kode_Golongan int NOT NULL constraint fkkodegolongan references schkaryawan.golongan(Kode_Golongan),
--gaji_pokok money)

--select * from sys.tables

--select * from schkaryawan.gaji_pokok

--sp_help gaji_pokok

--exec sp_columns gaji_pokok
--exec sp_help 'schkaryawan.gaji_pokok' --untuk mengetahui struktur table atau sama dengan desc
--exec sp_help 'schkaryawan.golongan'

--create table schkaryawan.pegawai(
--nip char(4) not null constraint pknip primary key,
--nama varchar(30),
--alamat varchar(50),
--kota varchar(50),
--tempat_lhr varchar(30),
--tgl_lhr smalldatetime,
--pendidikan char(3),
--jns_kelamin char(6),
--agama char(10),
--kode_gapok char(4) not null constraint fkkodegapok references schkaryawan.gaji_pokok(kode_gapok),
--status varchar(20),
--jml_anak int
--)

--create table schkaryawan.absen(
--id_absen int not null primary key,
--bulan smalldatetime not null,
--nip char(4) not null constraint fknip references schkaryawan.pegawai(nip),
--jml_masuk int,
--jml_sakit int,
--jml_izin int)

--create table schkaryawan.lembur(
--bulan smalldatetime not null constraint pkbulan primary key,
--nip char(4) not null constraint fknip2 references schkaryawan.pegawai(nip),
--jam_lembur int)

--use kepegawaian;

--alter table schkaryawan.pegawai add constraint checkjeniskelamin CHECK(jns_kelamin IN ('pria', 'perempuan'))

--alter table schkaryawan.pegawai add constraint checknip CHECK(nip LIKE '[0-9][0-9][0-9][0-9][0-9]')

--alter table schkaryawan.pegawai add constraint checkstatus CHECK(status IN ('Belum Menikah', 'Menikah', 'Janda','Duda'))

--alter table schkaryawan.pegawai add constraint checkjmlanak CHECK(jml_anak between 0 and 5)

--sp_help 'schkaryawan.jabatan'

--insert into schkaryawan.jabatan values('1234','Pranata Komputer','1000000');

