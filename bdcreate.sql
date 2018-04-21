USE [SSUrban]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 21/04/2018 21:21:18 ******/
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
/****** Object:  Table [dbo].[Inmuebles]    Script Date: 21/04/2018 21:21:18 ******/
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
/****** Object:  Table [dbo].[Municipios]    Script Date: 21/04/2018 21:21:18 ******/
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
/****** Object:  Table [dbo].[TipoInmuebles]    Script Date: 21/04/2018 21:21:18 ******/
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
INSERT [dbo].[Clientes] ([Nombre], [Apellidos], [Direccion], [DNI], [Telefono], [Email], [Observaciones]) VALUES (N'Pepe', N'Pérez', N'Calle del Carmen 18 1º', N'46902201A', N'661870147', N'', NULL)
SET IDENTITY_INSERT [dbo].[Inmuebles] ON 

INSERT [dbo].[Inmuebles] ([Id], [Expediente], [Fecha], [Localidad], [Descripcion], [Direccion], [Vendedor_Arrendador], [Comprador_Arrendatario], [TipoInmueble], [EstateCounter]) VALUES (1, N'V1', CAST(N'2018-04-19 21:54:03.613' AS DateTime), N'A Coruña', N'Piso Precioso', N'Calle Los Castros', N'46902201A', NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Inmuebles] OFF
SET IDENTITY_INSERT [dbo].[Municipios] ON 

INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (1, N'A Coruña')
INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (2, N'Oleiros')
INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (3, N'Cambre')
INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (4, N'Culleredo')
INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (5, N'Sada')
INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (6, N'Arteixo')
SET IDENTITY_INSERT [dbo].[Municipios] OFF
INSERT [dbo].[TipoInmuebles] ([Id], [Description], [Counter]) VALUES (1, N'Venta', 1)
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
