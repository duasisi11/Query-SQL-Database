use db_library

SELECT * FROM tbl_buku JOIN tbl_kategori ON tbl_buku.id_kategori = tbl_kategori.id_kategori

SELECT tbl_buku.*, tbl_kategori.nama_kategori FROM tbl_buku, tbl_kategori where tbl_buku.id_kategori = tbl_kategori.id_kategori

Select k.id_kategori, k.nama_kategori from tbl_kategori k JOIN tbl_buku b ON k.id_kategori = b.id_kategori
WHERE (k.id_kategori=b.id_kategori)

sp_help tbl_kategori
sp_help tbl_buku

alter table tbl_buku delete constraint FK_tbl_buku_tbl_kategori

Select k.id_kategori, k.nama_kategori from tbl_kategori k JOIN tbl_buku b ON k.id_kategori = b.id_kategori
WHERE (k.id_kategori=b.id_kategori)

Select id_kategori, nama_kategori from tbl_kategori 