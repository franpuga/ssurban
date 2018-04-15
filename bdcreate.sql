USE [master]
GO
/****** Object:  Database [SSUrban]    Script Date: 25/03/2018 21:14:43 ******/
CREATE DATABASE [SSUrban]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SSUrban', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SSUrban.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SSUrban_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SSUrban_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SSUrban] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SSUrban].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SSUrban] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SSUrban] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SSUrban] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SSUrban] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SSUrban] SET ARITHABORT OFF 
GO
ALTER DATABASE [SSUrban] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SSUrban] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SSUrban] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SSUrban] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SSUrban] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SSUrban] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SSUrban] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SSUrban] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SSUrban] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SSUrban] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SSUrban] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SSUrban] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SSUrban] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SSUrban] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SSUrban] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SSUrban] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SSUrban] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SSUrban] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SSUrban] SET  MULTI_USER 
GO
ALTER DATABASE [SSUrban] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SSUrban] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SSUrban] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SSUrban] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SSUrban] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SSUrban]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 25/03/2018 21:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Nombre] [nvarchar](200) NULL,
	[Apellidos] [nvarchar](300) NULL,
	[Direccion] [nvarchar](500) NULL,
	[DNI] [nvarchar](10) NOT NULL,
	[Telefono] [nvarchar](50) NULL,
	[Email] [nvarchar](200) NULL,
	[Observaciones] [nvarchar](2500) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inmuebles]    Script Date: 25/03/2018 21:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inmuebles](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Expediente] [nvarchar](10) NOT NULL,
	[Fecha] [datetime] NULL,
	[Localidad] [nvarchar](50) NULL,
	[Descripcion] [nvarchar](250) NULL,
	[Direccion] [nvarchar](500) NULL,
	[Vendedor_Arrendador] [nvarchar](10) NOT NULL,
	[Comprador_Arrendatario] [nvarchar](10) NULL,
	[TipoInmueble] [int] NOT NULL,
	[EstateCounter] [bigint] NOT NULL,
 CONSTRAINT [PK_Inmuebles] PRIMARY KEY CLUSTERED 
(
	[Expediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Municipios]    Script Date: 25/03/2018 21:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Municipios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoInmuebles]    Script Date: 25/03/2018 21:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoInmuebles](
	[Id] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Counter] [bigint] NOT NULL,
 CONSTRAINT [PK_TipoInmuebles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Municipios] ON 

INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (1, N'A Coruña')
INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (2, N'Oleiros')
INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (3, N'Cambre')
INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (4, N'Culleredo')
INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (5, N'Sada')
INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (6, N'Arteixo')
SET IDENTITY_INSERT [dbo].[Municipios] OFF
INSERT [dbo].[TipoInmuebles] ([Id], [Description], [Counter]) VALUES (1, N'Venta', 0)
INSERT [dbo].[TipoInmuebles] ([Id], [Description], [Counter]) VALUES (2, N'Alquiler', 0)
INSERT [dbo].[TipoInmuebles] ([Id], [Description], [Counter]) VALUES (3, N'Alquiler Opción Compra', 0)
ALTER TABLE [dbo].[Inmuebles] ADD  CONSTRAINT [DF_Inmuebles_EstateCounter]  DEFAULT ((0)) FOR [EstateCounter]
GO
ALTER TABLE [dbo].[TipoInmuebles] ADD  CONSTRAINT [DF_TipoInmuebles_Counter]  DEFAULT ((0)) FOR [Counter]
GO
ALTER TABLE [dbo].[Inmuebles]  WITH CHECK ADD  CONSTRAINT [FK_Inmuebles_Clientes_Comprador] FOREIGN KEY([Comprador_Arrendatario])
REFERENCES [dbo].[Clientes] ([DNI])
GO
ALTER TABLE [dbo].[Inmuebles] CHECK CONSTRAINT [FK_Inmuebles_Clientes_Comprador]
GO
ALTER TABLE [dbo].[Inmuebles]  WITH CHECK ADD  CONSTRAINT [FK_Inmuebles_Clientes_Vendedor] FOREIGN KEY([Vendedor_Arrendador])
REFERENCES [dbo].[Clientes] ([DNI])
GO
ALTER TABLE [dbo].[Inmuebles] CHECK CONSTRAINT [FK_Inmuebles_Clientes_Vendedor]
GO
ALTER TABLE [dbo].[Inmuebles]  WITH CHECK ADD  CONSTRAINT [FK_Inmuebles_TipoInmuebles] FOREIGN KEY([TipoInmueble])
REFERENCES [dbo].[TipoInmuebles] ([Id])
GO
ALTER TABLE [dbo].[Inmuebles] CHECK CONSTRAINT [FK_Inmuebles_TipoInmuebles]
GO
USE [master]
GO
ALTER DATABASE [SSUrban] SET  READ_WRITE 
GO
