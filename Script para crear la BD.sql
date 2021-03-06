USE [master]
GO
/****** Object:  Database [CineBD]    Script Date: 15/12/2021 23:21:00 ******/
CREATE DATABASE [CineBD]

ALTER DATABASE [CineBD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CineBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CineBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CineBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CineBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CineBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CineBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [CineBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CineBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CineBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CineBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CineBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CineBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CineBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CineBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CineBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CineBD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CineBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CineBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CineBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CineBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CineBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CineBD] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CineBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CineBD] SET RECOVERY FULL 
GO
ALTER DATABASE [CineBD] SET  MULTI_USER 
GO
ALTER DATABASE [CineBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CineBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CineBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CineBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CineBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CineBD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CineBD', N'ON'
GO
ALTER DATABASE [CineBD] SET QUERY_STORE = OFF
GO
USE [CineBD]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 15/12/2021 23:21:01 ******/
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
/****** Object:  Table [dbo].[Asiento]    Script Date: 15/12/2021 23:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asiento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fila] [nvarchar](1) NOT NULL,
	[Numero] [int] NOT NULL,
	[ClienteId] [int] NOT NULL,
	[FuncionId] [int] NOT NULL,
 CONSTRAINT [PK_Asiento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cine]    Script Date: 15/12/2021 23:21:01 ******/
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
/****** Object:  Table [dbo].[Cliente]    Script Date: 15/12/2021 23:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](20) NOT NULL,
	[Apellido] [nvarchar](20) NOT NULL,
	[Mail] [nvarchar](20) NOT NULL,
	[pass] [nvarchar](max) NULL,
	[Rol] [int] NOT NULL,
	[CineId] [int] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entrada]    Script Date: 15/12/2021 23:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entrada](
	[EntradaId] [int] IDENTITY(1,1) NOT NULL,
	[FuncionId] [int] NULL,
	[ClienteId] [int] NOT NULL,
	[AsientoId] [int] NOT NULL,
 CONSTRAINT [PK_Entrada] PRIMARY KEY CLUSTERED 
(
	[EntradaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funcion]    Script Date: 15/12/2021 23:21:01 ******/
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
/****** Object:  Table [dbo].[Pelicula]    Script Date: 15/12/2021 23:21:01 ******/
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
/****** Object:  Table [dbo].[Tarjeta]    Script Date: 15/12/2021 23:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarjeta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Numero] [bigint] NOT NULL,
	[FechaDeVencimiento] [datetime2](7) NOT NULL,
	[CodigoSeguridad] [int] NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
	[ClienteId] [int] NOT NULL,
 CONSTRAINT [PK_Tarjeta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211213234011_CineBD', N'3.1.20')
GO
SET IDENTITY_INSERT [dbo].[Asiento] ON 

INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1, N'A', 1, 0, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (2, N'D', 4, 0, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (3, N'D', 3, 0, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (4, N'D', 2, 0, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (5, N'D', 1, 0, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (6, N'C', 6, 3, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (7, N'C', 5, 0, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (8, N'C', 4, 0, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (9, N'C', 3, 0, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (10, N'C', 2, 0, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (11, N'C', 1, 0, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (12, N'B', 6, 0, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (13, N'B', 5, 0, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (14, N'B', 4, 0, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (15, N'B', 3, 0, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (16, N'B', 2, 0, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (17, N'B', 1, 0, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (18, N'A', 6, 0, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (19, N'A', 5, 0, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (20, N'A', 4, 0, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (21, N'A', 3, 0, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (22, N'A', 2, 0, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (23, N'D', 5, 0, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (24, N'D', 6, 0, 1)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (25, N'A', 1, 1001, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (26, N'D', 4, 0, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (27, N'D', 3, 0, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (28, N'D', 2, 0, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (29, N'D', 1, 0, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (30, N'C', 6, 0, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (31, N'C', 5, 0, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (32, N'C', 4, 0, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (33, N'C', 3, 0, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (34, N'C', 2, 0, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (35, N'C', 1, 0, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (36, N'B', 6, 0, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (37, N'B', 5, 0, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (38, N'B', 4, 0, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (39, N'B', 3, 0, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (40, N'B', 2, 0, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (41, N'B', 1, 0, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (42, N'A', 6, 0, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (43, N'A', 5, 0, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (44, N'A', 4, 1001, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (45, N'A', 3, 0, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (46, N'A', 2, 1001, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (47, N'D', 5, 0, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (48, N'D', 6, 0, 2)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (49, N'A', 1, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (50, N'D', 4, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (51, N'D', 3, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (52, N'D', 2, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (53, N'D', 1, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (54, N'C', 6, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (55, N'C', 5, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (56, N'C', 4, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (57, N'C', 3, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (58, N'C', 2, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (59, N'C', 1, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (60, N'B', 6, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (61, N'B', 5, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (62, N'B', 4, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (63, N'B', 3, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (64, N'B', 2, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (65, N'B', 1, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (66, N'A', 6, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (67, N'A', 5, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (68, N'A', 4, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (69, N'A', 3, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (70, N'A', 2, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (71, N'D', 5, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (72, N'D', 6, 0, 3)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (73, N'A', 1, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (74, N'D', 4, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (75, N'D', 3, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (76, N'D', 2, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (77, N'D', 1, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (78, N'C', 6, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (79, N'C', 5, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (80, N'C', 4, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (81, N'C', 3, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (82, N'C', 2, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (83, N'C', 1, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (84, N'B', 6, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (85, N'B', 5, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (86, N'B', 4, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (87, N'B', 3, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (88, N'B', 2, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (89, N'B', 1, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (90, N'A', 6, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (91, N'A', 5, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (92, N'A', 4, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (93, N'A', 3, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (94, N'A', 2, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (95, N'D', 5, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (96, N'D', 6, 0, 4)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (97, N'A', 1, 0, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (98, N'D', 4, 0, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (99, N'D', 3, 0, 5)
GO
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (100, N'D', 2, 0, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (101, N'D', 1, 0, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (102, N'C', 6, 0, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (103, N'C', 5, 0, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (104, N'C', 4, 0, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (105, N'C', 3, 0, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (106, N'C', 2, 0, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (107, N'C', 1, 0, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (108, N'B', 6, 0, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (109, N'B', 5, 0, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (110, N'B', 4, 0, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (111, N'B', 3, 0, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (112, N'B', 2, 0, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (113, N'B', 1, 0, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (114, N'A', 6, 0, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (115, N'A', 5, 0, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (116, N'A', 4, 0, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (117, N'A', 3, 0, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (118, N'A', 2, 0, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (119, N'D', 5, 0, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (120, N'D', 6, 0, 5)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (121, N'A', 1, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (122, N'D', 4, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (123, N'D', 3, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (124, N'D', 2, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (125, N'D', 1, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (126, N'C', 6, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (127, N'C', 5, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (128, N'C', 4, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (129, N'C', 3, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (130, N'C', 2, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (131, N'C', 1, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (132, N'B', 6, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (133, N'B', 5, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (134, N'B', 4, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (135, N'B', 3, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (136, N'B', 2, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (137, N'B', 1, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (138, N'A', 6, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (139, N'A', 5, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (140, N'A', 4, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (141, N'A', 3, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (142, N'A', 2, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (143, N'D', 5, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (144, N'D', 6, 0, 6)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (145, N'A', 1, 3, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (146, N'D', 4, 0, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (147, N'D', 3, 0, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (148, N'D', 2, 0, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (149, N'D', 1, 0, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (150, N'C', 6, 0, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (151, N'C', 5, 0, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (152, N'C', 4, 0, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (153, N'C', 3, 0, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (154, N'C', 2, 0, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (155, N'C', 1, 0, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (156, N'B', 6, 0, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (157, N'B', 5, 0, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (158, N'B', 4, 0, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (159, N'B', 3, 0, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (160, N'B', 2, 0, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (161, N'B', 1, 0, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (162, N'A', 6, 0, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (163, N'A', 5, 0, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (164, N'A', 4, 0, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (165, N'A', 3, 0, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (166, N'A', 2, 0, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (167, N'D', 5, 0, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (168, N'D', 6, 0, 7)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (169, N'A', 1, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (170, N'D', 4, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (171, N'D', 3, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (172, N'D', 2, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (173, N'D', 1, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (174, N'C', 6, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (175, N'C', 5, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (176, N'C', 4, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (177, N'C', 3, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (178, N'C', 2, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (179, N'C', 1, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (180, N'B', 6, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (181, N'B', 5, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (182, N'B', 4, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (183, N'B', 3, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (184, N'B', 2, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (185, N'B', 1, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (186, N'A', 6, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (187, N'A', 5, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (188, N'A', 4, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (189, N'A', 3, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (190, N'A', 2, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (191, N'D', 5, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (192, N'D', 6, 0, 8)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (193, N'A', 1, 0, 9)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (194, N'D', 4, 0, 9)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (195, N'D', 3, 0, 9)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (196, N'D', 2, 0, 9)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (197, N'D', 1, 4, 9)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (198, N'C', 6, 0, 9)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (199, N'C', 5, 0, 9)
GO
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (200, N'C', 4, 0, 9)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (201, N'C', 3, 0, 9)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (202, N'C', 2, 0, 9)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (203, N'C', 1, 0, 9)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (204, N'B', 6, 0, 9)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (205, N'B', 5, 0, 9)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (206, N'B', 4, 0, 9)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (207, N'B', 3, 0, 9)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (208, N'B', 2, 0, 9)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (209, N'B', 1, 0, 9)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (210, N'A', 6, 0, 9)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (211, N'A', 5, 0, 9)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (212, N'A', 4, 0, 9)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (213, N'A', 3, 0, 9)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (214, N'A', 2, 0, 9)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (215, N'D', 5, 0, 9)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (216, N'D', 6, 0, 9)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (217, N'A', 1, 0, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (218, N'D', 4, 0, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (219, N'D', 3, 0, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (220, N'D', 2, 0, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (221, N'D', 1, 0, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (222, N'C', 6, 0, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (223, N'C', 5, 0, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (224, N'C', 4, 0, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (225, N'C', 3, 0, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (226, N'C', 2, 0, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (227, N'C', 1, 0, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (228, N'B', 6, 0, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (229, N'B', 5, 0, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (230, N'B', 4, 0, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (231, N'B', 3, 0, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (232, N'B', 2, 0, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (233, N'B', 1, 0, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (234, N'A', 6, 0, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (235, N'A', 5, 0, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (236, N'A', 4, 0, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (237, N'A', 3, 0, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (238, N'A', 2, 0, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (239, N'D', 5, 6, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (240, N'D', 6, 0, 10)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1002, N'A', 1, 0, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1003, N'D', 4, 0, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1004, N'D', 3, 0, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1005, N'D', 2, 0, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1006, N'D', 1, 0, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1007, N'C', 6, 0, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1008, N'C', 5, 0, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1009, N'C', 4, 4, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1010, N'C', 3, 0, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1011, N'C', 2, 0, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1012, N'C', 1, 0, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1013, N'B', 6, 0, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1014, N'B', 5, 0, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1015, N'B', 4, 0, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1016, N'B', 3, 0, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1017, N'B', 2, 0, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1018, N'B', 1, 0, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1019, N'A', 6, 0, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1020, N'A', 5, 0, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1021, N'A', 4, 0, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1022, N'A', 3, 0, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1023, N'A', 2, 0, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1024, N'D', 5, 0, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1025, N'D', 6, 0, 1002)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1026, N'A', 1, 0, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1027, N'D', 4, 0, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1028, N'D', 3, 1001, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1029, N'D', 2, 5, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1030, N'D', 1, 0, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1031, N'C', 6, 0, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1032, N'C', 5, 0, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1033, N'C', 4, 0, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1034, N'C', 3, 0, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1035, N'C', 2, 0, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1036, N'C', 1, 0, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1037, N'B', 6, 0, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1038, N'B', 5, 0, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1039, N'B', 4, 0, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1040, N'B', 3, 0, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1041, N'B', 2, 0, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1042, N'B', 1, 0, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1043, N'A', 6, 0, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1044, N'A', 5, 0, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1045, N'A', 4, 0, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1046, N'A', 3, 0, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1047, N'A', 2, 0, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1048, N'D', 5, 0, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1049, N'D', 6, 1001, 1003)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1050, N'A', 1, 0, 1004)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1051, N'D', 4, 0, 1004)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1052, N'D', 3, 0, 1004)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1053, N'D', 2, 0, 1004)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1054, N'D', 1, 0, 1004)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1055, N'C', 6, 0, 1004)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1056, N'C', 5, 0, 1004)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1057, N'C', 4, 0, 1004)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1058, N'C', 3, 0, 1004)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1059, N'C', 2, 6, 1004)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1060, N'C', 1, 0, 1004)
GO
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1061, N'B', 6, 0, 1004)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1062, N'B', 5, 0, 1004)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1063, N'B', 4, 0, 1004)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1064, N'B', 3, 0, 1004)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1065, N'B', 2, 0, 1004)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1066, N'B', 1, 0, 1004)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1067, N'A', 6, 0, 1004)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1068, N'A', 5, 0, 1004)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1069, N'A', 4, 0, 1004)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1070, N'A', 3, 0, 1004)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1071, N'A', 2, 0, 1004)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1072, N'D', 5, 0, 1004)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1073, N'D', 6, 0, 1004)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1074, N'A', 1, 0, 1005)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1075, N'D', 4, 0, 1005)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1076, N'D', 3, 0, 1005)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1077, N'D', 2, 0, 1005)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1078, N'D', 1, 0, 1005)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1079, N'C', 6, 0, 1005)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1080, N'C', 5, 5, 1005)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1081, N'C', 4, 0, 1005)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1082, N'C', 3, 0, 1005)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1083, N'C', 2, 0, 1005)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1084, N'C', 1, 0, 1005)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1085, N'B', 6, 0, 1005)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1086, N'B', 5, 0, 1005)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1087, N'B', 4, 0, 1005)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1088, N'B', 3, 0, 1005)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1089, N'B', 2, 0, 1005)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1090, N'B', 1, 0, 1005)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1091, N'A', 6, 0, 1005)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1092, N'A', 5, 0, 1005)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1093, N'A', 4, 0, 1005)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1094, N'A', 3, 0, 1005)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1095, N'A', 2, 0, 1005)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1096, N'D', 5, 0, 1005)
INSERT [dbo].[Asiento] ([Id], [Fila], [Numero], [ClienteId], [FuncionId]) VALUES (1097, N'D', 6, 0, 1005)
SET IDENTITY_INSERT [dbo].[Asiento] OFF
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([id], [Nombre], [Apellido], [Mail], [pass], [Rol], [CineId]) VALUES (1, N'admin1', N'admin1', N'admin@gmail.com', N'admin@gmail.com', 1, NULL)
INSERT [dbo].[Cliente] ([id], [Nombre], [Apellido], [Mail], [pass], [Rol], [CineId]) VALUES (3, N'Luciana', N'Lapilato', N'luchi@hotmail.com', N'luchi@hotmail.com', 2, NULL)
INSERT [dbo].[Cliente] ([id], [Nombre], [Apellido], [Mail], [pass], [Rol], [CineId]) VALUES (4, N'Pedro', N'Gonzalez', N'pedrito1@gmail.com', N'Pedrito1', 2, NULL)
INSERT [dbo].[Cliente] ([id], [Nombre], [Apellido], [Mail], [pass], [Rol], [CineId]) VALUES (5, N'Sergio', N'Ramirez', N'Sergito@yahoo.com', N'Sergito1', 2, NULL)
INSERT [dbo].[Cliente] ([id], [Nombre], [Apellido], [Mail], [pass], [Rol], [CineId]) VALUES (6, N'Martin', N'Palermo', N'tincho@hotmail.com', N'TinchoPalermo1', 2, NULL)
INSERT [dbo].[Cliente] ([id], [Nombre], [Apellido], [Mail], [pass], [Rol], [CineId]) VALUES (1001, N'Juano', N'Gonzalez', N'Juani@hotmail.com', N'Juani@hotmail.com2', 2, NULL)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Entrada] ON 

INSERT [dbo].[Entrada] ([EntradaId], [FuncionId], [ClienteId], [AsientoId]) VALUES (1, 7, 3, 145)
INSERT [dbo].[Entrada] ([EntradaId], [FuncionId], [ClienteId], [AsientoId]) VALUES (2, 1, 3, 6)
INSERT [dbo].[Entrada] ([EntradaId], [FuncionId], [ClienteId], [AsientoId]) VALUES (3, 1002, 4, 1009)
INSERT [dbo].[Entrada] ([EntradaId], [FuncionId], [ClienteId], [AsientoId]) VALUES (4, 9, 4, 197)
INSERT [dbo].[Entrada] ([EntradaId], [FuncionId], [ClienteId], [AsientoId]) VALUES (5, 1003, 5, 1029)
INSERT [dbo].[Entrada] ([EntradaId], [FuncionId], [ClienteId], [AsientoId]) VALUES (6, 1005, 5, 1080)
INSERT [dbo].[Entrada] ([EntradaId], [FuncionId], [ClienteId], [AsientoId]) VALUES (7, 10, 6, 239)
INSERT [dbo].[Entrada] ([EntradaId], [FuncionId], [ClienteId], [AsientoId]) VALUES (8, 1004, 6, 1059)
INSERT [dbo].[Entrada] ([EntradaId], [FuncionId], [ClienteId], [AsientoId]) VALUES (9, 2, 1001, 25)
INSERT [dbo].[Entrada] ([EntradaId], [FuncionId], [ClienteId], [AsientoId]) VALUES (10, 2, 1001, 44)
INSERT [dbo].[Entrada] ([EntradaId], [FuncionId], [ClienteId], [AsientoId]) VALUES (11, 2, 1001, 46)
INSERT [dbo].[Entrada] ([EntradaId], [FuncionId], [ClienteId], [AsientoId]) VALUES (12, 1003, 1001, 1028)
INSERT [dbo].[Entrada] ([EntradaId], [FuncionId], [ClienteId], [AsientoId]) VALUES (13, 1003, 1001, 1049)
SET IDENTITY_INSERT [dbo].[Entrada] OFF
GO
SET IDENTITY_INSERT [dbo].[Funcion] ON 

INSERT [dbo].[Funcion] ([Id], [IdPelicula], [Fecha], [Sala], [CineId]) VALUES (1, 1, CAST(N'2021-12-22T00:27:00.0000000' AS DateTime2), 1, NULL)
INSERT [dbo].[Funcion] ([Id], [IdPelicula], [Fecha], [Sala], [CineId]) VALUES (2, 1, CAST(N'2021-12-15T00:27:00.0000000' AS DateTime2), 2, NULL)
INSERT [dbo].[Funcion] ([Id], [IdPelicula], [Fecha], [Sala], [CineId]) VALUES (3, 1, CAST(N'2021-12-23T00:27:00.0000000' AS DateTime2), 3, NULL)
INSERT [dbo].[Funcion] ([Id], [IdPelicula], [Fecha], [Sala], [CineId]) VALUES (4, 2, CAST(N'2021-12-23T00:28:00.0000000' AS DateTime2), 1, NULL)
INSERT [dbo].[Funcion] ([Id], [IdPelicula], [Fecha], [Sala], [CineId]) VALUES (5, 2, CAST(N'2021-12-23T00:28:00.0000000' AS DateTime2), 3, NULL)
INSERT [dbo].[Funcion] ([Id], [IdPelicula], [Fecha], [Sala], [CineId]) VALUES (6, 2, CAST(N'2021-12-29T00:28:00.0000000' AS DateTime2), 3, NULL)
INSERT [dbo].[Funcion] ([Id], [IdPelicula], [Fecha], [Sala], [CineId]) VALUES (7, 3, CAST(N'2021-12-30T00:28:00.0000000' AS DateTime2), 1, NULL)
INSERT [dbo].[Funcion] ([Id], [IdPelicula], [Fecha], [Sala], [CineId]) VALUES (8, 3, CAST(N'2021-12-24T00:28:00.0000000' AS DateTime2), 2, NULL)
INSERT [dbo].[Funcion] ([Id], [IdPelicula], [Fecha], [Sala], [CineId]) VALUES (9, 3, CAST(N'2021-12-31T00:28:00.0000000' AS DateTime2), 3, NULL)
INSERT [dbo].[Funcion] ([Id], [IdPelicula], [Fecha], [Sala], [CineId]) VALUES (10, 4, CAST(N'2022-01-04T00:28:00.0000000' AS DateTime2), 1, NULL)
INSERT [dbo].[Funcion] ([Id], [IdPelicula], [Fecha], [Sala], [CineId]) VALUES (1002, 1001, CAST(N'2022-01-04T23:20:00.0000000' AS DateTime2), 2, NULL)
INSERT [dbo].[Funcion] ([Id], [IdPelicula], [Fecha], [Sala], [CineId]) VALUES (1003, 1002, CAST(N'2021-12-29T21:20:00.0000000' AS DateTime2), 3, NULL)
INSERT [dbo].[Funcion] ([Id], [IdPelicula], [Fecha], [Sala], [CineId]) VALUES (1004, 1003, CAST(N'2021-12-19T02:20:00.0000000' AS DateTime2), 3, NULL)
INSERT [dbo].[Funcion] ([Id], [IdPelicula], [Fecha], [Sala], [CineId]) VALUES (1005, 1004, CAST(N'2021-12-23T13:25:00.0000000' AS DateTime2), 1, NULL)
SET IDENTITY_INSERT [dbo].[Funcion] OFF
GO
SET IDENTITY_INSERT [dbo].[Pelicula] ON 

INSERT [dbo].[Pelicula] ([Id], [Nombre], [Calificacion], [Genero]) VALUES (1, N'Rapido Y furioso', 2, 0)
INSERT [dbo].[Pelicula] ([Id], [Nombre], [Calificacion], [Genero]) VALUES (2, N'Caperucita roja', 2, 0)
INSERT [dbo].[Pelicula] ([Id], [Nombre], [Calificacion], [Genero]) VALUES (3, N'Dragon ball', 0, 4)
INSERT [dbo].[Pelicula] ([Id], [Nombre], [Calificacion], [Genero]) VALUES (4, N'Lobo', 0, 0)
INSERT [dbo].[Pelicula] ([Id], [Nombre], [Calificacion], [Genero]) VALUES (1001, N'Alien', 2, 0)
INSERT [dbo].[Pelicula] ([Id], [Nombre], [Calificacion], [Genero]) VALUES (1002, N'The Maze Runner', 0, 4)
INSERT [dbo].[Pelicula] ([Id], [Nombre], [Calificacion], [Genero]) VALUES (1003, N'Avatar 2', 0, 4)
INSERT [dbo].[Pelicula] ([Id], [Nombre], [Calificacion], [Genero]) VALUES (1004, N'SpiderMan: No Way Home', 0, 4)
SET IDENTITY_INSERT [dbo].[Pelicula] OFF
GO
SET IDENTITY_INSERT [dbo].[Tarjeta] ON 

INSERT [dbo].[Tarjeta] ([Id], [Numero], [FechaDeVencimiento], [CodigoSeguridad], [Nombre], [ClienteId]) VALUES (1, 1151511131111111, CAST(N'2021-12-28T23:55:00.0000000' AS DateTime2), 123, N'LUCIANA R', 3)
INSERT [dbo].[Tarjeta] ([Id], [Numero], [FechaDeVencimiento], [CodigoSeguridad], [Nombre], [ClienteId]) VALUES (2, 6665971511154457, CAST(N'2021-12-30T23:59:00.0000000' AS DateTime2), 652, N'PEDRO R', 4)
INSERT [dbo].[Tarjeta] ([Id], [Numero], [FechaDeVencimiento], [CodigoSeguridad], [Nombre], [ClienteId]) VALUES (1002, 1233445546677899, CAST(N'2021-12-30T23:13:00.0000000' AS DateTime2), 684, N'Johny B', 5)
INSERT [dbo].[Tarjeta] ([Id], [Numero], [FechaDeVencimiento], [CodigoSeguridad], [Nombre], [ClienteId]) VALUES (1003, 2565448876676666, CAST(N'2025-07-29T23:15:00.0000000' AS DateTime2), 789, N'Palermo M', 6)
INSERT [dbo].[Tarjeta] ([Id], [Numero], [FechaDeVencimiento], [CodigoSeguridad], [Nombre], [ClienteId]) VALUES (1004, 1231231234445664, CAST(N'2024-12-30T23:16:00.0000000' AS DateTime2), 476, N'Juani Gonzalez', 1001)
SET IDENTITY_INSERT [dbo].[Tarjeta] OFF
GO
/****** Object:  Index [IX_Asiento_FuncionId]    Script Date: 15/12/2021 23:21:01 ******/
CREATE NONCLUSTERED INDEX [IX_Asiento_FuncionId] ON [dbo].[Asiento]
(
	[FuncionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cine_ClienteActualid]    Script Date: 15/12/2021 23:21:01 ******/
CREATE NONCLUSTERED INDEX [IX_Cine_ClienteActualid] ON [dbo].[Cine]
(
	[ClienteActualid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cliente_CineId]    Script Date: 15/12/2021 23:21:01 ******/
CREATE NONCLUSTERED INDEX [IX_Cliente_CineId] ON [dbo].[Cliente]
(
	[CineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Entrada_AsientoId]    Script Date: 15/12/2021 23:21:01 ******/
CREATE NONCLUSTERED INDEX [IX_Entrada_AsientoId] ON [dbo].[Entrada]
(
	[AsientoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Entrada_ClienteId]    Script Date: 15/12/2021 23:21:01 ******/
CREATE NONCLUSTERED INDEX [IX_Entrada_ClienteId] ON [dbo].[Entrada]
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Entrada_FuncionId]    Script Date: 15/12/2021 23:21:01 ******/
CREATE NONCLUSTERED INDEX [IX_Entrada_FuncionId] ON [dbo].[Entrada]
(
	[FuncionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Funcion_CineId]    Script Date: 15/12/2021 23:21:01 ******/
CREATE NONCLUSTERED INDEX [IX_Funcion_CineId] ON [dbo].[Funcion]
(
	[CineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Funcion_IdPelicula]    Script Date: 15/12/2021 23:21:01 ******/
CREATE NONCLUSTERED INDEX [IX_Funcion_IdPelicula] ON [dbo].[Funcion]
(
	[IdPelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tarjeta_ClienteId]    Script Date: 15/12/2021 23:21:01 ******/
CREATE NONCLUSTERED INDEX [IX_Tarjeta_ClienteId] ON [dbo].[Tarjeta]
(
	[ClienteId] ASC
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
ALTER TABLE [dbo].[Entrada]  WITH CHECK ADD  CONSTRAINT [FK_Entrada_Cliente_ClienteId] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Entrada] CHECK CONSTRAINT [FK_Entrada_Cliente_ClienteId]
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
ALTER TABLE [dbo].[Tarjeta]  WITH CHECK ADD  CONSTRAINT [FK_Tarjeta_Cliente_ClienteId] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tarjeta] CHECK CONSTRAINT [FK_Tarjeta_Cliente_ClienteId]
GO
USE [master]
GO
ALTER DATABASE [CineBD] SET  READ_WRITE 
GO
