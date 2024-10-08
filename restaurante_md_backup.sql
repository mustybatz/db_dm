USE [Restaurante_md]
GO
/****** Object:  Table [dbo].[DIM_ALIMENTO]    Script Date: 05/09/2024 07:34:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_ALIMENTO](
	[Id_alimento] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_DIM_ALIMENTO] PRIMARY KEY CLUSTERED 
(
	[Id_alimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_CAJERO]    Script Date: 05/09/2024 07:34:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_CAJERO](
	[Id_cajero] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
 CONSTRAINT [PK_DIM_CAJERO] PRIMARY KEY CLUSTERED 
(
	[Id_cajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_DATE]    Script Date: 05/09/2024 07:34:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_DATE](
	[Id_fecha] [bigint] NOT NULL,
	[fecha] [date] NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
	[Day] [int] NULL,
	[Month_mmm] [varchar](5) NULL,
	[Month_Year] [varchar](7) NULL,
	[Week_day] [varchar](7) NULL,
 CONSTRAINT [PK_DIM_DATE] PRIMARY KEY CLUSTERED 
(
	[Id_fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_ORDEN]    Script Date: 05/09/2024 07:34:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_ORDEN](
	[Id_orden] [int] NOT NULL,
 CONSTRAINT [PK_DIM_ORDEN] PRIMARY KEY CLUSTERED 
(
	[Id_orden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_ORDEN]    Script Date: 05/09/2024 07:34:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_ORDEN](
	[Id_orden] [int] NOT NULL,
	[Id_alimento] [int] NOT NULL,
	[Id_fecha] [bigint] NOT NULL,
	[Id_cajero] [int] NOT NULL,
	[cantidad] [int] NULL,
	[precio_linea] [money] NULL,
 CONSTRAINT [PK_FACT_ORDEN] PRIMARY KEY CLUSTERED 
(
	[Id_orden] ASC,
	[Id_alimento] ASC,
	[Id_fecha] ASC,
	[Id_cajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DIM_ALIMENTO] ([Id_alimento], [nombre]) VALUES (1, N'Famous Star')
INSERT [dbo].[DIM_ALIMENTO] ([Id_alimento], [nombre]) VALUES (2, N'Western Bacon')
INSERT [dbo].[DIM_ALIMENTO] ([Id_alimento], [nombre]) VALUES (3, N'Portobello')
INSERT [dbo].[DIM_ALIMENTO] ([Id_alimento], [nombre]) VALUES (4, N'Refresco')
INSERT [dbo].[DIM_ALIMENTO] ([Id_alimento], [nombre]) VALUES (5, N'Papas')
INSERT [dbo].[DIM_ALIMENTO] ([Id_alimento], [nombre]) VALUES (6, N'Crispy Chicken')
GO
INSERT [dbo].[DIM_CAJERO] ([Id_cajero], [nombre], [apellido]) VALUES (1, N'Juan', N'Alonso')
INSERT [dbo].[DIM_CAJERO] ([Id_cajero], [nombre], [apellido]) VALUES (2, N'Leticia', N'Martinez')
INSERT [dbo].[DIM_CAJERO] ([Id_cajero], [nombre], [apellido]) VALUES (3, N'Lesly', N'Gomez')
GO
INSERT [dbo].[DIM_DATE] ([Id_fecha], [fecha], [Year], [Month], [Day], [Month_mmm], [Month_Year], [Week_day]) VALUES (20221226, CAST(N'2022-12-26' AS Date), 2022, 12, 26, N'Dic', N'Dic-22', N'Lun')
INSERT [dbo].[DIM_DATE] ([Id_fecha], [fecha], [Year], [Month], [Day], [Month_mmm], [Month_Year], [Week_day]) VALUES (20221228, CAST(N'2022-12-28' AS Date), 2022, 12, 28, N'Dic', N'Dic-22', N'Mié')
INSERT [dbo].[DIM_DATE] ([Id_fecha], [fecha], [Year], [Month], [Day], [Month_mmm], [Month_Year], [Week_day]) VALUES (20230103, CAST(N'2023-01-03' AS Date), 2023, 1, 3, N'Ene', N'Ene-23', N'Mar')
INSERT [dbo].[DIM_DATE] ([Id_fecha], [fecha], [Year], [Month], [Day], [Month_mmm], [Month_Year], [Week_day]) VALUES (20230109, CAST(N'2023-01-09' AS Date), 2023, 1, 9, N'Ene', N'Ene-23', N'Lun')
INSERT [dbo].[DIM_DATE] ([Id_fecha], [fecha], [Year], [Month], [Day], [Month_mmm], [Month_Year], [Week_day]) VALUES (20230115, CAST(N'2023-01-15' AS Date), 2023, 1, 15, N'Ene', N'Ene-23', N'Dom')
INSERT [dbo].[DIM_DATE] ([Id_fecha], [fecha], [Year], [Month], [Day], [Month_mmm], [Month_Year], [Week_day]) VALUES (20230125, CAST(N'2023-01-25' AS Date), 2023, 1, 25, N'Ene', N'Ene-23', N'Mié')
INSERT [dbo].[DIM_DATE] ([Id_fecha], [fecha], [Year], [Month], [Day], [Month_mmm], [Month_Year], [Week_day]) VALUES (20230204, CAST(N'2023-02-04' AS Date), 2023, 2, 4, N'Feb', N'Feb-23', N'Sáb')
INSERT [dbo].[DIM_DATE] ([Id_fecha], [fecha], [Year], [Month], [Day], [Month_mmm], [Month_Year], [Week_day]) VALUES (20230218, CAST(N'2023-02-18' AS Date), 2023, 2, 18, N'Feb', N'Feb-23', N'Sáb')
INSERT [dbo].[DIM_DATE] ([Id_fecha], [fecha], [Year], [Month], [Day], [Month_mmm], [Month_Year], [Week_day]) VALUES (20230219, CAST(N'2023-02-19' AS Date), 2023, 2, 19, N'Feb', N'Feb-23', N'Dom')
INSERT [dbo].[DIM_DATE] ([Id_fecha], [fecha], [Year], [Month], [Day], [Month_mmm], [Month_Year], [Week_day]) VALUES (20230227, CAST(N'2023-02-27' AS Date), 2023, 2, 27, N'Feb', N'Feb-23', N'Lun')
INSERT [dbo].[DIM_DATE] ([Id_fecha], [fecha], [Year], [Month], [Day], [Month_mmm], [Month_Year], [Week_day]) VALUES (20230310, CAST(N'2023-03-10' AS Date), 2023, 3, 10, N'Mar', N'Mar-23', N'Vie')
GO
INSERT [dbo].[DIM_ORDEN] ([Id_orden]) VALUES (1)
INSERT [dbo].[DIM_ORDEN] ([Id_orden]) VALUES (2)
INSERT [dbo].[DIM_ORDEN] ([Id_orden]) VALUES (3)
INSERT [dbo].[DIM_ORDEN] ([Id_orden]) VALUES (4)
INSERT [dbo].[DIM_ORDEN] ([Id_orden]) VALUES (5)
INSERT [dbo].[DIM_ORDEN] ([Id_orden]) VALUES (6)
INSERT [dbo].[DIM_ORDEN] ([Id_orden]) VALUES (7)
INSERT [dbo].[DIM_ORDEN] ([Id_orden]) VALUES (8)
INSERT [dbo].[DIM_ORDEN] ([Id_orden]) VALUES (9)
INSERT [dbo].[DIM_ORDEN] ([Id_orden]) VALUES (10)
INSERT [dbo].[DIM_ORDEN] ([Id_orden]) VALUES (11)
GO
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (1, 3, 20221226, 1, 1, 90.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (1, 4, 20221226, 1, 1, 20.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (2, 1, 20221228, 3, 1, 80.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (2, 4, 20221228, 3, 1, 20.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (2, 5, 20221228, 3, 1, 30.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (3, 1, 20230103, 3, 3, 240.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (3, 4, 20230103, 3, 2, 40.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (3, 5, 20230103, 3, 3, 90.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (4, 3, 20230109, 3, 1, 90.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (4, 4, 20230109, 3, 1, 20.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (4, 5, 20230109, 3, 1, 30.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (5, 1, 20230115, 2, 2, 160.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (5, 4, 20230115, 2, 2, 40.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (5, 5, 20230115, 2, 1, 30.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (6, 4, 20230125, 2, 2, 40.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (6, 6, 20230125, 2, 3, 210.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (7, 2, 20230204, 1, 3, 300.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (7, 4, 20230204, 1, 3, 60.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (7, 5, 20230204, 1, 2, 60.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (7, 6, 20230204, 1, 1, 70.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (8, 3, 20230218, 3, 1, 90.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (8, 4, 20230218, 3, 1, 20.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (8, 5, 20230218, 3, 1, 30.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (9, 2, 20230219, 1, 2, 200.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (9, 4, 20230219, 1, 3, 60.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (9, 6, 20230219, 1, 1, 70.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (10, 4, 20230227, 1, 1, 20.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (10, 5, 20230227, 1, 1, 30.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (11, 1, 20230310, 2, 1, 80.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (11, 4, 20230310, 2, 1, 20.0000)
INSERT [dbo].[FACT_ORDEN] ([Id_orden], [Id_alimento], [Id_fecha], [Id_cajero], [cantidad], [precio_linea]) VALUES (11, 5, 20230310, 2, 1, 30.0000)
GO
ALTER TABLE [dbo].[FACT_ORDEN]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ORDEN_DIM_ALIMENTO] FOREIGN KEY([Id_alimento])
REFERENCES [dbo].[DIM_ALIMENTO] ([Id_alimento])
GO
ALTER TABLE [dbo].[FACT_ORDEN] CHECK CONSTRAINT [FK_FACT_ORDEN_DIM_ALIMENTO]
GO
ALTER TABLE [dbo].[FACT_ORDEN]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ORDEN_DIM_CAJERO] FOREIGN KEY([Id_cajero])
REFERENCES [dbo].[DIM_CAJERO] ([Id_cajero])
GO
ALTER TABLE [dbo].[FACT_ORDEN] CHECK CONSTRAINT [FK_FACT_ORDEN_DIM_CAJERO]
GO
ALTER TABLE [dbo].[FACT_ORDEN]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ORDEN_DIM_DATE] FOREIGN KEY([Id_fecha])
REFERENCES [dbo].[DIM_DATE] ([Id_fecha])
GO
ALTER TABLE [dbo].[FACT_ORDEN] CHECK CONSTRAINT [FK_FACT_ORDEN_DIM_DATE]
GO
ALTER TABLE [dbo].[FACT_ORDEN]  WITH CHECK ADD  CONSTRAINT [FK_FACT_ORDEN_DIM_ORDEN] FOREIGN KEY([Id_orden])
REFERENCES [dbo].[DIM_ORDEN] ([Id_orden])
GO
ALTER TABLE [dbo].[FACT_ORDEN] CHECK CONSTRAINT [FK_FACT_ORDEN_DIM_ORDEN]
GO
