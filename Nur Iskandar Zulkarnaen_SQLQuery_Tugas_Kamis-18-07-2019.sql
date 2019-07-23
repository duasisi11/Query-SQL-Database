--Nama : Nur Iskandar ZUlkarnaen
--Diklat Programmer Komputer
-------------------------------------NOMOR 1-------------------------------------------------------------------
INSERT INTO tbl_kategori VALUES ('Jurnal')
INSERT INTO tbl_kategori VALUES ('Komik')
INSERT INTO tbl_kategori VALUES ('Ensiklopedia')
INSERT INTO tbl_kategori VALUES ('Cergam')
INSERT INTO tbl_kategori VALUES ('Novel')

INSERT INTO tbl_buku VALUES ('ISBN001', 'Menunggu Singlemu', 'Badiklat', 'Toma', 235, 2019, 33, 'A5', 1)
INSERT INTO tbl_buku VALUES ('ISBN002', 'Generasi Millenial', 'Badiklat', 'Leo', 111, 2019, 63, 'B5', 2)
INSERT INTO tbl_buku VALUES ('ISBN003', 'Si Belang', 'Badiklat', 'Heribertus', 200, 2010, 3, 'C5', 3)
INSERT INTO tbl_buku VALUES ('ISBN004', 'Ensiklopedia Lengkap', 'Gramedia', 'Yanwar', 350, 2013, 9, 'D5', 4)
INSERT INTO tbl_buku VALUES ('ISBN005', 'Robot dan Manusia Bewarna', 'Erlangga', 'Dwi', 35, 2007, 100, 'A5', 4)

insert into tbl_anggota values('Nur Iskandar Zulkarnaen', 'Boyolali')
insert into tbl_anggota values('Roy Florendo', 'Jakarta')
insert into tbl_anggota values('Taufiq Extra', 'Bandung')
insert into tbl_anggota values('Darmuji', 'Jakarta')
insert into tbl_anggota values('Diyon Putra Negara', 'Depok')

insert into tbl_peminjaman values(GETDATE(),'2019-07-25','Jaminan KTP',1)
insert into tbl_peminjaman values('2019-07-11','2019-07-14','Jaminan SIM',2)
insert into tbl_peminjaman values('2019-07-10','2019-07-24','Jaminan KTP',5)
insert into tbl_peminjaman values('2019-07-09','2019-07-14','Jaminan SIM',4)
insert into tbl_peminjaman values('2019-07-19','2019-07-22','Jaminan KTP',3)

insert into tbl_det_peminjaman values(2,1,5)
insert into tbl_det_peminjaman values(3,2,4)
insert into tbl_det_peminjaman values(1,3,3)
insert into tbl_det_peminjaman values(5,4,2)
insert into tbl_det_peminjaman values(4,5,1)

insert into tbl_pengembalian values('2019-07-25',5000,5,1)
insert into tbl_pengembalian values('2019-07-14',7000,4,2)
insert into tbl_pengembalian values('2019-07-24',4000,3,3)
insert into tbl_pengembalian values('2019-07-14',10000,2,4)
insert into tbl_pengembalian values('2019-07-22',9000,1,5) 

select * from tbl_kategori
select * from tbl_anggota
select * from tbl_det_peminjaman
select * from tbl_buku
select * from tbl_peminjaman
select * from tbl_pengembalian

-------------------------------------NOMOR 2-------------------------------------------------------------------
select nama, judul from tbl_anggota, tbl_peminjaman ,tbl_det_peminjaman, tbl_buku where tbl_anggota.id_anggota =tbl_peminjaman.id_anggota 
and tbl_peminjaman.id_peminjaman = tbl_det_peminjaman.id_peminjaman and tbl_det_peminjaman.id_buku = tbl_buku.id_buku and judul LIKE 'Robot%'

-------------------------------------NOMOR 3-------------------------------------------------------------------
select TOP 3 tbl_anggota.id_anggota, nama, judul from tbl_anggota, tbl_peminjaman ,tbl_det_peminjaman, tbl_buku where tbl_anggota.id_anggota =tbl_peminjaman.id_anggota 
and tbl_peminjaman.id_peminjaman = tbl_det_peminjaman.id_peminjaman and tbl_det_peminjaman.id_buku = tbl_buku.id_buku ORDER BY tbl_anggota.id_anggota ASC