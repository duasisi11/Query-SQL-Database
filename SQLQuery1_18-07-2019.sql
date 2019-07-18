--CREATE DATABASE [db_library]
--USE [db_library]

--CREATE TABLE [dbo].[tbl_kategori](
--	[id_kategori] [int] IDENTITY(1,1) NOT NULL,
--	[nama_kategori] [varchar](50) NULL,
-- CONSTRAINT [PK_tbl_kategori] PRIMARY KEY CLUSTERED 
--(
--	[id_kategori] ASC
--)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
--) ON [PRIMARY]

--CREATE TABLE [dbo].[tbl_anggota](
--	[id_anggota] [int] IDENTITY(1,1) NOT NULL,
--	[nama] [varchar](50) NULL,
--	[alamat] [text] NULL,
-- CONSTRAINT [PK_tbl_anggota] PRIMARY KEY CLUSTERED 
--(
--	[id_anggota] ASC
--)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
--) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

--CREATE TABLE [dbo].[tbl_buku](
--	[id_buku] [int] IDENTITY(1,1) NOT NULL,
--	[isbn] [varchar](50) NULL,
--	[judul] [varchar](125) NULL,
--	[penerbit] [varchar](125) NULL,
--	[pengarang] [varchar](125) NULL,
--	[jml_halaman] [int] NULL,
--	[tahun] [int] NULL,
--	[stok] [int] NULL,
--	[no_rak] [varchar](5) NULL,
--	[id_kategori] [int] NULL,
-- CONSTRAINT [PK_tbl_ buku] PRIMARY KEY CLUSTERED 
--(
--	[id_buku] ASC
--)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
--) ON [PRIMARY]

--CREATE TABLE [dbo].[tbl_peminjaman](
--	[id_peminjaman] [int] IDENTITY(1,1) NOT NULL,
--	[tgl_pinjam] [date] NULL,
--	[tgl_kembali] [date] NULL,
--	[keterangan] [varchar](50) NULL,
--	[id_anggota] [int] NULL,
-- CONSTRAINT [PK_tbl_peminjaman] PRIMARY KEY CLUSTERED 
--(
--	[id_peminjaman] ASC
--)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
--) ON [PRIMARY]

--CREATE TABLE [dbo].[tbl_pengembalian](
--	[id] [int] IDENTITY(1,1) NOT NULL,
--	[tgl] [date] NULL,
--	[denda] [int] NULL,
--	[id_peminjaman] [int] NULL,
--	[id_anggota] [int] NULL,
-- CONSTRAINT [PK_tbl_pengembalian] PRIMARY KEY CLUSTERED 
--(
--	[id] ASC
--)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
--) ON [PRIMARY]

--CREATE TABLE [dbo].[tbl_det_peminjaman](
--	[id] [int] IDENTITY(1,1) NOT NULL,
--	[qty] [int] NULL,
--	[id_peminjaman] [int] NULL,
--	[id_buku] [int] NULL,
-- CONSTRAINT [PK_tbl_det_peminjaman] PRIMARY KEY CLUSTERED 
--(
--	[id] ASC
--)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
--) ON [PRIMARY]

--GO
--/****** Object:  ForeignKey [FK_tbl_ buku_tbl_kategori]    Script Date: 07/18/2019 08:02:34 ******/
--ALTER TABLE [dbo].[tbl_buku]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ buku_tbl_kategori] FOREIGN KEY([id_kategori])
--REFERENCES [dbo].[tbl_kategori] ([id_kategori])
--GO
--ALTER TABLE [dbo].[tbl_buku] CHECK CONSTRAINT [FK_tbl_ buku_tbl_kategori]
--GO
--/****** Object:  ForeignKey [FK_tbl_peminjaman_tbl_anggota]    Script Date: 07/18/2019 08:02:34 ******/
--ALTER TABLE [dbo].[tbl_peminjaman]  WITH CHECK ADD  CONSTRAINT [FK_tbl_peminjaman_tbl_anggota] FOREIGN KEY([id_anggota])
--REFERENCES [dbo].[tbl_anggota] ([id_anggota])
--GO
--ALTER TABLE [dbo].[tbl_peminjaman] CHECK CONSTRAINT [FK_tbl_peminjaman_tbl_anggota]
--GO
--/****** Object:  ForeignKey [FK_tbl_pengembalian_tbl_anggota]    Script Date: 07/18/2019 08:02:34 ******/
--ALTER TABLE [dbo].[tbl_pengembalian]  WITH CHECK ADD  CONSTRAINT [FK_tbl_pengembalian_tbl_anggota] FOREIGN KEY([id_anggota])
--REFERENCES [dbo].[tbl_anggota] ([id_anggota])
--GO
--ALTER TABLE [dbo].[tbl_pengembalian] CHECK CONSTRAINT [FK_tbl_pengembalian_tbl_anggota]
--GO
--/****** Object:  ForeignKey [FK_tbl_pengembalian_tbl_peminjaman]    Script Date: 07/18/2019 08:02:34 ******/
--ALTER TABLE [dbo].[tbl_pengembalian]  WITH CHECK ADD  CONSTRAINT [FK_tbl_pengembalian_tbl_peminjaman] FOREIGN KEY([id_peminjaman])
--REFERENCES [dbo].[tbl_peminjaman] ([id_peminjaman])
--GO
--ALTER TABLE [dbo].[tbl_pengembalian] CHECK CONSTRAINT [FK_tbl_pengembalian_tbl_peminjaman]
--GO
--/****** Object:  ForeignKey [FK_tbl_det_peminjaman_tbl_ buku]    Script Date: 07/18/2019 08:02:34 ******/
--ALTER TABLE [dbo].[tbl_det_peminjaman]  WITH CHECK ADD  CONSTRAINT [FK_tbl_det_peminjaman_tbl_ buku] FOREIGN KEY([id_buku])
--REFERENCES [dbo].[tbl_buku] ([id_buku])
--GO
--ALTER TABLE [dbo].[tbl_det_peminjaman] CHECK CONSTRAINT [FK_tbl_det_peminjaman_tbl_ buku]
--GO
--/****** Object:  ForeignKey [FK_tbl_det_peminjaman_tbl_peminjaman]    Script Date: 07/18/2019 08:02:34 ******/
--ALTER TABLE [dbo].[tbl_det_peminjaman]  WITH CHECK ADD  CONSTRAINT [FK_tbl_det_peminjaman_tbl_peminjaman] FOREIGN KEY([id_peminjaman])
--REFERENCES [dbo].[tbl_peminjaman] ([id_peminjaman])
--GO
--ALTER TABLE [dbo].[tbl_det_peminjaman] CHECK CONSTRAINT [FK_tbl_det_peminjaman_tbl_peminjaman]
--GO



--select * from tbl_kategori

--delete from tbl_kategori
--select * from [tbl_buku]
--delete from [tbl_buku]

-- DBCC CHECKIDENT ("tbl_kategori", RESEED, 0); -- mengatur AUTO_INCREMENT Reset ke 1
-- DBCC CHECKIDENT ("tbl_buku", RESEED, 0);  -- mengatur AUTO_INCREMENT Reset ke 1
 
--INSERT INTO [db_library].[dbo].[tbl_kategori] VALUES ('Jurnal')
--INSERT INTO [db_library].[dbo].[tbl_kategori] VALUES ('Komik')
--INSERT INTO [db_library].[dbo].[tbl_kategori] VALUES ('Ensiklopedia')
--INSERT INTO [db_library].[dbo].[tbl_kategori] VALUES ('Cergam')

--INSERT INTO [db_library].[dbo].[tbl_buku] VALUES ('ISBN001', 'Menunggu Singlemu', 'Badiklat', 'Toma', 235, 2019, 33, 'A5', 1)
--INSERT INTO [db_library].[dbo].[tbl_buku] VALUES ('ISBN002', 'Generasi Millenial', 'Badiklat', 'Leo', 111, 2019, 63, 'B5', 2)
--INSERT INTO [db_library].[dbo].[tbl_buku] VALUES ('ISBN003', 'Si Belang', 'Badiklat', 'Heribertus', 200, 2010, 3, 'C5', 3)
--INSERT INTO [db_library].[dbo].[tbl_buku] VALUES ('ISBN004', 'Ensiklopedia Lengkap', 'Gramedia', 'Yanwar', 350, 2013, 9, 'D5', 4)
--INSERT INTO [db_library].[dbo].[tbl_buku] VALUES ('ISBN005', 'Robot dan Manusia Bewarna', 'Erlangga', 'Dwi', 35, 2007, 100, 'A5', 4)

--select judul from [tbl_buku] where stok > 50


--select * from tbl_kategori
--select * from tbl_buku

--select * from tbl_buku where tbl_buku.penerbit != 'Badiklat' --No 1
--select judul from tbl_buku where tbl_buku.tahun > 2010 --No 2
--select isbn,judul,stok from tbl_buku where  tbl_buku.isbn = 'ISBN003' --No 3

--select judul, 'Stok Baru' = stok + 50 from tbl_buku


--select judul, jml_halaman, 'Jumlah Halaman Baru' = jml_halaman - 15 from tbl_buku
--select judul, penerbit, 'Harga'= stok * 1000 from tbl_buku where penerbit='Badiklat'

--select * from tbl_buku where penerbit = 'Badiklat' OR penerbit = 'Gramedia'
--select * from tbl_buku where penerbit = 'Badiklat' AND stok > 50
--select * from tbl_buku where NOT penerbit = 'Badiklat' 
--select * from tbl_buku where stok > 50 AND stok < 150

--select judul, pengarang, penerbit from tbl_buku where penerbit = 'Erlangga' OR penerbit = 'Gramedia'
select * from tbl_buku where stok BETWEEN 50 AND  150
select * from tbl_buku where stok NOT BETWEEN 50 AND  150
--select * from tbl_buku where NOT pengarang = 'Yanwar'

select penerbit, tahun from tbl_buku where tahun BETWEEN 2010 AND 2020
select judul, jml_halaman from tbl_buku where jml_halaman NOT BETWEEN 200 AND 300
select pengarang,jml_halaman,stok from tbl_buku where jml_halaman BETWEEN 200 AND 300 and stok NOT BETWEEN 200 AND 250

select * from tbl_buku where judul LIKE 'S%' --diawali huruf S

select * from tbl_buku where judul LIKE '%L' --diakhiri huruf L

select * from tbl_buku where judul LIKE '%G%' --mengandung huruf G

select * from tbl_buku where pengarang LIKE 'T___' --pengarang yang diawali dengan T diakhiri 3 karakter (_)
select * from tbl_buku where pengarang LIKE '__O' -- pengarang yang diakhiri dengan O diawali 3 karakter (_)
select * from tbl_buku where pengarang LIKE '_W_' -- pengarang yang mengandung W 
select * from tbl_buku where isbn LIKE '______3' 

select * from tbl_buku where pengarang LIKE '[A-E]%' -- karakter didalam himpunan

select * from tbl_buku where pengarang LIKE '[A,B,C,D,E]%'

select * from tbl_buku where pengarang LIKE '%[IB]%'

select * from tbl_buku where pengarang LIKE '%[ER]%'
select * from tbl_buku where pengarang NOT LIKE '%[AN]%'

select * from tbl_buku where pengarang LIKE '[^A-E]%'

select * from tbl_buku where judul LIKE 'SI%' --challange 1
select pengarang,penerbit, judul from tbl_buku where judul LIKE 'S%'  --challange 2
select stok,judul from tbl_buku where judul NOT LIKE '%[K,B,C]%'     --challange 3

select judul from tbl_buku ORDER BY judul ASC
select judul from tbl_buku ORDER BY judul DESC

select * from tbl_buku ORDER BY pengarang ASC --challange 1
select * from tbl_buku where penerbit='Badiklat' ORDER BY judul DESC --challange 2
select * from tbl_buku ORDER BY jml_halaman DESC --challange 3

select TOP 3 stok, judul from tbl_buku ORDER BY stok DESC --menampilkan nilai tertinggi

select distinct penerbit from tbl_buku --menampilkan baris data yang unik

select distinct tahun from tbl_buku
select distinct no_rak from tbl_buku

select ceiling (5.2) --pembulatan ke atas --ceiling/langit2
select floor (5.2)   --pembulatan ke bawah --floor/lantai

select power(3,2) --pemangkatan / fungsi kuadrat
select sqrt(49) -- hasil akar
select sqrt(81) -- hasil akar

select round (3.454,2) --pembulatan 2 digit terakhir
select round (3.457,2) --pembulatan 2 digit terakhir

select round (3.4447,1) --pembulatan 1 digit terakhir

select round (3.454400,3) --pembulatan 3 digit terakhir
select round (3.454500,3) --pembulatan 3 digit terakhir
select round (3.454800,3) --pembulatan 3 digit terakhir

select left('PROGRAMMER',2)  --mengambil 2 karakter paling kiri
select left('PROGRAMMER',4)  --mengambil 4 karakter paling kiri

select right('PROGRAMMER ',2)  --mengambil 2 karakter paling kanan dan spasi dihitung sbg karakter
select right('PROGRAMMER',4)  --mengambil 4 karakter paling kanan

select len('Nur Iskandar Zulkarnaen')  --menghitung panjang karakter
select len('PROGRAMMER')

select lower('PROGRAMMER') --memperkecil huruf dr kapital / lowcase

select upper('programmer') --memperbesar huruf ke kapital / upcase

select substring('PROGRAMMER',4,3) --mengambil karakter dalam teks dimulai dari karakter ke brp
select substring('PROGRAMMER',2,3) --mengambil 3 krakter dimulai dr karakter ke 2
select substring('ISBN001',5,3) --mengambil 3 krakter dimulai dr karakter ke 5 / contoh untuk ambil nomor urut dari primary key

select dateadd(year, 28, '1991-09-03') --menambah nilai year/tahun sebanyak 28 tahun
select dateadd(year, -28, '2019-09-03') --mengurangi nilai year/tahun sebanyak 28 tahun / kurangi 28 tahun
select dateadd(year, 25, '1994-11-28') --menambah nilai year/tahun sebanyak 25 tahun
select dateadd(month, 2, '1994-9-28') --menambah nilai mounth/bulan sebanyak 2 bulan

select datediff(yy, '1994-11-28', getdate()) as 'Usia' --mencari selisih tanggal / contoh menhitung usia dari tahun sekarang/getdate

select getdate()

select datename(year, '2019-07-18 14:08:25.377'),
		datename(month, '2019-07-18 14:08:25.377'),
		datename(day, '2019-07-18 14:08:25.377'),
		datename(dayofyear, '2019-07-18 14:08:25.377'),
		datename(weekday, '2019-07-18 14:08:25.377')

select datename(year, '1994-11-28 14:08:25.377'),
		datename(month, '1994-11-28 14:08:25.377'),
		datename(day, '1994-11-28 14:08:25.377'),
		datename(dayofyear, '1994-11-28 14:08:25.377'),
		datename(weekday, '1994-11-28 14:08:25.377')

select datename(dayofyear, '2019-02-10 14:08:25.377') --hari ke 41 dalam setahun

select datepart(week, '2019-07-18') --mencari minggu ke berapa dalam tanggal dalam setahun
select datepart(week, '2019-02-2') --mencari minggu ke berapa dalam tanggal dalam setahun

select getdate() as 'Waktu Saat Ini'

select day('2019-07-18 14:08:25.377') --ambil day
select month('2019-07-18 14:08:25.377') --ambil month
select year('2019-07-18 14:08:25.377') --ambil year

select GETUTCDATE() --menampilkan waktu secara universal / GMT atau jam kit UTC+7 atau GMT+7 / GMT 0
select GETDATE() --waktu saat ini

----FUNGSI AGGREGATE----
select 'Rata-rata Stok Buku' = AVG(stok) FROM tbl_buku --menghitung rata2
select 'Rata-rata Jumalah Halaman' = AVG(jml_halaman) FROM tbl_buku --menghitung rata2
select 'Banyak stok Buku' = COUNT(stok) FROM tbl_buku --menghitung banyaknya stok
select 'Total stok Buku' = SUM(stok) FROM tbl_buku --menghitung total stok
select 'Minimum stok Buku' = MIN(stok) FROM tbl_buku --Minimum stok
select 'Maximum stok Buku' = MAX(stok) FROM tbl_buku --Maximum stok
select * from tbl_buku

select * from tbl_buku

insert into tbl_anggota values('Nur Iskandar Zulkarnaen', 'Boyolali')
insert into tbl_anggota values('Roy Florendo', 'Jakarta')
insert into tbl_anggota values('Taufiq Extra', 'Bandung')
insert into tbl_anggota values('Darmuji', 'Jakarta')
insert into tbl_anggota values('Diyon Putra Negara', 'Depok')

select * from tbl_buku
select * from tbl_anggota
select * from tbl_peminjaman

insert into tbl_peminjaman values(GETDATE(),'2019-07-25','Pinjam',1)
insert into tbl_peminjaman values('2019-07-11','2019-07-14','Pinjam dengan ketentuan',2)
insert into tbl_peminjaman values('2019-07-10','2019-07-24','Pinjam Buku Robot Manusia Berwarna',5)
insert into tbl_peminjaman values('2019-07-09','2019-07-14','Pinjam Buku',4)
insert into tbl_peminjaman values('2019-07-19','2019-07-22','Pinjam Bukunya ',3)
