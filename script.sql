USE [master]
GO
/****** Object:  Database [db_library]    Script Date: 07/18/2019 08:02:33 ******/
CREATE DATABASE [db_library] ON  PRIMARY 
( NAME = N'db_library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\db_library.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\db_library_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [db_library] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_library] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [db_library] SET ANSI_NULLS OFF
GO
ALTER DATABASE [db_library] SET ANSI_PADDING OFF
GO
ALTER DATABASE [db_library] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [db_library] SET ARITHABORT OFF
GO
ALTER DATABASE [db_library] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [db_library] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [db_library] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [db_library] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [db_library] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [db_library] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [db_library] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [db_library] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [db_library] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [db_library] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [db_library] SET  DISABLE_BROKER
GO
ALTER DATABASE [db_library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [db_library] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [db_library] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [db_library] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [db_library] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [db_library] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [db_library] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [db_library] SET  READ_WRITE
GO
ALTER DATABASE [db_library] SET RECOVERY FULL
GO
ALTER DATABASE [db_library] SET  MULTI_USER
GO
ALTER DATABASE [db_library] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [db_library] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_library', N'ON'
GO
USE [db_library]
GO
/****** Object:  Table [dbo].[tbl_kategori]    Script Date: 07/18/2019 08:02:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_kategori](
	[id_kategori] [int] IDENTITY(1,1) NOT NULL,
	[nama_kategori] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_kategori] PRIMARY KEY CLUSTERED 
(
	[id_kategori] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_anggota]    Script Date: 07/18/2019 08:02:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_anggota](
	[id_anggota] [int] IDENTITY(1,1) NOT NULL,
	[nama] [varchar](50) NULL,
	[alamat] [text] NULL,
 CONSTRAINT [PK_tbl_anggota] PRIMARY KEY CLUSTERED 
(
	[id_anggota] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_buku]    Script Date: 07/18/2019 08:02:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_buku](
	[id_buku] [int] IDENTITY(1,1) NOT NULL,
	[isbn] [varchar](50) NULL,
	[judul] [varchar](125) NULL,
	[penerbit] [varchar](125) NULL,
	[pengarang] [varchar](125) NULL,
	[jml_halaman] [int] NULL,
	[tahun] [int] NULL,
	[stok] [int] NULL,
	[no_rak] [varchar](5) NULL,
	[id_kategori] [int] NULL,
 CONSTRAINT [PK_tbl_ buku] PRIMARY KEY CLUSTERED 
(
	[id_buku] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_peminjaman]    Script Date: 07/18/2019 08:02:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_peminjaman](
	[id_peminjaman] [int] IDENTITY(1,1) NOT NULL,
	[tgl_pinjam] [date] NULL,
	[tgl_kembali] [date] NULL,
	[keterangan] [varchar](50) NULL,
	[id_anggota] [int] NULL,
 CONSTRAINT [PK_tbl_peminjaman] PRIMARY KEY CLUSTERED 
(
	[id_peminjaman] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_pengembalian]    Script Date: 07/18/2019 08:02:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pengembalian](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tgl] [date] NULL,
	[denda] [int] NULL,
	[id_peminjaman] [int] NULL,
	[id_anggota] [int] NULL,
 CONSTRAINT [PK_tbl_pengembalian] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_det_peminjaman]    Script Date: 07/18/2019 08:02:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_det_peminjaman](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[qty] [int] NULL,
	[id_peminjaman] [int] NULL,
	[id_buku] [int] NULL,
 CONSTRAINT [PK_tbl_det_peminjaman] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_tbl_ buku_tbl_kategori]    Script Date: 07/18/2019 08:02:34 ******/
ALTER TABLE [dbo].[tbl_buku]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ buku_tbl_kategori] FOREIGN KEY([id_kategori])
REFERENCES [dbo].[tbl_kategori] ([id_kategori])
GO
ALTER TABLE [dbo].[tbl_buku] CHECK CONSTRAINT [FK_tbl_ buku_tbl_kategori]
GO
/****** Object:  ForeignKey [FK_tbl_peminjaman_tbl_anggota]    Script Date: 07/18/2019 08:02:34 ******/
ALTER TABLE [dbo].[tbl_peminjaman]  WITH CHECK ADD  CONSTRAINT [FK_tbl_peminjaman_tbl_anggota] FOREIGN KEY([id_anggota])
REFERENCES [dbo].[tbl_anggota] ([id_anggota])
GO
ALTER TABLE [dbo].[tbl_peminjaman] CHECK CONSTRAINT [FK_tbl_peminjaman_tbl_anggota]
GO
/****** Object:  ForeignKey [FK_tbl_pengembalian_tbl_anggota]    Script Date: 07/18/2019 08:02:34 ******/
ALTER TABLE [dbo].[tbl_pengembalian]  WITH CHECK ADD  CONSTRAINT [FK_tbl_pengembalian_tbl_anggota] FOREIGN KEY([id_anggota])
REFERENCES [dbo].[tbl_anggota] ([id_anggota])
GO
ALTER TABLE [dbo].[tbl_pengembalian] CHECK CONSTRAINT [FK_tbl_pengembalian_tbl_anggota]
GO
/****** Object:  ForeignKey [FK_tbl_pengembalian_tbl_peminjaman]    Script Date: 07/18/2019 08:02:34 ******/
ALTER TABLE [dbo].[tbl_pengembalian]  WITH CHECK ADD  CONSTRAINT [FK_tbl_pengembalian_tbl_peminjaman] FOREIGN KEY([id_peminjaman])
REFERENCES [dbo].[tbl_peminjaman] ([id_peminjaman])
GO
ALTER TABLE [dbo].[tbl_pengembalian] CHECK CONSTRAINT [FK_tbl_pengembalian_tbl_peminjaman]
GO
/****** Object:  ForeignKey [FK_tbl_det_peminjaman_tbl_ buku]    Script Date: 07/18/2019 08:02:34 ******/
ALTER TABLE [dbo].[tbl_det_peminjaman]  WITH CHECK ADD  CONSTRAINT [FK_tbl_det_peminjaman_tbl_ buku] FOREIGN KEY([id_buku])
REFERENCES [dbo].[tbl_buku] ([id_buku])
GO
ALTER TABLE [dbo].[tbl_det_peminjaman] CHECK CONSTRAINT [FK_tbl_det_peminjaman_tbl_ buku]
GO
/****** Object:  ForeignKey [FK_tbl_det_peminjaman_tbl_peminjaman]    Script Date: 07/18/2019 08:02:34 ******/
ALTER TABLE [dbo].[tbl_det_peminjaman]  WITH CHECK ADD  CONSTRAINT [FK_tbl_det_peminjaman_tbl_peminjaman] FOREIGN KEY([id_peminjaman])
REFERENCES [dbo].[tbl_peminjaman] ([id_peminjaman])
GO
ALTER TABLE [dbo].[tbl_det_peminjaman] CHECK CONSTRAINT [FK_tbl_det_peminjaman_tbl_peminjaman]
GO
