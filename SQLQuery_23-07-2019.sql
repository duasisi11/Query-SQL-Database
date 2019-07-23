--create procedure proPegawai
--AS
--BEGIN
--SELECT NIP,Nama FROM schkaryawan.pegawai;
--END

sp_helptext 'proPegawai'
sp_help 'proPegawai'

exec proPegawai
--=================EDIT PROCEDURE
alter procedure proPegawai
AS
BEGIN
SELECT NIP,Nama,Alamat FROM schkaryawan.pegawai;
END

exec proPegawai

--=================DELETE PROCEDURE
DROP procedure proPegawai

--=================PROCEDURE dengan parameter
CREATE procedure proPegawaiDetail @No_NIP char(4)
AS
BEGIN
	PRINT 'Data Pegawai dengan NIP :'+@No_NIP --ngeprint dimessages
	SELECT * FROM schkaryawan.pegawai
	where NIP = @No_NIP
END

EXEC proPegawaiDetail 'P001'

--create database stasiun
--use stasiun

--create table tiket
--(id_tiket char(4) not null primary key,
--tujuan_tiket varchar(20),
--harga_tiket int
--)

--CREATE TABLE penumpang
--(
--id_penumpang char(4) not null primary key,
--nama_penumpang varchar(10),
--id_tiket char(4),
--foreign key (id_tiket) references tiket(id_tiket)
--)

--create table pesan
--(
--id_pemesanan char(4) not null primary key,
--id_penumpang char(4),
--id_tiket char(4),
--jumlah_tiket int,
--total int,
--foreign key(id_penumpang) references penumpang(id_penumpang),
--foreign key(id_tiket) references tiket(id_tiket)
--)


--create procedure insert_data
--(
--@id_tiket char(4),
--@tujuan_tiket varchar(20),
--@harga_tiket int,
--@id_penumpang char(4),
--@nama_penumpang varchar(10),
--@id_pemesanan char(4),
--@cid_penumpang char(4),
--@cid_tiket char(4),
--@jumlah_tiket int
--)
--as
--begin
--insert into tiket values (@id_tiket,@tujuan_tiket,@harga_tiket)
--insert into penumpang values (@id_penumpang,@nama_penumpang,@id_tiket)
--insert into pesan values (@id_pemesanan,@cid_penumpang,@cid_tiket,@jumlah_tiket,@jumlah_tiket*@harga_tiket)
--end

exec insert_data 'T001','Jakarta',2000,'P001','Andi','S001','P001','T001',4

--select *from tiket
--select *from penumpang
--select *from pesan


create database toko_buku
use toko_buku

--CREATE TABLE tbl_customer(
--id_cust char(5) NOT NULL PRIMARY KEY,
--nama varchar(35) NOT NULL,
--jk char(1) NOT NULL);

--CREATE TABLE tbl_employee(
--id_emp char(5) NOT NULL PRIMARY KEY,
--nama varchar(35) NOT NULL,
--jk char(1) NOT NULL,
--gaji int);

--CREATE TABLE tbl_buku(
--code_book char(5) NOT NULL PRIMARY KEY,
--nama varchar(35) NOT NULL,
--stok int,
--harga money)

--CREATE TABLE tbl_transaction(
--id_trx char(5) NOT NULL PRIMARY KEY,
--jumlah_trx int,
--cust_id char(5) FOREIGN KEY REFERENCES tbl_customer(id_cust),
--prod_id char(5) FOREIGN KEY REFERENCES tbl_buku(code_book),
--emp_id char(5) FOREIGN KEY REFERENCES tbl_employee(id_emp),
--date_trx datetime)

--INSERT INTO tbl_customer VALUES('C0001', 'Candice', 'F')
--INSERT INTO tbl_customer VALUES('C0002', 'Phillip', 'M')
--INSERT INTO tbl_customer VALUES('C0003', 'Patricia', 'F')
--INSERT INTO tbl_customer VALUES('C0004', 'John', 'M')
--INSERT INTO tbl_customer VALUES('C0005', 'Irene', 'F')
--INSERT INTO tbl_customer VALUES('C0006', 'Shawn', 'M')
--INSERT INTO tbl_customer VALUES('C0007', 'Stephen', 'M')
--INSERT INTO tbl_customer VALUES('C0008', 'Jose', 'M')
--INSERT INTO tbl_customer VALUES('C0009', 'Kelli', 'M')
--INSERT INTO tbl_customer VALUES('C0010', 'Sheila', 'F')

--INSERT INTO tbl_employee VALUES('E0001', 'Robert', 'M', 250)
--INSERT INTO tbl_employee VALUES('E0002', 'Lili', 'M', 150)
--INSERT INTO tbl_employee VALUES('E0003', 'June', 'F', 150)
--INSERT INTO tbl_employee VALUES('E0004', 'Alfa', 'M', 300)
--INSERT INTO tbl_employee VALUES('E0005', 'Bravo', 'F', 250)

--INSERT INTO tbl_buku VALUES('B0001', 'Sepanjang Jalan Kenangan', 100, 20)
--INSERT INTO tbl_buku VALUES('B0002', 'The Each Word', 100, 15)
--INSERT INTO tbl_buku VALUES('B0003', 'Manusia Batu', 100, 8)
--INSERT INTO tbl_buku VALUES('B0004', 'Manusia Ikan', 100, 13)
--INSERT INTO tbl_buku VALUES('B0005', 'Shark', 100, 12)
--INSERT INTO tbl_buku VALUES('B0006', 'Annabelle', 100, 15)
--INSERT INTO tbl_buku VALUES('B0007', 'Fire', 100, 10)

--select * from tbl_buku

create procedure prodBuku1
AS
BEGIN
select * from tbl_buku;
END

exec prodBuku1 

CREATE PROCEDURE prod_satu
AS
BEGIN
	-- isi procedure
	PRINT 'Data Tabel Dipanggil'
	SELECT * FROM tbl_customer;
END

EXEC prod_satu

CREATE PROCEDURE prod_dua @emp_id char(5)
AS
BEGIN
	PRINT 'Data Karyawan'
	SELECT * FROM tbl_employee WHERE id_emp =  @emp_id
END

EXEC prod_dua 'E0003'

SELECT * FROM tbl_transaction

CREATE PROCEDURE pertama @trx_id char(5) OUTPUT, @cust_id char(5), @id_prod char(5) OUTPUT
AS
BEGIN
	IF EXISTS (SELECT * FROM tbl_customer WHERE id_cust = @cust_id)
		BEGIN
			SELECT @trx_id = t.id_trx, @id_prod = t.prod_id
			FROM tbl_transaction t JOIN tbl_customer c ON c.id_cust = t.cust_id
			JOIN tbl_buku b ON b.code_book = t.prod_id
			WHERE c.id_cust = @cust_id
			RETURN 0
		END
	ELSE
		BEGIN
			PRINT 'Tidak ada data yang ditemukan'
			RETURN 1
		END
END

CREATE PROCEDURE kedua @cust_idd char(5)
AS
BEGIN
	DECLARE @trx_idd char(5)
	DECLARE @prod_idd char(5)
	DECLARE @nilai_kembalian_dari_prosedur_pertama int
	-- EKSEKUSI atau PEMANGGILAN prosedur PERTAMA
	EXEC @nilai_kembalian_dari_prosedur_pertama = pertama @trx_idd OUTPUT, @cust_idd, @prod_idd OUTPUT
	IF (@nilai_kembalian_dari_prosedur_pertama = 0)
		BEGIN
			PRINT 'Data Transaksi Lengkap'
			PRINT 'ID Customer: '+ @cust_idd
			PRINT 'ID Product:'+ @prod_idd
			PRINT 'ID Transaction: '+ @trx_idd
			SELECT nama FROM tbl_customer WHERE id_cust =  @cust_idd
		END
	ELSE
		PRINT 'Data tidak ditemukan atau tidak cocok'
END

select * from tbl_transaction
-- EKSEKUSI PROCEDURE PERTAMA
EXEC pertama 'T0001', 'C0004', 'B0003'

-- EKSEKUSI PROCEDURE KEDUA (yang mana juga akan otomatis memanggil procedure pertama)
EXEC kedua 'C0004'

SELECT * FROM tbl_transaction




