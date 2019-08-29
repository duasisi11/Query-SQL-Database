use kepegawaian;

create procedure insertDataJab
@Kode_Jabatan char(4),
@Nama_Jabatan varchar(10),
@Tunjangan_Jabatan money
AS
INSERT schkaryawan.jabatan values(@Kode_Jabatan, @Nama_Jabatan,@Tunjangan_Jabatan)
return

--select * from schkaryawan.jabatan;

exec insertDataJab 'dri', 'driver', 600000;

alter procedure tampilanjabatan
as
	select * from schkaryawan.jabatan 
	return

exec tampilanjabatan

create procedure updatejabatan
@kode_jabatan char(4),
@Nama_jabatan varchar(30)
as
	begin
		begin try
			begin transaction
			update schkaryawan.jabatan set Nama_jabatan=@Nama_jabatan where kode_jabatan=@kode_jabatan
			commit transaction
			print 'Transaction Commit'
		end try
		begin catch
			rollback transaction
			print 'Transaction rollback'
		end catch
	end

exec updatejabatan 'dri', 'drinker'

create procedure deletejabatan
@kode_jabatan char(4)
as
	begin
		begin try
			begin transaction
			delete schkaryawan.jabatan where kode_jabatan=@kode_jabatan
			commit transaction
			print 'Transaction Commit'
		end try
		begin catch
			rollback transaction
			print 'Transaction rollback'
		end catch
	end

exec deletejabatan 'dri'

-------------------------------PEGAWAI-----------------------------------------------------------------------
select * from schkaryawan.pegawai

create procedure insertPegawai
@nip char(4),
@nama varchar(30),
@alamat varchar(50),
@kota varchar(50),
@tempat_lhr varchar(30),
@tgl_lhr smalldatetime,
@pendidikan char(3),
@jns_kelamin char(6),
@agama char(10),
@kode_gapok char(4),
@status varchar(20),
@jml_anak int
AS
INSERT schkaryawan.pegawai values(@nip, @nama, @alamat, @kota, @tempat_lhr, @tgl_lhr, @pendidikan, @jns_kelamin, @agama, @kode_gapok, @status, @jml_anak)
return

create procedure tampilanPegawai
as
	select * from schkaryawan.pegawai 
	return

exec tampilanPegawai

create procedure updatePegawai
@nip char(4),
@nama varchar(30),
@alamat varchar(50),
@kota varchar(50),
@tempat_lhr varchar(30),
@tgl_lhr smalldatetime,
@pendidikan char(3),
@jns_kelamin char(6),
@agama char(10),
@kode_gapok char(4),
@status varchar(20),
@jml_anak int
as
	begin
		begin try
			begin transaction
			update schkaryawan.pegawai set nama=@nama, alamat=@alamat, kota=@kota, tempat_lhr=@tempat_lhr, tgl_lhr=@tgl_lhr, pendidikan=@pendidikan, jns_kelamin=@jns_kelamin, agama=@agama, kode_gapok=@kode_gapok, status=@status, jml_anak=@jml_anak where nip=@nip
			commit transaction
			print 'Transaction Commit'
		end try
		begin catch
			rollback transaction
			print 'Transaction rollback'
		end catch
	end


create procedure deletePegawai
@nip char(4)
as
	begin
		begin try
			begin transaction
			delete schkaryawan.pegawai where nip=@nip
			commit transaction
			print 'Transaction Commit'
		end try
		begin catch
			rollback transaction
			print 'Transaction rollback'
		end catch
	end

exec tampilanPegawai;
exec deletePegawai 'P123'

select * from DataTriggerLogPegawai
select * from Log_tabelpegawai

select * from schkaryawan.gaji_pokok

-------------------------------GAJI POKOK-----------------------------------------------------------------------
select * from schkaryawan.gaji_pokok
select Kode_Jabatan from schkaryawan.jabatan
select Kode_Golongan from schkaryawan.golongan

create procedure insertGajiPokok
@Kode_Gapok char(4),
@Kode_Jabatan char(4),
@Kode_Golongan int,
@gaji_pokok money
AS
INSERT schkaryawan.gaji_pokok values(@Kode_Gapok, @Kode_Jabatan, @Kode_Golongan, @gaji_pokok)
return

create procedure tampilanGajiPokok
as
	select * from schkaryawan.gaji_pokok 
	return

exec tampilanGajiPokok

create procedure updateGajiPokok
@Kode_Gapok char(4),
@Kode_Jabatan char(4),
@Kode_Golongan int,
@gaji_pokok money
as
	begin
		begin try
			begin transaction
			update schkaryawan.gaji_pokok set Kode_Jabatan=@Kode_Jabatan, Kode_Golongan=@Kode_Golongan, gaji_pokok=@gaji_pokok where Kode_Gapok=@Kode_Gapok
			commit transaction
			print 'Transaction Commit'
		end try
		begin catch
			rollback transaction
			print 'Transaction rollback'
		end catch
	end


create procedure deleteGajiPokok
@Kode_Gapok char(4)
as
	begin
		begin try
			begin transaction
			delete from schkaryawan.gaji_pokok where Kode_Gapok=@Kode_Gapok
			commit transaction
			print 'Transaction Commit'
		end try
		begin catch
			rollback transaction
			print 'Transaction rollback'
		end catch
	end