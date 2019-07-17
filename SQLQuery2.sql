--use kepegawaian;
--sp_help 'schkaryawan.pegawai'

--use kepegawaian1;

--create table pegawai(
--nip char(4) not null constraint pknip primary key,
--nama varchar(30),
--alamat varchar(50),
--kota varchar(50),
--tempat_lhr varchar(30),
--tgl_lhr smalldatetime,
--pendidikan char(3),
--jns_kelamin char(6),
--agama char(10),
--kode_gapok char(4) not null,
--status varchar(20),
--jml_anak int
--)

--insert into pegawai values('P001','Indah Ayu Yuliani', 'Jl. Jambu No. 12 Komp. Cimanggis Indah','Depok','Jakarta','1980-02-12','S2','Wanita','Islam','G07', 'Menikah', 0) 
--insert into pegawai values('P002','Nur Iskandar Zulkarnaen', 'Kemusu Boyolali','Jaksel','Boyolali','1994-02-12','S2','Pria','Islam','G07', 'Belum Menikah', 0)

--select * into pegawai_wanita from pegawai where jns_kelamin = 'Wanita'
--select * from dbo.pegawai
--select * from dbo.pegawai_wanita

--drop table dbo.pegawai_wanita
USE kepegawaian1
--update dbo.pegawai set nama = 'Indah Ayu' where nip = 'P001'
--delete from pegawai where nip = 'P001'
--select * from pegawai

--insert into pegawai values('P003','Najwa Shihab', 'Jl Blok M','Jaksel','Boyolali','1994-02-12','S2','Wanita','Islam','G07', 'Menikah', 0)

--select * into pegawai_coba from pegawai where jns_kelamin = 'Wanita' 
select * from pegawai_coba

--truncate table pegawai_coba --menghapus seluruh record/baris database

