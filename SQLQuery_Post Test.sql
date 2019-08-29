create table supplier(
kode_supplier char(4),
nama_supplier varchar(50),
telepon varchar(12),
constraint pk_kode_supplier primary key(kode_supplier))

create table barang(
kode_barang char(4) constraint pk_kode_barang primary key(kode_barang),
kode_supplier char(4) constraint fk_kode_supplier references supplier(kode_supplier),
nama_barang varchar(50),
stok int,
harga_jual money)

create table pelanggan(
kode_pelanggan char(4),
nama_pelanggan varchar(50),
alamat text,
telepon varchar(12),
constraint pk_kode_pelanggan primary key(kode_pelanggan)) 


create table transaksi(
kode_transaksi int identity(1,1) constraint pk_kode_transaksi primary key(kode_transaksi),
tanggal date,
kode_barang char(4) constraint fk_kode_barang references barang(kode_barang), 
kode_pelanggan char(4) constraint fk_kode_pelanggan references pelanggan(kode_pelanggan),
jumlah int) 

select * from supplier
select * from barang
select * from pelanggan
select * from transaksi

create trigger AfterInsertTransaksi_KurangiStokBarang_Trigger
ON transaksi
AFTER INSERT
AS
BEGIN
UPDATE barang set barang.stok=(barang.stok-inserted.jumlah) from inserted where barang.kode_barang=inserted.kode_barang
PRINT 'Data stok pada tabel barang berhasil dikurangi'
END

insert into transaksi values('2019-04-02', 'B003', 'P001', 1)


