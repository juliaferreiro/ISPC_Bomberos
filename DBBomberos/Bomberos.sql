USE [master]
GO
/****** Object:  Database [BomberosDB]    Script Date: 04/07/2023 21:58:04 ******/
CREATE DATABASE [BomberosDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BomberosDB', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BomberosDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BomberosDB_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BomberosDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BomberosDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BomberosDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BomberosDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BomberosDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BomberosDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BomberosDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BomberosDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BomberosDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BomberosDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BomberosDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BomberosDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BomberosDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BomberosDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BomberosDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BomberosDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BomberosDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BomberosDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BomberosDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BomberosDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BomberosDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BomberosDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BomberosDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BomberosDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BomberosDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BomberosDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BomberosDB] SET  MULTI_USER 
GO
ALTER DATABASE [BomberosDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BomberosDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BomberosDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BomberosDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BomberosDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BomberosDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BomberosDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [BomberosDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BomberosDB]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 04/07/2023 21:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[id_Unidad] [int] NOT NULL,
	[nombre_Unidad] [text] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[id_Unidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jerarquias]    Script Date: 04/07/2023 21:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jerarquias](
	[id_Jerarquia] [int] NOT NULL,
	[nombre_Jerarquia] [text] NOT NULL,
 CONSTRAINT [PK_Jerarquias] PRIMARY KEY CLUSTERED 
(
	[id_Jerarquia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permisos_Jerarquia]    Script Date: 04/07/2023 21:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos_Jerarquia](
	[id_Jerarquia] [int] NOT NULL,
	[permisoRegistrar] [bit] NOT NULL,
	[permisoIngresar] [bit] NOT NULL,
	[permisoSiniestro] [bit] NOT NULL,
	[permisoInventario] [bit] NOT NULL,
 CONSTRAINT [PK_Permisos_Jerarquia] PRIMARY KEY CLUSTERED 
(
	[id_Jerarquia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registro]    Script Date: 04/07/2023 21:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registro](
	[id_Registro] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[lugar] [text] NOT NULL,
 CONSTRAINT [PK_Registro] PRIMARY KEY CLUSTERED 
(
	[id_Registro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siniestro]    Script Date: 04/07/2023 21:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siniestro](
	[id_siniestro] [int] NOT NULL,
	[DNI_bombero] [int] NOT NULL,
	[id_registro] [int] NOT NULL,
	[id_Unidad] [int] NOT NULL,
	[ApellidoBombero] [text] NOT NULL,
	[DNI_encargado] [int] NOT NULL,
	[ApellidoEncargado] [text] NOT NULL,
	[descripcion] [text] NOT NULL,
 CONSTRAINT [PK_Siniestro] PRIMARY KEY CLUSTERED 
(
	[id_siniestro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 04/07/2023 21:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[DNI] [int] NOT NULL,
	[Apellido] [text] NOT NULL,
	[Nombre] [text] NOT NULL,
	[id_Jerarquia] [int] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Permisos_Jerarquia]  WITH CHECK ADD  CONSTRAINT [FK_Permisos_Jerarquia_Jerarquias] FOREIGN KEY([id_Jerarquia])
REFERENCES [dbo].[Jerarquias] ([id_Jerarquia])
GO
ALTER TABLE [dbo].[Permisos_Jerarquia] CHECK CONSTRAINT [FK_Permisos_Jerarquia_Jerarquias]
GO
ALTER TABLE [dbo].[Siniestro]  WITH CHECK ADD  CONSTRAINT [FK_Siniestro_Inventario] FOREIGN KEY([id_Unidad])
REFERENCES [dbo].[Inventario] ([id_Unidad])
GO
ALTER TABLE [dbo].[Siniestro] CHECK CONSTRAINT [FK_Siniestro_Inventario]
GO
ALTER TABLE [dbo].[Siniestro]  WITH CHECK ADD  CONSTRAINT [FK_Siniestro_Registro] FOREIGN KEY([id_registro])
REFERENCES [dbo].[Registro] ([id_Registro])
GO
ALTER TABLE [dbo].[Siniestro] CHECK CONSTRAINT [FK_Siniestro_Registro]
GO
ALTER TABLE [dbo].[Siniestro]  WITH CHECK ADD  CONSTRAINT [FK_Siniestro_Usuarios] FOREIGN KEY([DNI_bombero])
REFERENCES [dbo].[Usuarios] ([DNI])
GO
ALTER TABLE [dbo].[Siniestro] CHECK CONSTRAINT [FK_Siniestro_Usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Jerarquias] FOREIGN KEY([id_Jerarquia])
REFERENCES [dbo].[Jerarquias] ([id_Jerarquia])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Jerarquias]
GO
/****** Object:  StoredProcedure [dbo].[Usuarios_Add]    Script Date: 04/07/2023 21:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Usuarios_Add] 
	-- Add the parameters for the stored procedure here
@DNI int,
@Apellido text,
@Nombre text,
@id_Jerarquia int,
@estado bit
AS
BEGIN
INSERT INTO Usuarios(DNI, Apellido, Nombre, id_Jerarquia, estado)
VALUES (@DNI, @Apellido, @Nombre, @id_Jerarquia, @estado)
END
GO
/****** Object:  StoredProcedure [dbo].[Usuarios_All]    Script Date: 04/07/2023 21:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Usuarios_All]
AS
SELECT * FROM Usuarios
ORDER BY DNI ASC 
GO
/****** Object:  StoredProcedure [dbo].[Usuarios_Delete]    Script Date: 04/07/2023 21:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Usuarios_Delete]
@DNI int
AS
DELETE FROM Usuarios 
WHERE DNI = @DNI
GO
/****** Object:  StoredProcedure [dbo].[Usuarios_Update]    Script Date: 04/07/2023 21:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Usuarios_Update]
@DNI int,
@Apellido text,
@Nombre text,
@id_Jerarquia int,
@estado bit
AS
UPDATE Usuarios
SET
Apellido = @Apellido, 
Nombre = @Nombre,
id_Jerarquia = @id_Jerarquia,
estado = @estado
WHERE DNI = @DNI
GO
USE [master]
GO
ALTER DATABASE [BomberosDB] SET  READ_WRITE 
GO
