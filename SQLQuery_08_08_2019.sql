

select * from tbl_anggota
select * from tbl_pengembalian
select * from tbl_peminjaman
select * from tbl_det_peminjaman
select * from tbl_buku
select * from tbl_kategori

select * from tbl_buku
select * from tbl_anggota

--insert into tbl_det_peminjaman values(2,17,6)
insert into tbl_pengembalian


select b.*, k.nama_kategori from tbl_buku b JOIN tbl_kategori k ON b.id_kategori = k.id_kategori where nama_kategori='Cergam' OR nama_kategori='Novel'; --No 1

select p.*, a.nama, b.judul, k.nama_kategori from tbl_anggota a 
JOIN tbl_peminjaman p ON a.id_anggota=p.id_anggota
JOIN tbl_det_peminjaman dp ON p.id_peminjaman = dp.id_peminjaman
JOIN tbl_buku b ON dp.id_buku = b.id_buku 
JOIN tbl_kategori k ON b.id_kategori = k.id_kategori
where k.nama_kategori='Jurnal'; --No 2

select pb.*, a.nama, b.* from tbl_anggota a 
JOIN tbl_pengembalian pb ON a.id_anggota=pb.id_anggota
JOIN tbl_peminjaman p ON pb.id_peminjaman = p.id_peminjaman
JOIN tbl_det_peminjaman dp ON p.id_peminjaman = dp.id_peminjaman
JOIN tbl_buku b ON dp.id_buku = b.id_buku; --No 3

--select b.*, a.nama from tbl_anggota a 
--JOIN tbl_pengembalian pb ON a.id_anggota=pb.id_anggota
--JOIN tbl_peminjaman p ON pb.id_peminjaman = p.id_peminjaman
--JOIN tbl_det_peminjaman dp ON p.id_peminjaman = dp.id_peminjaman
--JOIN tbl_buku b ON dp.id_buku = b.id_buku; -- No 4

select b.*, a.nama from tbl_anggota a 
JOIN tbl_peminjaman p ON a.id_anggota = p.id_anggota
JOIN tbl_det_peminjaman dp ON p.id_peminjaman = dp.id_peminjaman
JOIN tbl_buku b ON dp.id_buku = b.id_buku; -- No 4

select a.*,  k.nama_kategori, b.*, p.tgl_kembali from tbl_anggota a 
JOIN tbl_peminjaman p ON a.id_anggota = p.id_anggota
JOIN tbl_det_peminjaman dp ON p.id_peminjaman = dp.id_peminjaman
JOIN tbl_buku b ON dp.id_buku = b.id_buku
JOIN tbl_kategori k ON b.id_kategori = k.id_kategori
where k.nama_kategori ='Novel'; -- No 5

--------------------------------Pustakaku-----------------
SELECT a.nama, b.judul, p.tgl_pinjam, p.tgl_kembali, p.keterangan from tbl_anggota a 
JOIN tbl_peminjaman p ON a.id_anggota=p.id_anggota
JOIN tbl_det_peminjaman dp ON p.id_peminjaman = dp.id_peminjaman
JOIN tbl_buku b ON dp.id_buku = b.id_buku 
WHERE p.id_peminjaman=1







exec sp_help 
