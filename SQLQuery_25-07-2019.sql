--declare variable
DECLARE @var_umur int, @var_judul varchar(max)

--assign data
SELECT @var_umur = 27, @var_judul = 'Penghianatan Seorang Bestie'

--SET @var_umur = 27
--SET @var_judul = 'Novel'

--print variable
PRINT @var_umur
PRINT @var_judul

--Latihan
select * from tbl_buku;

DECLARE @ttl_jml_halaman int
SELECT @ttl_jml_halaman = SUM(jml_halaman) from tbl_buku where penerbit='Badiklat' 
PRINT @ttl_jml_halaman

--Buatlah variable penampung yang akan menampung jumlah stok pada RAK A5

DECLARE @jumlah_stok int
SELECT @jumlah_stok = SUM(stok) from tbl_buku where no_rak ='A5' 
PRINT @jumlah_stok

--Buatlah variable penampung yang akan menampung jumlah stok pada setiap RAK 
DECLARE @stok_A5 int, @stok_B5 int, @stok_C5 int, @stok_D5 int
SELECT @stok_A5 = SUM(stok) from tbl_buku where no_rak ='A5' 
SELECT @stok_B5 = SUM(stok) from tbl_buku where no_rak ='B5' 
SELECT @stok_C5 = SUM(stok) from tbl_buku where no_rak ='C5' 
SELECT @stok_D5 = SUM(stok) from tbl_buku where no_rak ='D5' 
PRINT ' Stok buku di Rak A5 :'+ CAST(@stok_A5 AS varchar)  
PRINT ' Stok buku di Rak B5 :'+ CAST(@stok_B5 AS varchar) 
PRINT ' Stok buku di Rak C5 :'+ CAST(@stok_C5 AS varchar)  
PRINT ' Stok buku di Rak D5 :'+ CAST(@stok_D5 AS varchar) 

SELECT DISTINCT k.nama_kategori FROM
tbl_kategori k JOIN tbl_buku b
ON k.id_kategori = b.id_kategori
WHERE b.pengarang='Leo'

SELECT a.nama, b.judul, pin.tgl_pinjam, kbl.tgl, kbl.denda 
from tbl_buku b, tbl_det_peminjaman detpin, tbl_peminjaman pin, tbl_anggota a, tbl_pengembalian kbl   
where b.id_buku=detpin.id_buku and detpin.id_peminjaman=pin.id_peminjaman and pin.id_anggota=a.id_anggota and a.id_anggota = kbl.id_anggota     
and a.id_anggota = 3 

--====================DENGAN JOIN===============--
SELECT a.nama, b.judul, pin.tgl_pinjam, kbl.tgl, kbl.denda 
from tbl_buku b JOIN tbl_det_peminjaman detpin ON b.id_buku=detpin.id_buku
JOIN tbl_peminjaman pin ON detpin.id_peminjaman=pin.id_peminjaman 
JOIN tbl_anggota a ON pin.id_anggota=a.id_anggota 
JOIN tbl_pengembalian kbl ON  a.id_anggota = kbl.id_anggota         
where a.id_anggota = 3 

/*PEMBUATAN PROCEDURE */
CREATE PROCEDURE prod_satu
AS
BEGIN
	-- ISI PROCEDURE
	PRINT 'SATU UNTUK SEMUA, SEMUA UNTUK SATU'
	SELECT * FROM tbl_buku
END

/*PEMANGGILAN PROCEDURE*/
EXEC prod_satu

CREATE PROCEDURE tampil_peminjaman
AS
BEGIN
	 SELECT id_peminjaman, tgl_pinjam, tgl_kembali, keterangan, a.nama 
	 FROM tbl_peminjaman pin JOIN tbl_anggota a ON pin.id_anggota=a.id_anggota 
END

exec tampil_peminjaman 

--Tampilkan nama kategori dari buku yang diterbitkan oleh penerbit Gramedia, buatlah dalam bentuk procedure
CREATE PROCEDURE tampil_kategori
AS
BEGIN
	 SELECT k.nama_kategori , b.penerbit
	 FROM tbl_kategori k JOIN tbl_buku b ON k.id_kategori=b.id_kategori 
	 where b.penerbit='Gramedia'
END

exec tampil_kategori

select * from tbl_buku

--Deklarasi
CREATE PROCEDURE prod_tiga @id_buku int
AS
BEGIN
	PRINT 'Data Buku'
	SELECT * FROM tbl_buku WHERE id_buku = @id_buku
END
GO

--EKSEKUSI
exec prod_tiga 3

--Deklarasi
ALTER PROCEDURE prod_penulis @penerbit varchar(max)
AS
	IF EXISTS (SELECT pengarang AS 'Punulis' FROM tbl_buku WHERE penerbit = @penerbit)
	BEGIN
		SELECT pengarang AS 'Punulis' FROM tbl_buku WHERE penerbit = @penerbit
	END
	ELSE
	BEGIN
	  PRINT 'Data tidak ditemukan'
	END
GO

--EKSEKUSI
exec prod_penulis 'fdf'
exec prod_penulis 'Gramedia'

SELECT * FROM tbl_buku

--PROCEDURE PERTAMA (DIPANGGIL)
CREATE PROCEDURE prod_dipanggil
@id_buku int OUTPUT,
@judul varchar(max) OUTPUT,
@pengarang varchar(max) OUTPUT,
@stok int OUTPUT
AS
	BEGIN 
	IF EXISTS (SELECT * FROM tbl_buku WHERE id_buku = @id_buku)
		BEGIN
			SELECT @judul = judul, @pengarang = pengarang, @stok=stok, @id_buku = id_buku
			FROM tbl_buku
			WHERE id_buku = @id_buku
			RETURN 0
		END
	ELSE
		BEGIN
			PRINT 'Tidak ada data yang ditemukan'
			RETURN 1
		END
	END
GO

--PROCEDURE KEDUA (PEMANGGIL)
CREATE PROCEDURE prod_pemanggil @id_buku int
AS
BEGIN 
	DECLARE @judul varchar(max)
	DECLARE @pengarang varchar(max)
	DECLARE @stok int
	DECLARE @buku_id int
	DECLARE @nilai_kembalian_dari_prosedur_yang_dipanggil int
	--EKSEKUSI atau PEMANGGILAN prosedur PERTAMA
	EXEC @nilai_kembalian_dari_prosedur_yang_dipanggil = prod_dipanggil
	@id_buku OUTPUT,
	@judul OUTPUT, 
	@pengarang OUTPUT,
	@stok OUTPUT
	IF(@nilai_kembalian_dari_prosedur_yang_dipanggil = 0)
		BEGIN
			PRINT 'Data Buku'
			PRINT 'ID Buku    : '+CAST(@id_buku as varchar(max))
			PRINT 'Judul Buku : '+@judul
			PRINT 'Pengarang  : '+@pengarang
			PRINT 'Stok       : '+CAST(@stok as varchar(max))
			SELECT Judul FROM tbl_buku WHERE id_buku = @id_buku
		END
	ELSE
		PRINT 'Data tidak ditemukan atau tidak cocok'
END
GO

select * from tbl_buku
--EKSEKUSI PROCEDURE PERTAMA
EXEC prod_dipanggil 3, 'Menunggu Singlemu','Toma', 33
--EKSEKUSI PROCEDURE KEDUA (yang mana juga akan otomatis memanggil procedure pertama)
EXEC prod_pemanggil 3



EXEC prod_dipanggil 2, 'Generasi Milenial','Leo', 63
EXEC prod_pemanggil 2



  


