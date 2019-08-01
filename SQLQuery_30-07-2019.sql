--create database data_instansi;

--use data_instansi;

create table kesatuan
(
id_kesatuan int not null constraint pk_idkes primary key,
nama_kesatuan varchar(20),
alamat text
)

create table jabatan 
(
id_jabatan int not null constraint pk_idjab primary key,
nama_jabatan varchar(30),
tmt_jabatan date,
tunjangan_jabatan int
)

create table diklat
(
id_diklat int not null constraint pk_iddik primary key,
nama_diklat varchar(30),
thn_lulus date
)

create table anggota
(
nip_nrp int constraint pk_idagt primary key,
nama_anggota varchar(40),
pangkat_gol varchar(20),
jenis_kelamin char(10),
agama varchar(20),
status varchar(20),
id_jabatan int constraint fk_idjab references jabatan(id_jabatan),
id_kesatuan int constraint fk_idkes references kesatuan(id_kesatuan),
id_diklat int constraint fk_iddik references diklat(id_diklat)
)  


insert kesatuan values (09,'Bainstrahan', 'Jl. Merdeka Barat'),(10,'Denmatra 1', 'Jl.Halim PK'),(41,'Zidam Jaya','Jl. Mayjen Sutoyo'),(44,'Bekangdam III/SLW', 'Jl.Srigading 12')

insert jabatan values(1,'Pranata Komputer Terampil','2018-02-01',2000000),(2,'Baadminu','2015-01-12',3000000),(3,'Operator Komputer','2012-01-01',4000000),(4,'Operator Komputer 2 Sibek','2009-12-01',5000000)

insert diklat values(1,'Programmer Komputer','2019-09-03'),(2,'Diklat Bela Negara', '2012-04-01'),(3,'Kibi Kemhan','2014-01-02'),(4,'Susparadas AU','2000-09-01')

insert anggota values(1003,'Nur Iskandar','II C','Pria','Islam','Belum Menikah',1,09,1) 
insert anggota values(6699,'Darmuji','Serda','Pria','Islam','Menikah/K2',2,10,4) 
insert anggota values(2010,'Florendo King','II D','Pria','Islam','Menikah/K2',3,41,2) 
insert anggota values(2009,'Om Taufiq Exra','II D','Pria','Islam','Menikah/K2',4,44,3) 


select * from kesatuan;
select * from jabatan;
select * from diklat;
select * from anggota;

select a.nip_nrp, a.nama_anggota, a.pangkat_gol, j.nama_jabatan, k.nama_kesatuan, d.nama_diklat, d.thn_lulus, k.nama_kesatuan from anggota a, jabatan j, kesatuan k, diklat d 
where a.id_jabatan = j.id_jabatan and a.id_kesatuan =  k.id_kesatuan and a.id_diklat = d.id_diklat


use kepegawaian

select * from schkaryawan.pegawai;