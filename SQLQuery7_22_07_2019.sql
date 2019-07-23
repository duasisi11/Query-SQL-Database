
--delete from schkaryawan.jabatan where kode_jabatan='1234'
insert into schkaryawan.jabatan values ('adm','Administrasi',500000),('Anly','System Analys', 1000000)
insert into schkaryawan.jabatan values ('Bend','Bendahara',400000),('Clea','Cleaning Service',20000)
insert into schkaryawan.jabatan values ('Desi','Sistem Designer',900000),('Dir','Direktur',3000000)
insert into schkaryawan.jabatan values ('Doku','Dokumentasi',500000),('Kons','Konsumsi',200000)
insert into schkaryawan.jabatan values ('Man','Manajer',2000000),('Perl','Perlengkapan',150000)
insert into schkaryawan.jabatan values ('Pers','Personalian',100000),('Res','Resepsionis',300000)
insert into schkaryawan.jabatan values ('Sekr','Sekretaris',400000),('Spro','Senior Programmer',800000),('Ypro','Yunior Programmer',700000)

insert into schkaryawan.golongan values (1,8000,7000,8000,4000,50000),(2,130000,110000,10000,6000,75000)
insert into schkaryawan.golongan values (3,18000,150000,12000,8000,85000),(4,230000,190000,14000,10000,140000)
insert into schkaryawan.golongan values (5,280000,230000,16000,12000,165000)

insert into schkaryawan.gaji_pokok values ('G01','Dir',5,9000000),('G02','Man',5,8000000),('G03','Pers',4,7000000),('G04','Anly',4,6500000),('G05','Desi',4,5500000)
insert into schkaryawan.gaji_pokok values ('G06','Spro',4,5000000),('G07','Ypro',3,4500000)

insert into schkaryawan.pegawai values('P001', 'Indah Ayu','Jl.Jambu No.12 Komp.Cimanggis Indah','Depok','Jakarta','1980-02-12','S2','Wanita','Islam','G07','Menikah',0),
('P002', 'Emma Yulianti','Jl.H.Mahali','Depok','Bangka','1984-03-01','S2','Wanita','Islam','G04','Belum Menikah',0),('P003', 'Fidriyanti','Jl.Depok City','Depok','Depok','1980-02-12','S2','Wanita','Islam','G07','Menikah',2),  
('P004', 'Riza Muhammad Nurman','Jl.Kota Hujan','Bogor','Bogor','1984-01-02','S2','Wanita','Islam','G04','Belum Menikah',0),('P005', 'Musawarman','Jl.Melati No.04','Bogor','Bandung','1980-9-15','S2','Wanita','Islam','G05','Menikah',1) 

alter table schkaryawan.pegawai drop constraint checknip 

sp_help 'schkaryawan.pegawai'	
delete from  schkaryawan.absen
insert into schkaryawan.absen values(1,'2/1/2012','P001',18,2,0),(2,'2/1/2012','P002',19,1,0),(3,'2/1/2012','P003',19,1,0),(4,'2/1/2012','P004',17,2,1)

insert into schkaryawan.lembur values('2/1/2012','P001',2),('2/2/2012','P004',3),('2/3/2012','P005',2)

select * from  schkaryawan.jabatan
select * from  schkaryawan.golongan
select * from  schkaryawan.gaji_pokok
select * from  schkaryawan.absen
select * from  schkaryawan.lembur

--------------------------------- INNER JOIN
select p.nip, p.nama, gp.Kode_Gapok, gp.gaji_pokok from schkaryawan.pegawai p JOIN schkaryawan.gaji_pokok gp on p.kode_gapok = gp.Kode_Gapok  
---------------------------------LEFT OUTER JOIN---------------------------------------tampilkan dominan tabel kiri, kanan null
select p.nip, p.nama, l.jam_lembur from schkaryawan.pegawai p LEFT OUTER JOIN schkaryawan.lembur l ON p.nip=l.nip	
---------------------------------FULL OUTER JOIN---------------------------------------tampilkan semua dari table kanan dan kiri
select a.nip, a.jml_masuk, l.nip, l.jam_lembur from schkaryawan.absen a FULL OUTER JOIN schkaryawan.lembur l ON a.nip = l.nip
---------------------------------CROSS JOIN---------------------------------------
select j.nama_jabatan, g.kode_golongan, j.tunjangan_jabatan + g.tj_istri_suami + g.tj_anak + g.askes AS "Tunjangan" 
from schkaryawan.jabatan j cross join schkaryawan.golongan g
---------------------------------EQUI JOIN--------------------------------------- mecetak semua data pada tiga table setiap kolom dan record
select * from schkaryawan.pegawai p JOIN schkaryawan.lembur l ON p.nip = l.nip JOIN schkaryawan.absen a ON p.nip = a.nip


