select * from tbl_peminjaman
select * from tbl_det_peminjaman
select * from tbl_anggota

--CREATE TRIGGER checkpinjam ON tbl_peminjaman FOR insert, update
--AS
--	BEGIN
--		IF((SELECT COUNT (id_anggota) FROM tbl_peminjaman WHERE id_anggota
--		LIKE (SELECT id_anggota FROM inserted)) > 1)
--		BEGIN 
--			PRINT 'Anggota masih tercatat belum mengembalikan buku'
--			ROLLBACK TRANSACTION
--		END
--		ELSE
--		BEGIN
--			COMMIT TRANSACTION
--			PRINT 'Berhasil disimpan'
--		END
--	END
--GO

TRUNCATE TABLE tbl_peminjaman;
TRUNCATE TABLE tbl_det_peminjaman;

--insert tbl_anggota values('Deni Supriyadi','Surakarta')
INSERT INTO tbl_peminjaman values(GETDATE(),GETDATE()+1,'Jaminan KTP',6)

INSERT INTO tbl_peminjaman values(GETDATE(),GETDATE()+1,'Jaminan SIM',1)

select * from tbl_buku

CREATE TRIGGER check_buku ON tbl_buku FOR insert, update
AS
	BEGIN
		IF((SELECT COUNT (id_kategori) FROM tbl_buku WHERE id_kategori
		LIKE (SELECT id_kategori FROM inserted)) > 1)
		BEGIN 
			PRINT 'Kategori buku tidak boleh sama / masih tercatat'
			ROLLBACK TRANSACTION
		END
		ELSE
		BEGIN
			COMMIT TRANSACTION
			PRINT 'Berhasil disimpan'
		END
	END
GO