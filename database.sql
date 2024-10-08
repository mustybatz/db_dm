USE [Restaurante_md]
GO
/****** Object:  Table [dbo].[DIM_ALIMENTO]    Script Date: 29/08/2024 07:44:59 p. m. ******/
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
/****** Object:  Table [dbo].[DIM_CAJERO]    Script Date: 29/08/2024 07:44:59 p. m. ******/
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
/****** Object:  Table [dbo].[DIM_DATE]    Script Date: 29/08/2024 07:44:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM_DATE](
	[Id_fecha] [int] NOT NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_DIM_DATE] PRIMARY KEY CLUSTERED 
(
	[Id_fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM_ORDEN]    Script Date: 29/08/2024 07:44:59 p. m. ******/
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
/****** Object:  Table [dbo].[FACT_ORDEN]    Script Date: 29/08/2024 07:44:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_ORDEN](
	[Id_orden] [int] NOT NULL,
	[Id_alimento] [int] NOT NULL,
	[Id_fecha] [int] NOT NULL,
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
