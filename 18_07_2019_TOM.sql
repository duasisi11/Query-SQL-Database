USE db_library
go

INSERT INTO [db_library].[dbo].[tbl_kategori] VALUES ('Jurnal')
INSERT INTO [db_library].[dbo].[tbl_kategori] VALUES ('Komik')
INSERT INTO [db_library].[dbo].[tbl_kategori] VALUES ('Ensiklopedia')
INSERT INTO [db_library].[dbo].[tbl_kategori] VALUES ('Cergam')

INSERT INTO [db_library].[dbo].[tbl_buku] VALUES ('ISBN001', 'Menunggu Singlemu', 'Badiklat', 'Toma', 235, 2019, 33, 'A5', 1)
INSERT INTO [db_library].[dbo].[tbl_buku] VALUES ('ISBN002', 'Generasi Millenial', 'Badiklat', 'Leo', 111, 2019, 63, 'B5', 2)
INSERT INTO [db_library].[dbo].[tbl_buku] VALUES ('ISBN003', 'Si Belang', 'Badiklat', 'Heribertus', 200, 2010, 3, 'C5', 3)
INSERT INTO [db_library].[dbo].[tbl_buku] VALUES ('ISBN004', 'Ensiklopedia Lengkap', 'Gramedia', 'Yanwar', 350, 2013, 9, 'D5', 4)
INSERT INTO [db_library].[dbo].[tbl_buku] VALUES ('ISBN005', 'Robot dan Manusia Bewarna', 'Erlangga', 'Dwi', 35, 2007, 100, 'A5', 5)

SELECT * FROM tbl_buku

SELECT left('PROGRAMMER', 2)

SELECT len('PROGRAMMER')

SELECT lower('PROGRAMMER')

SELECT right(' PROGRAMMER ', 2)

SELECT substring('PROGRAMMER',4,3)

SELECT upper('programmer')

SELECT getdate() as 'Waktu Saat Ini'

SELECT datediff(yy, '1991-09-03', getdate()) as 'Usia'

SELECT DATEADD(year, 28, '1991-09-03')

SELECT DATEADD(year, -28, '2019-09-03')

SELECT DATENAME(year, '2019-07-18 01:28:58.507'),
	DATENAME(month, '2019-07-18 01:28:58.507'),
	DATENAME(day, '2019-07-18 01:28:58.507'),
	DATENAME(dayofyear, '2019-07-18 01:28:58.507'),
	DATENAME(weekday, '2019-07-18 01:28:58.507')

SELECT DATEPART(year, '2019-07-18 01:28:58.507'),
	DATEPART(month, '2019-07-18 01:28:58.507'),
	DATEPART(day, '2019-07-18 01:28:58.507'),
	DATEPART(dayofyear, '2019-07-18 01:28:58.507'),
	DATEPART(weekday, '2019-07-18 01:28:58.507')

SELECT DATEPART(week, '2019-07-18')

SELECT DAY('2019-07-18 01:28:58.507')

SELECT MONTH('2019-07-18 01:28:58.507')

SELECT YEAR('2019-07-18 01:28:58.507')

SELECT 'Total Stok Buku' = SUM(stok) FROM tbl_buku

SELECT 'Maximum Stok Buku' = MAX(stok) FROM tbl_buku

SELECT 'Minimum Stok Buku' = MIN(stok) FROM tbl_buku

SELECT 'Banyak Stok Buku' = COUNT(stok) FROM tbl_buku

SELECT 'Rata-rata Stok Buku' = AVG(stok) FROM tbl_buku


SELECT ceiling (5.2)

SELECT floor (5.2)

SELECT power (3,2)

SELECT round (3.454,2)

SELECT round (3.457,2)

SELECT round(9876.345, 2)

SELECT round(9876.344, 2)

SELECT sqrt (81)


SELECT DISTINCT penerbit FROM tbl_buku

SELECT TOP 3 stok FROM tbl_buku
ORDER BY stok DESC


SELECT judul FROM tbl_buku
ORDER BY judul ASC

SELECT judul FROM tbl_buku
ORDER BY judul DESC

SELECT * FROM tbl_buku
WHERE pengarang LIKE '[^A-C]%'

SELECT * FROM tbl_buku
WHERE pengarang LIKE '%[^A-C]'

SELECT * FROM tbl_buku
WHERE pengarang LIKE '%[^A-C]%'


SELECT * FROM tbl_buku
WHERE pengarang LIKE '[A-C]%'

SELECT * FROM tbl_buku
WHERE pengarang LIKE '%[A-C]'

SELECT * FROM tbl_buku
WHERE pengarang LIKE '%[A-C]%'


SELECT * FROM tbl_buku
WHERE pengarang LIKE 'T___'

SELECT * FROM tbl_buku
WHERE pengarang LIKE '__o'

SELECT * FROM tbl_buku
WHERE pengarang LIKE '_w_'

SELECT * FROM tbl_buku
WHERE judul LIKE 'S%'

SELECT * FROM tbl_buku
WHERE judul LIKE '%l'

SELECT * FROM tbl_buku
WHERE judul LIKE '%G%'

SELECT * FROM tbl_buku
WHERE stok BETWEEN 50 AND 150

SELECT * FROM tbl_buku
WHERE stok NOT BETWEEN 50 AND 150

SELECT * FROM tbl_buku
WHERE NOT penerbit = 'Badiklat'

SELECT * FROM tbl_buku
WHERE penerbit = 'Badiklat' AND stok > 50

SELECT * FROM tbl_buku
WHERE penerbit = 'Badiklat' OR penerbit = 'Gramedia'


SELECT judul, 'Stok Baru' = stok + 50  
FROM tbl_buku


SELECT judul
FROM tbl_buku
WHERE stok > 50

SELECT judul
FROM tbl_buku
WHERE penerbit = 'Badiklat'