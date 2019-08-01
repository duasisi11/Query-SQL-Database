--create database DBKota;

--use DBKota

--create table tbl_warga
--(
--nik char(13) not null primary key, --tetap menyediakan memory sebanyak 13 atau nilai nya fix. jika diisi cuman 12 maka karakter sisa satunya diisi sepasi
--nama varchar(30),
--tempat_lahir varchar(30),
--tanggal_lahir date,
--alamat varchar(30)
--)

--sp_help 'tbl_warga' 

--insert into tbl_warga values('1234567890123','Soni Rahmatullah','Jakarta', '09-01-1980', 'Jl. Abed No.34 Jakarta Barat')
--insert into tbl_warga values('1234567890124','Budi Sudarsono','Bandung', '05-02-1981', 'Jl. Abed No.23 Jakarta Barat')
--insert into tbl_warga values('1234567890125','Deni Abdullah','Jakarta', '03-03-1980', 'Jl. Abed No.24 Jakarta Barat')
--insert into tbl_warga values('1234567890126','Rizki Hidayat','Jakarta', '01-12-1980', 'Jl. Abed No.35 Jakarta Barat')
--insert into tbl_warga values('1234567890127','Dini Putri','Jakarta', '02-10-1980', 'Jl. Abed No.01 Jakarta Barat')

select * from tbl_warga