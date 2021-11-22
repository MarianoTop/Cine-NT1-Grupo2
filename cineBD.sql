USE [master]
GO
/****** Object:  Database [cineBD]    Script Date: 22/11/2021 15:23:47 ******/
CREATE DATABASE [cineBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cineBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\cineBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'cineBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\cineBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [cineBD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cineBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cineBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cineBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cineBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cineBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cineBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [cineBD] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [cineBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cineBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cineBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cineBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cineBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cineBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cineBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cineBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cineBD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [cineBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cineBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cineBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cineBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cineBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cineBD] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [cineBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cineBD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [cineBD] SET  MULTI_USER 
GO
ALTER DATABASE [cineBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cineBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cineBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cineBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cineBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [cineBD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [cineBD] SET QUERY_STORE = OFF
GO
USE [cineBD]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 22/11/2021 15:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asiento]    Script Date: 22/11/2021 15:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asiento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fila] [nvarchar](1) NOT NULL,
	[Numero] [int] NOT NULL,
	[FuncionId] [int] NOT NULL,
 CONSTRAINT [PK_Asiento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cine]    Script Date: 22/11/2021 15:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cine](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[ClienteActualid] [int] NULL,
 CONSTRAINT [PK_Cine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 22/11/2021 15:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](20) NOT NULL,
	[Apellido] [nvarchar](20) NOT NULL,
	[Mail] [nvarchar](20) NOT NULL,
	[pass] [nvarchar](20) NOT NULL,
	[CineId] [int] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entrada]    Script Date: 22/11/2021 15:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entrada](
	[EntradaId] [int] IDENTITY(1,1) NOT NULL,
	[FuncionId] [int] NULL,
	[AsientoId] [int] NOT NULL,
	[Clienteid] [int] NULL,
 CONSTRAINT [PK_Entrada] PRIMARY KEY CLUSTERED 
(
	[EntradaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funcion]    Script Date: 22/11/2021 15:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPelicula] [int] NOT NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[Sala] [int] NOT NULL,
	[CineId] [int] NULL,
 CONSTRAINT [PK_Funcion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pelicula]    Script Date: 22/11/2021 15:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pelicula](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
	[Calificacion] [int] NOT NULL,
	[Genero] [int] NOT NULL,
 CONSTRAINT [PK_Pelicula] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarjeta]    Script Date: 22/11/2021 15:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarjeta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FechaDeVencimiento] [datetime2](7) NOT NULL,
	[CodigoSeguridad] [int] NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
	[Clienteid] [int] NULL,
	[Numero] [bigint] NOT NULL,
 CONSTRAINT [PK_Tarjeta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211121193045_FKEntradas', N'3.1.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211121214852_cambiosPelicula', N'3.1.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211121224132_CineBd', N'3.1.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211122003727_intentoBD', N'3.1.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211122143259_AgregueNroTarjeta', N'3.1.20')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211122144320_agregueNroTarjeta', N'3.1.20')
GO
SET IDENTITY_INSERT [dbo].[Asiento] ON 

INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (1, N'A', 1, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (2, N'D', 4, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (3, N'D', 3, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (4, N'D', 2, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (5, N'D', 1, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (6, N'C', 6, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (7, N'C', 5, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (8, N'C', 4, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (9, N'C', 3, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (10, N'C', 2, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (11, N'C', 1, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (12, N'B', 6, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (13, N'B', 5, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (14, N'B', 4, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (15, N'B', 3, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (16, N'B', 2, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (17, N'B', 1, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (18, N'A', 6, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (19, N'A', 5, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (20, N'A', 4, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (21, N'A', 3, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (22, N'A', 2, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (23, N'D', 5, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (24, N'D', 6, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (25, N'A', 1, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (26, N'D', 4, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (27, N'D', 3, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (28, N'D', 2, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (29, N'D', 1, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (30, N'C', 6, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (31, N'C', 5, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (32, N'C', 4, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (33, N'C', 3, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (34, N'C', 2, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (35, N'C', 1, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (36, N'B', 6, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (37, N'B', 5, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (38, N'B', 4, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (39, N'B', 3, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (40, N'B', 2, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (41, N'B', 1, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (42, N'A', 6, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (43, N'A', 5, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (44, N'A', 4, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (45, N'A', 3, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (46, N'A', 2, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (47, N'D', 5, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (48, N'D', 6, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (49, N'A', 1, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (50, N'D', 4, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (51, N'D', 3, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (52, N'D', 2, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (53, N'D', 1, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (54, N'C', 6, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (55, N'C', 5, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (56, N'C', 4, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (57, N'C', 3, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (58, N'C', 2, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (59, N'C', 1, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (60, N'B', 6, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (61, N'B', 5, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (62, N'B', 4, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (63, N'B', 3, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (64, N'B', 2, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (65, N'B', 1, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (66, N'A', 6, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (67, N'A', 5, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (68, N'A', 4, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (69, N'A', 3, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (70, N'A', 2, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (71, N'D', 5, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (72, N'D', 6, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (73, N'A', 1, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (74, N'D', 4, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (75, N'D', 3, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (76, N'D', 2, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (77, N'D', 1, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (78, N'C', 6, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (79, N'C', 5, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (80, N'C', 4, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (81, N'C', 3, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (82, N'C', 2, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (83, N'C', 1, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (84, N'B', 6, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (85, N'B', 5, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (86, N'B', 4, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (87, N'B', 3, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (88, N'B', 2, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (89, N'B', 1, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (90, N'A', 6, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (91, N'A', 5, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (92, N'A', 4, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (93, N'A', 3, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (94, N'A', 2, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (95, N'D', 5, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (96, N'D', 6, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (97, N'A', 1, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (98, N'D', 4, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (99, N'D', 3, 5)
GO
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (100, N'D', 2, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (101, N'D', 1, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (102, N'C', 6, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (103, N'C', 5, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (104, N'C', 4, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (105, N'C', 3, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (106, N'C', 2, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (107, N'C', 1, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (108, N'B', 6, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (109, N'B', 5, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (110, N'B', 4, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (111, N'B', 3, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (112, N'B', 2, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (113, N'B', 1, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (114, N'A', 6, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (115, N'A', 5, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (116, N'A', 4, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (117, N'A', 3, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (118, N'A', 2, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (119, N'D', 5, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (120, N'D', 6, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (121, N'A', 1, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (122, N'D', 4, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (123, N'D', 3, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (124, N'D', 2, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (125, N'D', 1, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (126, N'C', 6, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (127, N'C', 5, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (128, N'C', 4, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (129, N'C', 3, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (130, N'C', 2, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (131, N'C', 1, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (132, N'B', 6, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (133, N'B', 5, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (134, N'B', 4, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (135, N'B', 3, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (136, N'B', 2, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (137, N'B', 1, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (138, N'A', 6, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (139, N'A', 5, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (140, N'A', 4, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (141, N'A', 3, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (142, N'A', 2, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (143, N'D', 5, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [FuncionId]) VALUES (144, N'D', 6, 6)
SET IDENTITY_INSERT [dbo].[Asiento] OFF
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([id], [Nombre], [Apellido], [Mail], [pass], [CineId]) VALUES (1, N'Federico ', N'Prado Diessler', N'fede@fede.com', N'12345678', NULL)
INSERT [dbo].[Cliente] ([id], [Nombre], [Apellido], [Mail], [pass], [CineId]) VALUES (2, N'Mariano', N'Toppino', N'mariano@mariano.com', N'12345678', NULL)
INSERT [dbo].[Cliente] ([id], [Nombre], [Apellido], [Mail], [pass], [CineId]) VALUES (3, N'Facundo', N'Safe', N'facu@facu.com', N'abcdefgh', NULL)
INSERT [dbo].[Cliente] ([id], [Nombre], [Apellido], [Mail], [pass], [CineId]) VALUES (4, N'Alberto', N'Diaz', N'alberto@diaz.com', N'abcd1234', NULL)
INSERT [dbo].[Cliente] ([id], [Nombre], [Apellido], [Mail], [pass], [CineId]) VALUES (5, N'Juan Carlos', N'Esposito', N'juan@carlos.com', N'12345678', NULL)
INSERT [dbo].[Cliente] ([id], [Nombre], [Apellido], [Mail], [pass], [CineId]) VALUES (6, N'Ricardo', N'Sanchez', N'rick@sanchez.com', N'aabbccdd', NULL)
INSERT [dbo].[Cliente] ([id], [Nombre], [Apellido], [Mail], [pass], [CineId]) VALUES (7, N'Emmet', N'Brown', N'eldoc@brown.com', N'alfuturo', NULL)
INSERT [dbo].[Cliente] ([id], [Nombre], [Apellido], [Mail], [pass], [CineId]) VALUES (8, N'Adam', N'West', N'bat@man.com', N'elbatman', NULL)
INSERT [dbo].[Cliente] ([id], [Nombre], [Apellido], [Mail], [pass], [CineId]) VALUES (9, N'Angus', N'McGyber', N'unclip@ylisto.com', N'12345678', NULL)
INSERT [dbo].[Cliente] ([id], [Nombre], [Apellido], [Mail], [pass], [CineId]) VALUES (10, N'Marcela', N'Gomez', N'marce@gomez', N'123456678', NULL)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Entrada] ON 

INSERT [dbo].[Entrada] ([EntradaId], [FuncionId], [AsientoId], [Clienteid]) VALUES (1, 1, 1, NULL)
INSERT [dbo].[Entrada] ([EntradaId], [FuncionId], [AsientoId], [Clienteid]) VALUES (2, 2, 45, NULL)
INSERT [dbo].[Entrada] ([EntradaId], [FuncionId], [AsientoId], [Clienteid]) VALUES (4, 5, 111, NULL)
INSERT [dbo].[Entrada] ([EntradaId], [FuncionId], [AsientoId], [Clienteid]) VALUES (5, 3, 58, NULL)
INSERT [dbo].[Entrada] ([EntradaId], [FuncionId], [AsientoId], [Clienteid]) VALUES (6, 6, 136, NULL)
INSERT [dbo].[Entrada] ([EntradaId], [FuncionId], [AsientoId], [Clienteid]) VALUES (7, 5, 103, NULL)
SET IDENTITY_INSERT [dbo].[Entrada] OFF
GO
SET IDENTITY_INSERT [dbo].[Funcion] ON 

INSERT [dbo].[Funcion] ([Id], [IdPelicula], [Fecha], [Sala], [CineId]) VALUES (1, 1, CAST(N'2021-11-22T10:10:00.0000000' AS DateTime2), 1, NULL)
INSERT [dbo].[Funcion] ([Id], [IdPelicula], [Fecha], [Sala], [CineId]) VALUES (2, 1, CAST(N'2021-11-22T20:20:00.0000000' AS DateTime2), 1, NULL)
INSERT [dbo].[Funcion] ([Id], [IdPelicula], [Fecha], [Sala], [CineId]) VALUES (3, 2, CAST(N'2021-11-22T10:10:00.0000000' AS DateTime2), 2, NULL)
INSERT [dbo].[Funcion] ([Id], [IdPelicula], [Fecha], [Sala], [CineId]) VALUES (4, 3, CAST(N'2021-11-22T10:10:00.0000000' AS DateTime2), 3, NULL)
INSERT [dbo].[Funcion] ([Id], [IdPelicula], [Fecha], [Sala], [CineId]) VALUES (5, 3, CAST(N'2021-11-22T20:20:00.0000000' AS DateTime2), 3, NULL)
INSERT [dbo].[Funcion] ([Id], [IdPelicula], [Fecha], [Sala], [CineId]) VALUES (6, 5, CAST(N'2021-11-22T20:20:00.0000000' AS DateTime2), 2, NULL)
SET IDENTITY_INSERT [dbo].[Funcion] OFF
GO
SET IDENTITY_INSERT [dbo].[Pelicula] ON 

INSERT [dbo].[Pelicula] ([Id], [Nombre], [Calificacion], [Genero]) VALUES (1, N'Mad Max', 1, 4)
INSERT [dbo].[Pelicula] ([Id], [Nombre], [Calificacion], [Genero]) VALUES (2, N'Ciudadano Kane', 1, 5)
INSERT [dbo].[Pelicula] ([Id], [Nombre], [Calificacion], [Genero]) VALUES (3, N'La historia sin fin', 0, 2)
INSERT [dbo].[Pelicula] ([Id], [Nombre], [Calificacion], [Genero]) VALUES (4, N'Rapido y Furioso 23', 0, 4)
INSERT [dbo].[Pelicula] ([Id], [Nombre], [Calificacion], [Genero]) VALUES (5, N'El Exorisista', 2, 0)
SET IDENTITY_INSERT [dbo].[Pelicula] OFF
GO
SET IDENTITY_INSERT [dbo].[Tarjeta] ON 

INSERT [dbo].[Tarjeta] ([Id], [FechaDeVencimiento], [CodigoSeguridad], [Nombre], [Clienteid], [Numero]) VALUES (1, CAST(N'2021-11-22T10:10:00.0000000' AS DateTime2), 954, N'FEDERICO PRADO DIESSLER', NULL, 1111222233334444)
SET IDENTITY_INSERT [dbo].[Tarjeta] OFF
GO
/****** Object:  Index [IX_Asiento_FuncionId]    Script Date: 22/11/2021 15:23:47 ******/
CREATE NONCLUSTERED INDEX [IX_Asiento_FuncionId] ON [dbo].[Asiento]
(
	[FuncionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cine_ClienteActualid]    Script Date: 22/11/2021 15:23:47 ******/
CREATE NONCLUSTERED INDEX [IX_Cine_ClienteActualid] ON [dbo].[Cine]
(
	[ClienteActualid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cliente_CineId]    Script Date: 22/11/2021 15:23:47 ******/
CREATE NONCLUSTERED INDEX [IX_Cliente_CineId] ON [dbo].[Cliente]
(
	[CineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Entrada_AsientoId]    Script Date: 22/11/2021 15:23:47 ******/
CREATE NONCLUSTERED INDEX [IX_Entrada_AsientoId] ON [dbo].[Entrada]
(
	[AsientoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Entrada_Clienteid]    Script Date: 22/11/2021 15:23:47 ******/
CREATE NONCLUSTERED INDEX [IX_Entrada_Clienteid] ON [dbo].[Entrada]
(
	[Clienteid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Entrada_FuncionId]    Script Date: 22/11/2021 15:23:47 ******/
CREATE NONCLUSTERED INDEX [IX_Entrada_FuncionId] ON [dbo].[Entrada]
(
	[FuncionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Funcion_CineId]    Script Date: 22/11/2021 15:23:47 ******/
CREATE NONCLUSTERED INDEX [IX_Funcion_CineId] ON [dbo].[Funcion]
(
	[CineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Funcion_IdPelicula]    Script Date: 22/11/2021 15:23:47 ******/
CREATE NONCLUSTERED INDEX [IX_Funcion_IdPelicula] ON [dbo].[Funcion]
(
	[IdPelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tarjeta_Clienteid]    Script Date: 22/11/2021 15:23:47 ******/
CREATE NONCLUSTERED INDEX [IX_Tarjeta_Clienteid] ON [dbo].[Tarjeta]
(
	[Clienteid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asiento]  WITH CHECK ADD  CONSTRAINT [FK_Asiento_Funcion_FuncionId] FOREIGN KEY([FuncionId])
REFERENCES [dbo].[Funcion] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Asiento] CHECK CONSTRAINT [FK_Asiento_Funcion_FuncionId]
GO
ALTER TABLE [dbo].[Cine]  WITH CHECK ADD  CONSTRAINT [FK_Cine_Cliente_ClienteActualid] FOREIGN KEY([ClienteActualid])
REFERENCES [dbo].[Cliente] ([id])
GO
ALTER TABLE [dbo].[Cine] CHECK CONSTRAINT [FK_Cine_Cliente_ClienteActualid]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Cine_CineId] FOREIGN KEY([CineId])
REFERENCES [dbo].[Cine] ([Id])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Cine_CineId]
GO
ALTER TABLE [dbo].[Entrada]  WITH CHECK ADD  CONSTRAINT [FK_Entrada_Asiento_AsientoId] FOREIGN KEY([AsientoId])
REFERENCES [dbo].[Asiento] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Entrada] CHECK CONSTRAINT [FK_Entrada_Asiento_AsientoId]
GO
ALTER TABLE [dbo].[Entrada]  WITH CHECK ADD  CONSTRAINT [FK_Entrada_Cliente_Clienteid] FOREIGN KEY([Clienteid])
REFERENCES [dbo].[Cliente] ([id])
GO
ALTER TABLE [dbo].[Entrada] CHECK CONSTRAINT [FK_Entrada_Cliente_Clienteid]
GO
ALTER TABLE [dbo].[Entrada]  WITH CHECK ADD  CONSTRAINT [FK_Entrada_Funcion_FuncionId] FOREIGN KEY([FuncionId])
REFERENCES [dbo].[Funcion] ([Id])
GO
ALTER TABLE [dbo].[Entrada] CHECK CONSTRAINT [FK_Entrada_Funcion_FuncionId]
GO
ALTER TABLE [dbo].[Funcion]  WITH CHECK ADD  CONSTRAINT [FK_Funcion_Cine_CineId] FOREIGN KEY([CineId])
REFERENCES [dbo].[Cine] ([Id])
GO
ALTER TABLE [dbo].[Funcion] CHECK CONSTRAINT [FK_Funcion_Cine_CineId]
GO
ALTER TABLE [dbo].[Funcion]  WITH CHECK ADD  CONSTRAINT [FK_Funcion_Pelicula_IdPelicula] FOREIGN KEY([IdPelicula])
REFERENCES [dbo].[Pelicula] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Funcion] CHECK CONSTRAINT [FK_Funcion_Pelicula_IdPelicula]
GO
ALTER TABLE [dbo].[Tarjeta]  WITH CHECK ADD  CONSTRAINT [FK_Tarjeta_Cliente_Clienteid] FOREIGN KEY([Clienteid])
REFERENCES [dbo].[Cliente] ([id])
GO
ALTER TABLE [dbo].[Tarjeta] CHECK CONSTRAINT [FK_Tarjeta_Cliente_Clienteid]
GO
USE [master]
GO
ALTER DATABASE [cineBD] SET  READ_WRITE 
GO
