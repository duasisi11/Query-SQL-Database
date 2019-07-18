--Nama : Nur Iskandar Zulkarnaen
-- 
------------------------------------------------------Tugas dan Latihan DATABASE KARYAWAN-------------------------------------------------------
--create database karyawan;
--use karyawan
--drop table karyawan

--create table department(
--kode_department int  not null constraint kd_department primary key,
--nama_department varchar(50),
--tunjangan int)

--create table status(
--status int not null constraint pk_status primary key,
--keterangan varchar(100),
--gaji_pokok int,
--transport int)


--create table karyawan(
--no_induk int not null constraint pk_noinduk primary key,
--nama varchar(50),
--kode_department int not null constraint fk_kd_department references department(kode_department),
--status int not null constraint fk_status references status(status));

select * from karyawan;
select * from status;
select * from department;

insert department values(1,'HRD',500000),(2,'Sales',1000000),(3,'Produksi',500000);

insert status values(1,'Tetap',3000000,500000),(2,'Kontrak',2000000,200000);

insert karyawan values(1,'Hadi',1,1),(2,'Irwan',1,1),(3,'Rafli',2,2),(4,'Agung',3,2);


select karyawan.no_induk,karyawan.nama, status.gaji_pokok from karyawan, status where karyawan.status=status.status and karyawan.nama='Irwan'; --No.1

select karyawan.no_induk,karyawan.nama, department.nama_department from karyawan, department where karyawan.nama='Hadi' and
karyawan.kode_department=department.kode_department; --No.2

update department set department.tunjangan=700000 where department.nama_department='HRD'; --No.3

--drop rule kdDepartment 

create rule ruleKdDepart AS @kdDepart IN(1,2,3) 
sp_bindrule 'ruleKdDepart','karyawan.kode_department'  --No.4
sp_help 'karyawan';

select karyawan.no_induk,karyawan.nama, status.keterangan from karyawan, status where karyawan.status=status.status; --No.5
------------------------------------------------------Tugas dan Latihan DATABASE KARYAWAN-------------------------------------------------------

--create table dtSiswa(
--no_induk int not null primary key,
--nama varchar(50),
--asal_sekolah varchar(50),
--alamat varchar(100),
--no_tlp int)

--create table kelas(
--kode_kelas int not null primary key,
--status varchar(50)) 

--create table siswa(
--no_induk int not null constraint fknoinduk references dtSiswa(no_induk),
--kode_kelas int not null constraint fkkodekelas references kelas(kode_kelas),
--nilai_nem int)

--insert into dtSiswa values(1, 'Toni', 'SMA 1', 'Bogor', '891');
--insert into dtSiswa values(2, 'Tono', 'SMA 2', 'Jakarta', '892'),
--(3, 'Abdul', 'SMA 3', 'Depok', '893'),(4, 'Bakrie', 'SMA 4', 'Tangerang', '894'),(5, 'Pratama', 'SMA 5', 'Bekasi', '895');

--insert into kelas values(1,'Unggulan'),(2, 'Menengah'),(3, 'Rata rata');

--insert into siswa values(1, 1, 30.1),(2,1, 30.2),(3,2, 30.3),(4,2, 30.4),(5,2, 30.5);

--alter table siswa drop column nilai_nem;
--alter table siswa add nilai_nem decimal(10,2)
-- atau
--alter table siswa alter column nilai_nem decimal(10,2)
--delete from siswa

--select * from dtsiswa;
--select * from siswa
--select * from kelas

--select *, siswa.nilai_nem from dtSiswa, siswa where dtsiswa.no_induk=siswa.no_induk

--select dtsiswa.*, siswa.nilai_nem from dtSiswa, siswa where dtsiswa.no_induk=siswa.no_induk

------------------------------------------------------DATABASE KEPEGAWAINAN1-------------------------------------------------------
--use kepegawaian1
--create rule rulAgama AS @Agm IN ('Islam','Protestan', 'Katolik', 'Budha', 'Hindu') --
--sp_bindrule 'rulAgama','pegawai.agama' --mengarahkan table mana yang akan menggunakan rule diatas 'rulAgama' 

--select * from pegawai

--insert into pegawai values('P007','Paul Hartop','Hamburg','Berlin','Jakarta','02/04/1992','S1','Pria','Islamnya','G07','Menikah','0')
------------------------------------------------------DATABASE KEPEGAWAINAN1---------------------------------------------------------


--use siswa
--create table guru(
--kode_guru varchar(4) not null constraint pkkdguru primary key,
--nama varchar(50),
--alamat varchar(50))

--insert into guru values      
--('GU1','Chandra','Bekasi'),
--('GU2','Cintya','Bogor'),
--('GU3','Budi','Jakarta'),
--('GU4','Tamara','Bekasi');

--alter table kelas add kode_guru varchar(4) constraint fkkdguru references guru(kode_guru)

--update kelas set kode_guru='GU1' where kode_kelas=1
--update kelas set kode_guru='GU2' where kode_kelas=2
--update kelas set kode_guru='GU4' where kode_kelas=3

--select * from kelas;
--select kelas.kode_kelas,kelas.status,guru.nama from kelas, guru where kelas.kode_guru=guru.kode_guru


