USE [FacturacionMunicipal]
GO
/****** Object:  UserDefinedTableType [dbo].[APHoyType]    Script Date: 5/8/2020 04:04:56 ******/
CREATE TYPE [dbo].[APHoyType] AS TABLE(
	[sec] [int] IDENTITY(1,1) NOT NULL,
	[NumFinca] [int] NULL,
	[Plazo] [int] NULL,
	[Fecha] [date] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[CambioValorPropiedadType]    Script Date: 5/8/2020 04:04:56 ******/
CREATE TYPE [dbo].[CambioValorPropiedadType] AS TABLE(
	[sec] [int] IDENTITY(1,1) NOT NULL,
	[NumFinca] [int] NULL,
	[NuevoValor] [money] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[MovConsumoType]    Script Date: 5/8/2020 04:04:56 ******/
CREATE TYPE [dbo].[MovConsumoType] AS TABLE(
	[sec] [int] IDENTITY(1,1) NOT NULL,
	[NumFinca] [int] NULL,
	[M3] [int] NULL,
	[TipoMov] [int] NULL,
	[Descripcion] [varchar](100) NULL,
	[Fecha] [date] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[PagosHoyType]    Script Date: 5/8/2020 04:04:56 ******/
CREATE TYPE [dbo].[PagosHoyType] AS TABLE(
	[sec] [int] IDENTITY(1,1) NOT NULL,
	[NumFinca] [int] NULL,
	[TipoRecibo] [int] NULL,
	[Fecha] [date] NULL
)
GO
/****** Object:  Table [dbo].[ArregloPago]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArregloPago](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[IdComprobante] [int] NOT NULL,
	[MontoOriginal] [money] NOT NULL,
	[Saldo] [money] NOT NULL,
	[TasaInteresAnual] [decimal](5, 2) NOT NULL,
	[PlazoResta] [int] NOT NULL,
	[Cuota] [money] NOT NULL,
	[InsertedAt] [date] NOT NULL,
	[UpdateAt] [date] NOT NULL,
 CONSTRAINT [PK_ArregloPago] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BitacoraCambios]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BitacoraCambios](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdEntityType] [int] NOT NULL,
	[EntityId] [int] NOT NULL,
	[jsonAntes] [varchar](500) NULL,
	[jsonDespues] [varchar](500) NULL,
	[insertedAt] [datetime] NULL,
	[insertedBy] [varchar](20) NULL,
	[insertedIn] [varchar](20) NULL,
 CONSTRAINT [PK_BitacoraCambios_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCobro]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CCobro](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[TasaInteresMoratorio] [real] NOT NULL,
	[DiaEmisionRecibo] [tinyint] NOT NULL,
	[QDiasVencimiento] [tinyint] NOT NULL,
	[EsImpuesto] [varchar](10) NULL,
	[EsRecurrente] [varchar](10) NULL,
	[EsFijo] [varchar](10) NULL,
	[TipoCC] [varchar](30) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Concepto Cobro] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCobro_ConsumoAgua]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CCobro_ConsumoAgua](
	[ID] [int] NOT NULL,
	[ConsumoM3] [int] NOT NULL,
	[MontoMinimoRecibo] [int] NOT NULL,
 CONSTRAINT [PK_CC Consumo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCobro_InteresMoratorio]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CCobro_InteresMoratorio](
	[ID] [int] NOT NULL,
	[Valor_Porcentual] [float] NOT NULL,
 CONSTRAINT [PK_CC Porcentaje] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCobro_MontoFijo]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CCobro_MontoFijo](
	[ID] [int] NOT NULL,
	[MontoFijo] [money] NOT NULL,
 CONSTRAINT [PK_CC Fijo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCobro_PNP]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CCobro_PNP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdCCobbro] [int] NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[FechaInic] [date] NOT NULL,
	[FechaFin] [date] NULL,
 CONSTRAINT [PK_CCobro_PNP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComprobantePago]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComprobantePago](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FechaPago] [datetime] NOT NULL,
	[MontoTotal] [money] NOT NULL,
	[MedioPago] [varchar](25) NULL,
 CONSTRAINT [PK_ComprobantePago] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Corte]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Corte](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[IdReciboReconexion] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Corte] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntityType]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntityType](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EntityType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdRecibosPorPagar]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdRecibosPorPagar](
	[sec] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoAP]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoAP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdArregloPago] [int] NOT NULL,
	[IdTipoMovAP] [int] NOT NULL,
	[Monto] [money] NOT NULL,
	[InteresesDelMes] [decimal](10, 2) NOT NULL,
	[PlazoResta] [int] NOT NULL,
	[NuevoSaldo] [money] NOT NULL,
	[Fecha] [date] NOT NULL,
	[InsertedAt] [date] NOT NULL,
 CONSTRAINT [PK_MovimientoAP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoConsumo]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoConsumo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[IdTipoMovimiento] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[MontoM3] [money] NOT NULL,
	[LecturaConsumo] [int] NULL,
	[NuevoM3Consumo] [int] NOT NULL,
	[FechaMov] [datetime] NOT NULL,
 CONSTRAINT [PK_MovimientoConsumo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prop_Prop]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prop_Prop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[IdPropietario] [int] NOT NULL,
	[EstaBorrado] [bit] NOT NULL,
 CONSTRAINT [PK_Prop_Prop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propiedad]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propiedad](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NumFinca] [int] NOT NULL,
	[Valor] [money] NOT NULL,
	[Direccion] [varchar](150) NOT NULL,
	[M3Acumulados] [int] NOT NULL,
	[M3AcumuladosUltimoRecibo] [int] NOT NULL,
	[FechaIngreso] [datetime] NOT NULL,
	[EstaBorrado] [bit] NOT NULL,
 CONSTRAINT [PK_Propiedad] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propietario]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Propietario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoDocumento] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[ValorDocumento] [varchar](30) NOT NULL,
	[FechaIngreso] [datetime] NOT NULL,
	[EstaBorrado] [bit] NOT NULL,
 CONSTRAINT [PK_Propietario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropietarioJuridico]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropietarioJuridico](
	[ID] [int] NOT NULL,
	[NombrePersonaResponsable] [varchar](100) NOT NULL,
	[IdTipoDocumento] [int] NOT NULL,
	[ValorDocumento] [varchar](30) NOT NULL,
	[EstaBorrado] [bit] NOT NULL,
 CONSTRAINT [PK_PropietarioJuridico] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recibo]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recibo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[IdCCobro] [int] NOT NULL,
	[Monto] [money] NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaEmision] [datetime] NOT NULL,
	[FechaMaximaPago] [datetime] NOT NULL,
 CONSTRAINT [PK_Recibo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recibo_AP]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recibo_AP](
	[ID] [int] NOT NULL,
	[IdMovimientoAP] [int] NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Recibo_AP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReciboPagado]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReciboPagado](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdRecibo] [int] NOT NULL,
	[IdComprobante] [int] NOT NULL,
 CONSTRAINT [PK_ReciboPagado] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReciboReconexion]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReciboReconexion](
	[ID] [int] NOT NULL,
 CONSTRAINT [PK_ReciboReconexion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reconexion]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reconexion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[IdReciboReconexion] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Reconexion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocumentoId]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumentoId](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoDocumentoId] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovAP]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovAP](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TipoMovAP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimiento](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TipoMovimiento] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipos]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipos](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Tipos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[TipoUsuario] [varchar](50) NOT NULL,
	[FechaIngreso] [datetime] NOT NULL,
	[EstaBorrado] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_Prop]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_Prop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[EstaBorrado] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario_Prop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ValoresConfiguracion]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ValoresConfiguracion](
	[ID] [int] NOT NULL,
	[IdTipos] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Valor] [varchar](50) NOT NULL,
	[InsertAt] [datetime] NOT NULL,
	[UpdateAt] [datetime] NOT NULL,
 CONSTRAINT [PK_ValoresConfiguracion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ArregloPago]  WITH CHECK ADD  CONSTRAINT [FK_ArregloPago_ComprobantePago] FOREIGN KEY([IdComprobante])
REFERENCES [dbo].[ComprobantePago] ([ID])
GO
ALTER TABLE [dbo].[ArregloPago] CHECK CONSTRAINT [FK_ArregloPago_ComprobantePago]
GO
ALTER TABLE [dbo].[ArregloPago]  WITH CHECK ADD  CONSTRAINT [FK_ArregloPago_Propiedad] FOREIGN KEY([IdPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[ArregloPago] CHECK CONSTRAINT [FK_ArregloPago_Propiedad]
GO
ALTER TABLE [dbo].[BitacoraCambios]  WITH CHECK ADD  CONSTRAINT [FK_BitacoraCambios_EntityType] FOREIGN KEY([IdEntityType])
REFERENCES [dbo].[EntityType] ([ID])
GO
ALTER TABLE [dbo].[BitacoraCambios] CHECK CONSTRAINT [FK_BitacoraCambios_EntityType]
GO
ALTER TABLE [dbo].[CCobro_ConsumoAgua]  WITH CHECK ADD  CONSTRAINT [FK_CC Consumo_Concepto Cobro] FOREIGN KEY([ID])
REFERENCES [dbo].[CCobro] ([ID])
GO
ALTER TABLE [dbo].[CCobro_ConsumoAgua] CHECK CONSTRAINT [FK_CC Consumo_Concepto Cobro]
GO
ALTER TABLE [dbo].[CCobro_InteresMoratorio]  WITH CHECK ADD  CONSTRAINT [FK_CC Porcentaje_Concepto Cobro] FOREIGN KEY([ID])
REFERENCES [dbo].[CCobro] ([ID])
GO
ALTER TABLE [dbo].[CCobro_InteresMoratorio] CHECK CONSTRAINT [FK_CC Porcentaje_Concepto Cobro]
GO
ALTER TABLE [dbo].[CCobro_MontoFijo]  WITH CHECK ADD  CONSTRAINT [FK_CC Fijo_Concepto Cobro] FOREIGN KEY([ID])
REFERENCES [dbo].[CCobro] ([ID])
GO
ALTER TABLE [dbo].[CCobro_MontoFijo] CHECK CONSTRAINT [FK_CC Fijo_Concepto Cobro]
GO
ALTER TABLE [dbo].[CCobro_PNP]  WITH CHECK ADD  CONSTRAINT [FK_CCobro_PNP_CCobro] FOREIGN KEY([IdCCobbro])
REFERENCES [dbo].[CCobro] ([ID])
GO
ALTER TABLE [dbo].[CCobro_PNP] CHECK CONSTRAINT [FK_CCobro_PNP_CCobro]
GO
ALTER TABLE [dbo].[CCobro_PNP]  WITH CHECK ADD  CONSTRAINT [FK_CCobro_PNP_Propiedad] FOREIGN KEY([IdPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[CCobro_PNP] CHECK CONSTRAINT [FK_CCobro_PNP_Propiedad]
GO
ALTER TABLE [dbo].[Corte]  WITH CHECK ADD  CONSTRAINT [FK_Corte_Propiedad] FOREIGN KEY([IdPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[Corte] CHECK CONSTRAINT [FK_Corte_Propiedad]
GO
ALTER TABLE [dbo].[Corte]  WITH CHECK ADD  CONSTRAINT [FK_Corte_ReciboReconexion] FOREIGN KEY([IdReciboReconexion])
REFERENCES [dbo].[ReciboReconexion] ([ID])
GO
ALTER TABLE [dbo].[Corte] CHECK CONSTRAINT [FK_Corte_ReciboReconexion]
GO
ALTER TABLE [dbo].[MovimientoAP]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoAP_ArregloPago] FOREIGN KEY([IdArregloPago])
REFERENCES [dbo].[ArregloPago] ([ID])
GO
ALTER TABLE [dbo].[MovimientoAP] CHECK CONSTRAINT [FK_MovimientoAP_ArregloPago]
GO
ALTER TABLE [dbo].[MovimientoAP]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoAP_TipoMovAP] FOREIGN KEY([IdTipoMovAP])
REFERENCES [dbo].[TipoMovAP] ([ID])
GO
ALTER TABLE [dbo].[MovimientoAP] CHECK CONSTRAINT [FK_MovimientoAP_TipoMovAP]
GO
ALTER TABLE [dbo].[MovimientoConsumo]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoConsumo_Propiedad] FOREIGN KEY([IdPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[MovimientoConsumo] CHECK CONSTRAINT [FK_MovimientoConsumo_Propiedad]
GO
ALTER TABLE [dbo].[MovimientoConsumo]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoConsumo_TipoMovimiento] FOREIGN KEY([IdTipoMovimiento])
REFERENCES [dbo].[TipoMovimiento] ([ID])
GO
ALTER TABLE [dbo].[MovimientoConsumo] CHECK CONSTRAINT [FK_MovimientoConsumo_TipoMovimiento]
GO
ALTER TABLE [dbo].[Prop_Prop]  WITH CHECK ADD  CONSTRAINT [FK_Prop_Prop_Propiedad] FOREIGN KEY([IdPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[Prop_Prop] CHECK CONSTRAINT [FK_Prop_Prop_Propiedad]
GO
ALTER TABLE [dbo].[Prop_Prop]  WITH CHECK ADD  CONSTRAINT [FK_Prop_Prop_Propietario] FOREIGN KEY([IdPropietario])
REFERENCES [dbo].[Propietario] ([ID])
GO
ALTER TABLE [dbo].[Prop_Prop] CHECK CONSTRAINT [FK_Prop_Prop_Propietario]
GO
ALTER TABLE [dbo].[Propietario]  WITH CHECK ADD  CONSTRAINT [FK_Propietario_TipoDocumentoId] FOREIGN KEY([IdTipoDocumento])
REFERENCES [dbo].[TipoDocumentoId] ([ID])
GO
ALTER TABLE [dbo].[Propietario] CHECK CONSTRAINT [FK_Propietario_TipoDocumentoId]
GO
ALTER TABLE [dbo].[PropietarioJuridico]  WITH CHECK ADD  CONSTRAINT [FK_PropietarioJuridico_Propietario] FOREIGN KEY([ID])
REFERENCES [dbo].[Propietario] ([ID])
GO
ALTER TABLE [dbo].[PropietarioJuridico] CHECK CONSTRAINT [FK_PropietarioJuridico_Propietario]
GO
ALTER TABLE [dbo].[PropietarioJuridico]  WITH CHECK ADD  CONSTRAINT [FK_PropietarioJuridico_TipoDocumentoId] FOREIGN KEY([IdTipoDocumento])
REFERENCES [dbo].[TipoDocumentoId] ([ID])
GO
ALTER TABLE [dbo].[PropietarioJuridico] CHECK CONSTRAINT [FK_PropietarioJuridico_TipoDocumentoId]
GO
ALTER TABLE [dbo].[Recibo]  WITH CHECK ADD  CONSTRAINT [FK_Recibo_CCobro] FOREIGN KEY([IdCCobro])
REFERENCES [dbo].[CCobro] ([ID])
GO
ALTER TABLE [dbo].[Recibo] CHECK CONSTRAINT [FK_Recibo_CCobro]
GO
ALTER TABLE [dbo].[Recibo]  WITH CHECK ADD  CONSTRAINT [FK_Recibo_Propiedad] FOREIGN KEY([IdPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[Recibo] CHECK CONSTRAINT [FK_Recibo_Propiedad]
GO
ALTER TABLE [dbo].[Recibo_AP]  WITH CHECK ADD  CONSTRAINT [FK_Recibo_AP_MovimientoAP] FOREIGN KEY([IdMovimientoAP])
REFERENCES [dbo].[MovimientoAP] ([ID])
GO
ALTER TABLE [dbo].[Recibo_AP] CHECK CONSTRAINT [FK_Recibo_AP_MovimientoAP]
GO
ALTER TABLE [dbo].[Recibo_AP]  WITH CHECK ADD  CONSTRAINT [FK_Recibo_AP_Recibo] FOREIGN KEY([ID])
REFERENCES [dbo].[Recibo] ([ID])
GO
ALTER TABLE [dbo].[Recibo_AP] CHECK CONSTRAINT [FK_Recibo_AP_Recibo]
GO
ALTER TABLE [dbo].[ReciboPagado]  WITH CHECK ADD  CONSTRAINT [FK_ReciboPagado_ComprobantePago] FOREIGN KEY([IdComprobante])
REFERENCES [dbo].[ComprobantePago] ([ID])
GO
ALTER TABLE [dbo].[ReciboPagado] CHECK CONSTRAINT [FK_ReciboPagado_ComprobantePago]
GO
ALTER TABLE [dbo].[ReciboPagado]  WITH CHECK ADD  CONSTRAINT [FK_ReciboPagado_Recibo] FOREIGN KEY([IdRecibo])
REFERENCES [dbo].[Recibo] ([ID])
GO
ALTER TABLE [dbo].[ReciboPagado] CHECK CONSTRAINT [FK_ReciboPagado_Recibo]
GO
ALTER TABLE [dbo].[ReciboReconexion]  WITH CHECK ADD  CONSTRAINT [FK_ReciboReconexion_Recibo] FOREIGN KEY([ID])
REFERENCES [dbo].[Recibo] ([ID])
GO
ALTER TABLE [dbo].[ReciboReconexion] CHECK CONSTRAINT [FK_ReciboReconexion_Recibo]
GO
ALTER TABLE [dbo].[Reconexion]  WITH CHECK ADD  CONSTRAINT [FK_Reconexion_Propiedad] FOREIGN KEY([IdPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[Reconexion] CHECK CONSTRAINT [FK_Reconexion_Propiedad]
GO
ALTER TABLE [dbo].[Reconexion]  WITH CHECK ADD  CONSTRAINT [FK_Reconexion_ReciboReconexion] FOREIGN KEY([IdReciboReconexion])
REFERENCES [dbo].[ReciboReconexion] ([ID])
GO
ALTER TABLE [dbo].[Reconexion] CHECK CONSTRAINT [FK_Reconexion_ReciboReconexion]
GO
ALTER TABLE [dbo].[Usuario_Prop]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Prop_Propiedad] FOREIGN KEY([IdPropiedad])
REFERENCES [dbo].[Propiedad] ([ID])
GO
ALTER TABLE [dbo].[Usuario_Prop] CHECK CONSTRAINT [FK_Usuario_Prop_Propiedad]
GO
ALTER TABLE [dbo].[Usuario_Prop]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Prop_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([ID])
GO
ALTER TABLE [dbo].[Usuario_Prop] CHECK CONSTRAINT [FK_Usuario_Prop_Usuario]
GO
ALTER TABLE [dbo].[ValoresConfiguracion]  WITH CHECK ADD  CONSTRAINT [FK_ValoresConfiguracion_Tipos] FOREIGN KEY([IdTipos])
REFERENCES [dbo].[Tipos] ([ID])
GO
ALTER TABLE [dbo].[ValoresConfiguracion] CHECK CONSTRAINT [FK_ValoresConfiguracion_Tipos]
GO
/****** Object:  StoredProcedure [dbo].[IniciarSimulacion]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[IniciarSimulacion]
AS
BEGIN
	EXEC ReiniciarTablas
	EXEC spCargarConfiguracion
	EXEC spCargarDatos
	EXEC spCargarDatosAdmin
	EXEC spCargarDatosCC
	EXEC Simulacion
END
GO
/****** Object:  StoredProcedure [dbo].[ReiniciarTablas]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[ReiniciarTablas]
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [FacturacionMunicipal].[dbo].[IdRecibosPorPagar]

	DELETE FROM [FacturacionMunicipal].[dbo].[Recibo_AP]

	DELETE FROM [FacturacionMunicipal].[dbo].[MovimientoAP]
		DBCC CHECKIDENT ('[MovimientoAP]', RESEED, 0) --para los identity

	DELETE FROM [FacturacionMunicipal].[dbo].[ArregloPago]
		DBCC CHECKIDENT ('[ArregloPago]', RESEED, 0) --para los identity

	DELETE FROM [FacturacionMunicipal].[dbo].[Reconexion]
		DBCC CHECKIDENT ('[Reconexion]', RESEED, 0) --para los identity

	DELETE FROM [FacturacionMunicipal].[dbo].[Corte]
		DBCC CHECKIDENT ('[Corte]', RESEED, 0) --para los identity

	DELETE FROM [FacturacionMunicipal].[dbo].[ReciboReconexion]

	DELETE FROM [FacturacionMunicipal].[dbo].[ReciboPagado]
		DBCC CHECKIDENT ('[ReciboPagado]', RESEED, 0) --para los identity

	DELETE FROM [FacturacionMunicipal].[dbo].[Recibo]
		DBCC CHECKIDENT ('[Recibo]', RESEED, 0) --para los identity

	DELETE FROM [FacturacionMunicipal].[dbo].[CCobro_MontoFijo]

	DELETE FROM [FacturacionMunicipal].[dbo].[CCobro_ConsumoAgua]

	DELETE FROM [FacturacionMunicipal].[dbo].[CCobro_InteresMoratorio]

	DELETE FROM [FacturacionMunicipal].[dbo].[CCobro_PNP]

	DELETE FROM [FacturacionMunicipal].[dbo].[CCobro]

	DELETE FROM [FacturacionMunicipal].[dbo].[MovimientoConsumo]
		DBCC CHECKIDENT ('[MovimientoConsumo]', RESEED, 0) --para los identity

	DELETE FROM [FacturacionMunicipal].[dbo].[Usuario_Prop]
		DBCC CHECKIDENT ('Usuario_Prop', RESEED, 0) --para los identity

	DELETE FROM [FacturacionMunicipal].[dbo].[Prop_Prop]

	DELETE FROM [FacturacionMunicipal].[dbo].[Propiedad]
		DBCC CHECKIDENT ('Propiedad', RESEED, 0) --para los identity
	
	DELETE FROM [FacturacionMunicipal].[dbo].[PropietarioJuridico]

	DELETE FROM [FacturacionMunicipal].[dbo].[Propietario]
		DBCC CHECKIDENT ('Propietario', RESEED, 0) --para los identity

	DELETE FROM [FacturacionMunicipal].[dbo].[Usuario]
		DBCC CHECKIDENT ('Usuario', RESEED, 0) --para los identity

	DELETE FROM [FacturacionMunicipal].[dbo].[BitacoraCambios]
		DBCC CHECKIDENT ('BitacoraCambios', RESEED, 0) --para los identity

	DELETE FROM [FacturacionMunicipal].[dbo].[ComprobantePago]		
		DBCC CHECKIDENT ('[ComprobantePago]', RESEED, 0) --para los identity
	
	DELETE FROM [FacturacionMunicipal].[dbo].[EntityType]

	DELETE FROM [FacturacionMunicipal].[dbo].[TipoMovimiento]

	DELETE FROM [FacturacionMunicipal].[dbo].[TipoDocumentoId]

	DELETE FROM [FacturacionMunicipal].[dbo].[ValoresConfiguracion]

	DELETE FROM [FacturacionMunicipal].[dbo].[Tipos]

END
GO
/****** Object:  StoredProcedure [dbo].[Simulacion]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [dbo].[Simulacion]
AS

BEGIN
	SET NOCOUNT ON 

	Declare @Propiedades table
	(
		sec int identity(1,1) primary key,
		NumFinca int,
		Valor money,
		Direccion varchar(150),
		EstaBorrado bit
	);

	Declare @Propietarios table 
	(
	   sec int identity(1,1) primary key, 
	   TipoDocId int, 
	   Nombre varchar(100),
	   ValorDocId varchar(100),
	   EstaBorrado bit
	);

	Declare @PropJuridico table
	(
		sec int identity(1,1) primary key,
		DocIdPersonaJuridica varchar(100),
		NombrePersonaResponsable varchar(100),
		IdTipoDocumento int,
		ValorDocumento varchar(100),
		EstaBorrado bit
	);

	Declare @PropiedadVsPropietario table
	(
		sec int identity(1,1) primary key, 
		IdPropiedad varchar(100),
		IdPropietario varchar(100),
		EstaBorrado bit
	);

	Declare @PropiedadesxCCobro table
	(
		sec int identity(1,1) primary key,
		IdCCobro int,
		IdPropiedad int, 
		FechaInic date,
		FechaFin date
	);
	
	Declare @Usuarios table
	(
		sec int identity(1,1) primary key,
		Nombre varchar(100),
		Password varchar(100),
		TipoUsuario varchar(100),
		FechaIngreso date,
		EstaBorrado bit
	);

	Declare @UsuarioVersusPropiedad table
	(
		sec int identity(1,1) primary key,
		IdPropiedad varchar(100),
		IdUsuario varchar(100),
		EstaBorrado bit
	);

	--Tabla para almacenar los cambios en un dia

	Declare @PropiedadCambio CambioValorPropiedadType;

	--Tabla variable para almacenar los pagos dia por dia
	Declare @PagosHoy PagosHoyType;

	--Tabla variable para almacenar los ap dia por dia
	Declare @APHoy APHoyType;

	--Tabla para los movimientos de consumo de agua
	Declare @MovConsumo MovConsumoType;

	--Fecha para las simulaciones
	Declare @FechaOperacion date;

	-- se extraen fechas operación
	Declare @FechasAProcesar table 
	(
	   sec int identity(1,1) primary key, 
	   fecha date
	);

	-- Variables para leer xml
	DECLARE @DocumentoXML xml 

	BEGIN TRY
		SELECT @DocumentoXML = DXML
		FROM OPENROWSET (Bulk 'D:\Base de datos\FacturacionMunicipal_BD\Base de Datos\XML\Operaciones.xml', Single_BLOB) AS DocumentoXML(DXML)
		insert @FechasAProcesar (fecha)
		select f.value('@fecha', 'DATE')
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia') AS t(f);
	END TRY
	BEGIN CATCH
		PRINT 'Hubo un error de cargar fechas'
		RETURN @@ERROR * -1;
	END CATCH


	--parte 3 
	
	-- variables que almacenan valor constante para controlar emision masiva de recibos

	--Declare @IdCCobro_ConsumoAgua=1, @IdCCobro_PatenteCantina=7   -- Son ids con valores solo de ejemplo

	-- Variables para controlar la iteraci�n
	DECLARE @Lo1 int, 
			@Hi1 int, 
			@Lo2 int, 
			@Hi2 int;

	DECLARE @minfecha datetime, 
			@maxfecha datetime;

	DECLARE @fechaOperacionNodo date;

	-- iterando de la fecha más antigua a la menos antigua
	SELECT @minfecha=min(F.fecha), @maxfecha=max(F.fecha)  -- min y max son funciones agregadas
	FROM @FechasAProcesar F;

	SELECT @Lo1=F.sec
	FROM @FechasAProcesar F
	WHERE F.Fecha=@minfecha;

	SELECT @Hi1=F.sec
	FROM @FechasAProcesar F
	WHERE F.Fecha=@maxfecha;

	--parte4
	--iteramos por fecha
	WHILE @Lo1<=@Hi1
	BEGIN
		Select @FechaOperacion=F.Fecha 
		from @FechasAProcesar F 
		where sec=@Lo1;
		
		--DECLARE @fechaOperacionNodo date
		SET @fechaOperacionNodo = @DocumentoXML.value('(/Operaciones_por_Dia/OperacionDia/@fecha)[1]', 'DATE');

		--delete @Propiedades -- ELIMINAR

		--procesar nodos propiedades MASIVO

		INSERT INTO Propiedad (NumFinca, Valor, Direccion, M3Acumulados, M3AcumuladosUltimoRecibo, FechaIngreso, EstaBorrado)
		select pd.value('@NumFinca', 'INT')
		, pd.value('@Valor', 'MONEY')
		, pd.value('@Direccion', 'VARCHAR(150)')
		, 0 AS M3Acumulados
		, 0 AS M3AcumuladosUltimoRecibo
		, @FechaOperacion AS FechaIngreso
		, 0 AS EstaBorrado
		FROM @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia[@fecha eq sql:variable("@FechaOperacion")]/Propiedad') AS t(pd);
		

		-- procesar nodos propietario
		INSERT INTO Propietario (IdTipoDocumento, Nombre, ValorDocumento, FechaIngreso, EstaBorrado)
		select pt.value('@TipoDocIdentidad','INT')
		, pt.value('@Nombre', 'VARCHAR(100)')
		, pt.value('@identificacion', 'VARCHAR(100)')
		, @FechaOperacion AS FechaIngreso
		, 0 AS EstaBorrado
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia[@fecha eq sql:variable("@FechaOperacion")]/Propietario') AS t(pt);
		
		--Propietarios Juridicos 
		-- procesar nodos propietarios juridicos ITERATIVO -- considerar hacerlos masivos
		delete @PropJuridico 
		insert @PropJuridico(DocIdPersonaJuridica, NombrePersonaResponsable, IdTipoDocumento, ValorDocumento, EstaBorrado)
		select pd.value('@docidPersonaJuridica', 'VARCHAR(100)')
		, pd.value('@Nombre', 'VARCHAR(100)')
		, pd.value('@TipDocIdRepresentante', 'INT')
		, pd.value('@DocidRepresentante', 'VARCHAR(100)')
		, 0 AS EstaBorrado
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia[@fecha eq sql:variable("@FechaOperacion")]/PersonaJuridica') AS t(pd);

		--iteramos en propietarios juridico
		Select @Lo2=min(sec), @Hi2=max(sec)
		from @PropJuridico
		while @Lo2<=@Hi2
		Begin
		   insert dbo.PropietarioJuridico(ID, NombrePersonaResponsable, IdTipoDocumento, ValorDocumento, EstaBorrado)
		   Select Pt.ID, Pj.NombrePersonaResponsable, Pj.IdTipoDocumento, Pj.ValorDocumento, Pj.EstaBorrado
		   from @PropJuridico Pj, dbo.Propietario Pt
		   where sec=@Lo2 and Pj.DocIdPersonaJuridica = Pt.ValorDocumento
		   Set @Lo2=@Lo2+1
		end;

		--Propietarios x Propiedades
		-- procesar nodos PropietarioxPropiedad
		delete @PropiedadVsPropietario
		insert @PropiedadVsPropietario (IdPropiedad, IdPropietario, EstaBorrado)
		select pp.value('@NumFinca', 'VARCHAR(100)')
		, pp.value('@identificacion', 'VARCHAR(100)')
		, 0 AS EstaBorrado
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia[@fecha eq sql:variable("@FechaOperacion")]/PropiedadVersusPropietario') AS t(pp);
		
		--iteramos en PropiedadVsPropietario
		Select @Lo2=min(sec), @Hi2=max(sec)
		from @PropiedadVsPropietario
		while @Lo2<=@Hi2
		Begin
		   insert dbo.Prop_Prop(IdPropiedad, IdPropietario, EstaBorrado)
		   Select Pd.ID, Pt.ID, Pp.EstaBorrado
		   from @PropiedadVsPropietario Pp, dbo.Propietario Pt, dbo.Propiedad Pd
		   where sec=@Lo2 and Pp.IdPropietario = Pt.ValorDocumento and Pp.IdPropiedad = Pd.NumFinca
		   Set @Lo2=@Lo2+1
		end;
	 
		--insertamos Usuarios insert MASIVO
		--delete @Usuarios
		INSERT INTO Usuario (Nombre, Password, TipoUsuario, FechaIngreso, EstaBorrado)-- rultimo atributo 
		select u.value('@Nombre','VARCHAR(100)')
		, u.value('@password', 'VARCHAR(100)')
		, 'Normal' AS TipoUsuario
		, @FechaOperacion AS FechaIngreso
		, 0 AS EstaBorrado
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia[@fecha eq sql:variable("@FechaOperacion")]/Usuario') AS t(u);
		
		--CCobros x Propiedad
		--procesar nodos CCobroVsPropiedad
		delete @PropiedadesxCCobro 
		insert @PropiedadesxCCobro (IdCCobro, IdPropiedad, FechaInic)
		select pc.value('@idcobro','INT') 
		, pc.value('@NumFinca', 'INT') 
		, @FechaOperacion AS FechaInic
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia[@fecha eq sql:variable("@FechaOperacion")]/ConceptoCobroVersusPropiedad') AS t(pc);

		-- iteramos en PropiedadesxCCobro 
		Select @Lo2=min(sec), @Hi2=max(sec)
		from @PropiedadesxCCobro 
		while @Lo2<=@Hi2
		Begin
		   insert dbo.CCobro_PNP(IdCCobbro, IdPropiedad, FechaInic)
		   Select PC.IdCCobro, Pd.ID, PC.FechaInic 
		   from @PropiedadesxCCobro PC, dbo.Propiedad Pd
		   where sec=@Lo2 and PC.IdPropiedad = Pd.NumFinca
		   Set @Lo2=@Lo2+1
		end;
		
		--Usuarios Versus Propiedad
		--procesamos nodos UsuarioVersusPropiedad
		delete @UsuarioVersusPropiedad
		insert @UsuarioVersusPropiedad (IdPropiedad, IdUsuario, EstaBorrado)
		select up.value('@NumFinca', 'VARCHAR(100)')
		, up.value('@nombreUsuario', 'VARCHAR(100)')
		, 0 as EstaBorrado
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia[@fecha eq sql:variable("@FechaOperacion")]/UsuarioVersusPropiedad') AS t(up);
		
		-- iteramos en @UsuarioVersusPropiedad 
		Select @Lo2=min(sec), @Hi2=max(sec)
		from @UsuarioVersusPropiedad 
		while @Lo2<=@Hi2
		Begin
		   insert dbo.Usuario_Prop(IdPropiedad, IdUsuario, EstaBorrado)
		   Select Pd.ID, U.ID, Up.EstaBorrado
		   from @UsuarioVersusPropiedad Up, dbo.Usuario U, dbo.Propiedad Pd
		   where sec=@Lo2 and Up.IdUsuario = U.Nombre and Up.IdPropiedad = Pd.NumFinca
		   Set @Lo2=@Lo2+1
		end;

		--procesar los cambios en las propiedades por dia
		DELETE @PropiedadCambio
		INSERT INTO @PropiedadCambio (NumFinca, NuevoValor)
		select pc.value('@NumFinca', 'INT')
			, pc.value('@NuevoValor', 'MONEY')
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia[@fecha eq sql:variable("@FechaOperacion")]/CambioPropiedad') AS t(pc)
		EXEC spProcesaCambioValorPropiedad @PropiedadCambio;

		--PAGO DE LOS RECIBOS  
		DELETE @PagosHoy
		INSERT INTO @PagosHoy(NumFinca,TipoRecibo,Fecha)
		SELECT c.value('@NumFinca', 'INT')
			, c.value('@TipoRecibo', 'INT')
			, @FechaOperacion AS FechaOperacion
		FROM @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia[@fecha eq sql:variable("@FechaOperacion")]/Pago') AS t(c)
		EXEC spProcesaPagos @PagosHoy;

		
		-- CREACION DE AP
		DELETE @APHoy
		INSERT INTO @APHoy(NumFinca,Plazo,Fecha)
		SELECT c.value('@NumFinca', 'INT')
			, c.value('@Plazo', 'INT')
			, @FechaOperacion AS FechaOperacion
		FROM @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia[@fecha eq sql:variable("@FechaOperacion")]/AP') AS t(c)
		
		
		-- SE PUEDE MEJORAR HACIENDO UN SP PARA ESTE
		DECLARE @minid int, 
				@maxid int;

		SELECT	@minid = MIN(sec), @maxid = MAX(sec) 
		FROM @APHoy;

		WHILE @minid <= @maxid
		BEGIN
			DECLARE @pidP int, @pmontoO money, @pplazo int, @pcuota money, @pfecha date, @ptasaA decimal, @montoMoratorio money, @tasaMoratoria FLOAT
			SELECT @pidP = P.ID, @pplazo = A.Plazo, @pfecha = A.Fecha --Obtener ID de Propiedad, Plazo y Fecha
			FROM Propiedad AS P
			INNER JOIN @APHoy AS A ON A.NumFinca = P.NumFinca
			WHERE @minid = A.sec

			--Creación de Recibos Moratorios
			INSERT INTO Recibo(IdCCobro,Monto,Estado,IdPropiedad,FechaEmision,FechaMaximaPago) 
			SELECT 11, R.Monto*CC.TasaInteresMoratorio/365*ABS(DATEDIFF(DAY, R.FechaMaximaPago, @FechaOperacion)), 
			0, @pidP, @FechaOperacion, DATEADD(DAY,CC.QDiasVencimiento,@fechaOperacion)
			FROM CCobro AS CC
			INNER JOIN Recibo AS R ON R.IdCCobro = CC.ID
			WHERE Estado = 0 and IdPropiedad = 8 and R.FechaMaximaPago<@fechaOperacion;

			SELECT @pmontoO = SUM(Monto) 
			FROM Recibo 
			WHERE IdPropiedad = @pidP AND Estado = 0;

			SELECT @ptasaA = CAST (Valor AS decimal) 
			FROM ValoresConfiguracion 
			WHERE ID = 1;

			SELECT @pcuota = @pmontoO * (POWER(1 + @ptasaA/100, @pplazo)) / (POWER(1 + @ptasaA/100, @pplazo) - 1)/10;
			
			--REVISAR
			EXEC spCreateAP @IdP = @pidP, @MontoO = @pmontoO, @Plazo = @pplazo, @Cuota = @pcuota, @Fecha = @pfecha, @TasaA = @ptasaA
			SET @minid += 1;
		END;
		

		--procesa los movimientos en los consumos de las propiedades
		DELETE @MovConsumo
		INSERT INTO @MovConsumo(NumFinca, M3, TipoMov, Descripcion,Fecha)
		SELECT	mc.value('@NumFinca', 'INT')
			,	mc.value('@LecturaM3', 'INT')
			,	mc.value('@id', 'INT')
			,	mc.value('@descripcion', 'VARCHAR(50)')
			,	@FechaOperacion AS FechaOperacion
		FROM @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia[@fecha eq sql:variable("@FechaOperacion")]/TransConsumo') AS t(mc)
		EXEC spProcesaConsumo @MovConsumo;
		
		--Realiza las cortas de agua
		EXEC spCortaAgua @FechaActual = @FechaOperacion;
	
		--Reliza las reconexiones de agua
		EXEC spReconexionAgua @FechaActual = @FechaOperacion;

		--Genera los recibos
		EXEC spProcesaRecibos @FechaActual = @FechaOperacion;

		--Genera los recibos AP
		EXEC spGeneraReciboAP @FechaActual = @FechaOperacion;

		SET @Lo1 = @Lo1 + 1;
		
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spBorradoLogPropiedad]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create     PROCEDURE [dbo].[spBorradoLogPropiedad]
(
	@ID int
)
AS 
BEGIN 
	UPDATE dbo.Propiedad
	SET EstaBorrado=1
	WHERE ID = @ID
END 
GO
/****** Object:  StoredProcedure [dbo].[spBorradoLogPropiedad_Propietario]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create     PROCEDURE [dbo].[spBorradoLogPropiedad_Propietario]
	@ID int
AS 
BEGIN 
	UPDATE dbo.Prop_Prop
	SET EstaBorrado=1
	WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spBorradoLogPropiedad_Usuario]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SP para eliminar las propiedades de Usuarios 

Create     PROCEDURE [dbo].[spBorradoLogPropiedad_Usuario]
	@ID int
AS 
BEGIN 
	UPDATE dbo.Usuario_Prop
	SET EstaBorrado=1
	WHERE ID = @ID
END 
GO
/****** Object:  StoredProcedure [dbo].[spBorradoLogPropietario]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[spBorradoLogPropietario]
(
	@ID int,
	@UsuarioACargo varchar(20), 
	@IPusuario varchar(20)
)
AS 
BEGIN 
	BEGIN TRY
	declare @jsonAntes varchar(500), @insertedAt DATETIME
	SET @insertedAt = GETDATE()
	-- Se crea el primer JSON
	SET @jsonAntes = (SELECT [ID], [Nombre], [IdTipoDocumento], [ValorDocumento], [FechaIngreso]
	FROM [dbo].[Propietario] WHERE [ID] = @id
	FOR JSON PATH)
	UPDATE dbo.Propietario
	SET EstaBorrado=1
	WHERE ID = @ID
	EXEC [dbo].spInsertarBitacoraCambios @inIdEntityType = 2,
										@inEntityID = @ID, 
										@inJsonAntes = @jsonAntes,
										@inJsonDespues = NULL, 
										@inInsertedBy = @UsuarioACargo, 
										@inInsertedIn = @IPusuario, 
										@inInsertedAt = @insertedAt
	END TRY
	BEGIN CATCH
		If @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW 50001, 'Error, no se pudo borrar', 1
	END CATCH
END 
GO
/****** Object:  StoredProcedure [dbo].[spBorradoLogPropietario_Jud]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[spBorradoLogPropietario_Jud]
@ID int,
@UsuarioACargo VARCHAR(20),
@IPusuario VARCHAR(20)
AS 
BEGIN
	If @id is NULL
	BEGIN
		Return -1
	END
	BEGIN TRY
	declare @jsonAntes varchar(500), @insertedAt DATETIME
	SET @insertedAt = GETDATE() 
	-- Se crea el primer JSON
	SET @jsonAntes = (SELECT  FechaIngreso, '' as Responsable, PJ.ID AS IDResable, NombrePersonaResponsable, PJ.IdTipoDocumento as TipoDocumentoR, PJ.ValorDocumento  as ValorDocumento,  
											'' as Propietario,  P.ID AS IDPropietario, Nombre, P.IdTipoDocumento as TipoDocumentoP, P.ValorDocumento as ValorDocumentoP
	FROM [dbo].[PropietarioJuridico] AS PJ
	INNER JOIN Propietario AS P ON P.ID = PJ.ID
	WHERE PJ.ID = @id
	FOR JSON PATH)
	UPDATE dbo.PropietarioJuridico
	SET EstaBorrado=1
	WHERE ID = @ID
	EXEC [dbo].spInsertarBitacoraCambios @inIdEntityType = 6,
				   						 @inEntityID = @id, 
										 @inJsonAntes = @jsonAntes,
										 @inJsonDespues = NULL, 
										 @inInsertedBy = @UsuarioACargo, 
										 @inInsertedIn = @IPusuario, 
										 @inInsertedAt = @insertedAt
	END TRY
	BEGIN CATCH
		If @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW 50003, 'Error no se pudo borrar Propietario Juridico', 1
	END CATCH
END 

GO
/****** Object:  StoredProcedure [dbo].[spBorradoLogPropietario_Propiedad]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create     PROCEDURE [dbo].[spBorradoLogPropietario_Propiedad]
	@ID int
AS 
BEGIN 
	UPDATE dbo.Prop_Prop
	SET EstaBorrado=1
	WHERE ID = @ID
END 

GO
/****** Object:  StoredProcedure [dbo].[spBorradoLogUsuario]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spBorradoLogUsuario]
(
	@ID int,
	@UsuarioACargo varchar(20), 
	@IPusuario varchar(20)
)
AS 
BEGIN 
	BEGIN TRY
	declare @jsonAntes varchar(500), @insertedAt DATETIME
	SET @insertedAt = GETDATE()
	-- Se crea el primer JSON
	SET @jsonAntes = (SELECT [ID], [Nombre], [Password], [FechaIngreso]
	FROM [dbo].[Usuario] WHERE [ID] = @id
	FOR JSON PATH)
	UPDATE dbo.Usuario
	SET EstaBorrado=1
	WHERE ID = @ID
    EXEC [dbo].spInsertarBitacoraCambios @inIdEntityType = 3,
										@inEntityID = @ID, 
										@inJsonAntes = @jsonAntes,
										@inJsonDespues = NULL, 
										@inInsertedBy = @UsuarioACargo, 
										@inInsertedIn = @IPusuario, 
										@inInsertedAt = @insertedAt
	 END TRY
	 BEGIN CATCH
		If @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW 50001, 'Error, no se pudo borrar', 1
	 END CATCH
END 
GO
/****** Object:  StoredProcedure [dbo].[spBorradoLogUsuario_Propiedad]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create     PROCEDURE [dbo].[spBorradoLogUsuario_Propiedad]
	@ID int
AS 
BEGIN 
	UPDATE dbo.Usuario_Prop
	SET EstaBorrado=1
	WHERE ID = @ID 
END 

GO
/****** Object:  StoredProcedure [dbo].[spCancelarPagosUsuario]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spCancelarPagosUsuario]
AS 
BEGIN 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
		--ANULA LOS RECIBOS MORATORIOS QUE ESTABAN EN LA TABLA
		UPDATE [dbo].[Recibo]
		SET estado = 2
		FROM [dbo].[Recibo] R
		INNER JOIN IdRecibosPorPagar RP ON R.id = RP.sec
		WHERE R.IdCCobro = 11 AND R.estado = 3;
		--ELIMINA LA TABLA YA QUE NO LA NECESITO MAS HACER BORRADO LÓGICO
		delete dbo.[IdRecibosPorPagar]
END
GO
/****** Object:  StoredProcedure [dbo].[spCargarConfiguracion]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[spCargarConfiguracion] 
AS 
BEGIN
	
	BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON
			BEGIN TRAN
				INSERT INTO Tipos (ID, Nombre)
				VALUES(1, 'varchar')
				INSERT INTO Tipos (ID, Nombre)
				VALUES(2, 'integer')
				INSERT INTO Tipos (ID, Nombre)
				VALUES(3, 'date')
				INSERT INTO Tipos (ID, Nombre)
				VALUES(4, 'money')
				INSERT INTO Tipos (ID, Nombre)
				VALUES(5, 'decimal')

				INSERT INTO ValoresConfiguracion(ID, IdTipos, Nombre, Valor, InsertAt, UpdateAt)
				VALUES(1, 5, 'TasaInteres AP', '10', '2017-10-01 12:05', '2017-10-01 12:05')
				INSERT INTO ValoresConfiguracion(ID, IdTipos, Nombre, Valor, InsertAt, UpdateAt)
				VALUES(2, 1, 'Nombre Gerente Firma Contratos', 'Pedro Perez Rojas', '2017-10-01 12:05', '2017-10-01 12:05')
				INSERT INTO ValoresConfiguracion(ID, IdTipos, Nombre, Valor, InsertAt, UpdateAt)
				VALUES(3, 1, 'Ruta para salvado de documentos', 'C:\documentos\contratos', '2017-10-01 12:05', '2017-10-01 12:05')
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 50004,'Error: No se ha podido cargar configuracion',1;
		END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[spCargarDatos]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create     PROCEDURE [dbo].[spCargarDatos]

AS
BEGIN
	SET NOCOUNT ON;

	-- VARIABLES --
	DECLARE @TipoDocumento xml, @TipoEntidad xml, @TipoConsumo xml
	
	BEGIN TRY
		--Insercion de los tipos de documentos de identificacion
		SELECT @TipoDocumento = TD
		FROM OPENROWSET (Bulk 'D:\Base de datos\FacturacionMunicipal_BD\Base de Datos\XML\TipoDocumentoIdentidad.xml', Single_BLOB) AS TipoDocumento(TD)

		INSERT INTO dbo.TipoDocumentoId(ID, Nombre)
		SELECT td.value('@codigoDoc', 'VARCHAR(10)')
		, td.value('@descripcion', 'VARCHAR(100)')
		FROM @TipoDocumento.nodes('/TipoDocIdentidad/TipoDocId') AS t(td)

		--Insercion de los tipos de entidad
		SELECT @TipoEntidad = TE
		FROM OPENROWSET (Bulk 'D:\Base de datos\FacturacionMunicipal_BD\Base de Datos\XML\EntityType.xml', Single_BLOB) AS TipoEntidad(TE)
		INSERT INTO dbo.EntityType(ID, Nombre)
		SELECT te.value('@id', 'INT')
		, te.value('@Nombre', 'VARCHAR(100)')
		FROM @TipoEntidad.nodes('/TipoEntidades/Entidad') AS t(te)

		--Insercion de los tipos de consumo
		SELECT @TipoConsumo = TC
		FROM OPENROWSET (Bulk 'D:\Base de datos\FacturacionMunicipal_BD\Base de Datos\XML\TipoTransConsumo.xml', Single_BLOB) AS TipoConsumo(TC)
		INSERT INTO dbo.TipoMovimiento(ID, Nombre)
		SELECT tc.value('@id', 'INT')
		, tc.value('@Nombre', 'VARCHAR(100)')
		FROM @TipoConsumo.nodes('/TipoTransConsumo/TransConsumo') AS t(tc)

	END TRY

	BEGIN CATCH
		return @@ERROR * -1
	END CATCH

END

--Exec ReiniciarTablas

--Exec spCargarDatos
GO
/****** Object:  StoredProcedure [dbo].[spCargarDatosAdmin]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[spCargarDatosAdmin]

AS
BEGIN
    SET NOCOUNT ON;

    -- VARIABLES --
    DECLARE @Usuario XML
	
    BEGIN TRY
        --Insercion de los tipos de documentos de identificacion
        SELECT @Usuario = U
        FROM OPENROWSET (Bulk 'D:\Base de datos\FacturacionMunicipal_BD\Base de Datos\XML\Administradores.xml', Single_BLOB) AS Usuario(U)
		INSERT INTO [dbo].[Usuario] ([Nombre],[Password],[TipoUsuario],[FechaIngreso], EstaBorrado)
        SELECT u.value('@user','VARCHAR(100)') AS Nombre
            , u.value('@password','VARCHAR(100)') AS Password
            , 'Administrador' AS TipoUsuario
			, CONVERT(DATE,GETDATE()) AS FechaIngreso
            , 0 AS EstaBorrado
        FROM @Usuario.nodes('/Administrador/UsuarioAdmi') AS t(u);

		RETURN 1

    END TRY

    BEGIN CATCH
        return @@ERROR * -1
    END CATCH
 END

exec spCargarDatosAdmin

exec ReiniciarTablas
GO
/****** Object:  StoredProcedure [dbo].[spCargarDatosCC]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[spCargarDatosCC]
AS
BEGIN
    SET NOCOUNT ON;                                                                                                                                                                                                                                                                                             

    -- VARIABLES --
    DECLARE @CCobro XML

    BEGIN TRY
		declare @jsonDespues varchar(500), @insertedAt DATETIME, @max INT, @min INT, @IP VARCHAR(20)
		SET @insertedAt = GETDATE() 
        --Insercion de los tipos de CCobro
        SELECT @CCobro = CC
        FROM OPENROWSET (Bulk 'D:\Base de datos\FacturacionMunicipal_BD\Base de Datos\XML\Concepto_de_Cobro.xml', Single_BLOB) AS CCobro(CC)

        INSERT INTO dbo.CCobro (ID, Nombre, TasaInteresMoratorio, DiaEmisionRecibo, QDiasVencimiento, EsImpuesto, EsRecurrente, EsFijo, TipoCC, Activo)
        SELECT c.value('@id','INT') AS ID
            , c.value('@Nombre','VARCHAR(100)') AS Nombre
            , c.value('@TasaInteresMoratoria','REAL') AS TasaInteresMoratorio
            , c.value('@DiaCobro','TINYINT') AS DiaEmisionRecibo
            , c.value('@QDiasVencimiento','TINYINT') AS QDiasVencimiento
            , c.value('@EsImpuesto','VARCHAR(10)') AS EsImpuesto
            , c.value('@EsRecurrente','VARCHAR(10)') AS EsRecurrente
            , c.value('@EsFijo','VARCHAR(10)') AS EsFijo  
            , c.value('@TipoCC','VARCHAR(10)') AS TipoCC
            , 1 AS Activo
        FROM @CCobro.nodes('/Conceptos_de_Cobro/conceptocobro') AS t(c); 		

		WITH cm AS
		(
			SELECT c.value('@id','INT') AS ID
				, c.value('@Monto','MONEY') AS MontoFijo
			FROM @CCobro.nodes('/Conceptos_de_Cobro/conceptocobro') AS t(c)
		)
		INSERT INTO CCobro_MontoFijo (ID, MontoFijo)
		SELECT ID, MontoFijo FROM cm
		WHERE cm.MontoFijo > 0;

		WITH ci AS
		(
			SELECT cci.value('@id','INT') AS ID
				, cci.value('@ValorPorcentaje','REAL') AS InteresMoratorio
			FROM @CCobro.nodes('/Conceptos_de_Cobro/conceptocobro') AS t(cci)
		)
		INSERT INTO CCobro_InteresMoratorio(ID, Valor_Porcentual)
		SELECT ID, InteresMoratorio FROM ci
		WHERE ci.InteresMoratorio > 0;

		WITH ca AS
		(
			SELECT cca.value('@id','INT') AS ID
				, cca.value('@ValorM3','INT') AS ConsumoM3
				, cca.value('@MontoMinRecibo', 'INT') AS MontoMinimoRecibo
			FROM @CCobro.nodes('/Conceptos_de_Cobro/conceptocobro') AS t(cca)
		)
		INSERT INTO CCobro_ConsumoAgua(ID, ConsumoM3, MontoMinimoRecibo)
		SELECT ID, ConsumoM3, MontoMinimoRecibo FROM ca
		WHERE ca.ConsumoM3 > 0;

		-- BITACORA
		SELECT @max= MAX(ID), @min=MIN(id) FROM CCobro
		while (@min<=@max)
		Begin
			SET @insertedAt = GETDATE()
			SET @ip =(select (convert (varchar(48), ConnectionProperty('client_net_address'))) as [Style 1, sql_variant to varchar]
			from sys.dm_exec_connections
			WHERE Session_id = @@SPID)
			SET @jsonDespues = (SELECT  ID, Nombre, TasaInteresMoratorio, DiaEmisionRecibo, QDiasVencimiento, EsImpuesto,  EsRecurrente, EsFijo, TipoCC
			FROM CCobro WHERE ID=@min
			FOR JSON PATH)
			EXEC [dbo].spInsertarBitacoraCambios @inIdEntityType = 7,
				   						 @inEntityID = @min, 
										 @inJsonAntes = Null,
										 @inJsonDespues = @jsonDespues, 
										 @inInsertedBy = @IP, 
										 @inInsertedIn = @IP, 
										 @inInsertedAt = @insertedAt
			SET @min=@min+1
		end
		return 1

    END TRY

    BEGIN CATCH
        return @@ERROR * -1
    END CATCH
 END

exec spCargarDatosCC
GO
/****** Object:  StoredProcedure [dbo].[spConfirmarPagosUsuario]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spConfirmarPagosUsuario]
AS 
BEGIN 
	BEGIN TRY 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
		DECLARE @montoComprobante MONEY
		--GUARDA EL MONTO TOTAL
		SET @montoComprobante = (	SELECT SUM(Monto) 
									FROM [dbo].[Recibo] R 
									INNER JOIN dbo.[IdRecibosPorPagar] RP ON R.ID = RP.sec
								);
				
		BEGIN TRAN
			--CREA UN COMPROBANTE DE PAGO
			INSERT INTO [dbo].[ComprobantePago](FechaPago, MontoTotal) --Verificar Medio de Pago
			SELECT GETDATE(), @montoComprobante;
				
			--INSERTA LOS RECIBOS EN RECIBOS PAGADOS
			INSERT INTO [dbo].[ReciboPagado](IdRecibo,IdComprobante)
			SELECT RP.sec, IDENT_CURRENT('[dbo].[ComprobantePago]')
			FROM dbo.[IdRecibosPorPagar] RP;

			--ACTUALIZA EL ESTADO A PAGADOS
			UPDATE [dbo].[Recibo]
			SET Estado = 1 --Se pagó
			FROM [dbo].[Recibo] R
			INNER JOIN [dbo].[IdRecibosPorPagar] RP ON R.id = RP.sec;
				
				
			--ELIMINA LA TABLA YA QUE SE PAGARON LOS RECIBOS LOGICO --HACER BORRADO LOGICO
			DELETE IdRecibosPorPagar

		COMMIT

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0 
			ROLLBACK TRAN;
		THROW 92039, 'Error: no se ha podido completar el pago de los recibos.',1
	END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[spCortaAgua]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[spCortaAgua] @FechaActual DATE
AS  	
	BEGIN
		BEGIN TRY
			DECLARE @idPropiedades TABLE(ID int IDENTITY(1,1),IdPropiedad int,IdCCobro INT)
			DECLARE @idMenor INT, @idMayor INT, @cant int = IDENT_CURRENT('Recibo')
			BEGIN TRANSACTION
				INSERT INTO @idPropiedades(IdPropiedad, IdCCobro)
				SELECT R.IdPropiedad, R.IdCCobro
				FROM Recibo AS R
				WHERE R.Estado = 0 AND R.IdCCobro = 1 AND NOT EXISTS (SELECT ID FROM [dbo].[Recibo] WHERE IdCCobro = 10)
				GROUP BY IdPropiedad, IdCCobro
				HAVING COUNT(*) > 1
				 
				INSERT INTO Recibo (IdCCobro,Monto,Estado,IdPropiedad,FechaEmision,FechaMaximaPago)
				SELECT 10, CM.MontoFijo, 0, P.idPropiedad, @FechaActual, DATEADD(DAY,CC.QDiasVencimiento,@FechaActual)
				FROM @idPropiedades AS P
				INNER JOIN CCobro_MontoFijo AS CM ON CM.ID = 10
				INNER JOIN CCobro AS CC ON CC.ID = 10					

				INSERT INTO ReciboReconexion(id)
				SELECT R.ID
				FROM Recibo AS R
				JOIN @idPropiedades AS P ON 10 = R.IdCCobro AND P.IdPropiedad = R.IdPropiedad 

				INSERT INTO Corte(IdPropiedad,IdReciboReconexion,Fecha)
				SELECT P.IdPropiedad, R.ID, @FechaActual
				FROM @idPropiedades AS P 
				JOIN Recibo AS R ON P.IdPropiedad = R.IdPropiedad
				JOIN ReciboReconexion AS RR ON RR.ID = R.ID
				
			COMMIT
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN;
			THROW 50002,'Error: No se ha podido cortar el agua', 1;
		END CATCH
		
	END
GO
/****** Object:  StoredProcedure [dbo].[spCreateAP]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[spCreateAP] 
@IdP int, 
@MontoO money, 
@Plazo int,
@Cuota money,
@Fecha date,
@TasaA decimal
AS 
BEGIN
	BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

			DECLARE @IdC int,
					@idA int,
					@interesm decimal (10, 2),
					@amortizacion money,
					@fechaend date;

			SET @interesm = @MontoO*(@TasaA/100/12)
			SET @amortizacion = @Cuota - @interesm
			SET @fechaend =  DATEADD(MONTH, @Plazo, @Fecha)
			
			BEGIN TRAN
			
				--Se crea el comprobante
				INSERT INTO ComprobantePago(FechaPago, MontoTotal, MedioPago)
				VALUES (@Fecha, @MontoO, 'AP #')
				SET @idC = IDENT_CURRENT('ComprobantePago');
				
				--Se agregan a la tabla de recibos pagados
				INSERT INTO ReciboPagado (IdRecibo,IdComprobante)
				SELECT R.ID, @IdC
				FROM Recibo AS R
				WHERE IdPropiedad = @IdP and Estado = 0;

				--Se cambia el estado de los recibos pendientes a pagados
				UPDATE Recibo 
				SET Estado = 1
				WHERE IdPropiedad = @IdP and Estado = 0;

				--Se crea el AP
				INSERT INTO ArregloPago (IdPropiedad,IdComprobante, MontoOriginal, 
					Saldo, TasaInteresAnual, PlazoResta, Cuota, InsertedAt, UpdateAt)
					VALUES(@IdP, @IdC, @MontoO, @MontoO, @TasaA, @Plazo, @Cuota, @Fecha, @Fecha)
				SET @idA = IDENT_CURRENT('ArregloPago');

				--Se actualiza el medio de pago del AP
				UPDATE ComprobantePago
				SET MedioPago += +CAST(@idA AS VARCHAR)
				WHERE ID=@IdC;

				--Se crea el movimiento de debito del AP
				INSERT INTO MovimientoAP(IdArregloPago, IdTipoMovAP, Monto, InteresesDelMes, PlazoResta, NuevoSaldo, Fecha, InsertedAt)
				VALUES (@idA, 1, @MontoO, @interesm, @Plazo, @MontoO, @Fecha, @Fecha);

				--Se crea la relación entre propiedad y CCobro
				INSERT INTO CCobro_PNP (IdCCobbro, IdPropiedad, FechaInic, FechaFin)
				VALUES (12, @IdP, @Fecha, @fechaend);

			COMMIT

		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 50004,'Error: No se ha podido generar el AP',1;
		END CATCH
		return 0
END
GO
/****** Object:  StoredProcedure [dbo].[spCreatePropiedad_Propietario]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create     procedure [dbo].[spCreatePropiedad_Propietario]
(
	@idPropietario int,
	@idPropiedad int,
	@UsuarioACargo varchar(20),
	@IPusuario varchar(20)
)
as
Begin
	declare @jsonDespues varchar(500), @idModified int, @insertedAt DATETIME
	Insert into [dbo].Prop_Prop(IdPropietario, IdPropiedad, EstaBorrado)
	Values (@idPropietario, @idPropiedad, 0)
	SET @jsonDespues = (SELECT [id], [IdPropietario], [IdPropiedad]
	FROM [dbo].[Prop_Prop] WHERE [IdPropietario] = @idPropietario and [IdPropiedad] = idPropiedad
	FOR JSON PATH)
	SET @idModified = (SELECT [ID] FROM [dbo].[Prop_Prop] WHERE [IdPropietario ] = @idPropietario and [IdPropiedad] = @idPropiedad)
	SET @insertedAt = CONVERT(DATETIME, GETDATE())
	EXEC [dbo].[spInsertarBitacoraCambios] @inIdEntityType = 4,
										 @inEntityID = @idModified, 
										 @inJsonAntes = NULL,
										 @inJsonDespues = @jsonDespues, 
										 @inInsertedBy = @UsuarioACargo, 
										 @inInsertedIn = @IPusuario, 
										 @inInsertedAt = @insertedAt
End
GO
/****** Object:  StoredProcedure [dbo].[spCreatePropiedad_Usuario]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- SP para crear enlaces entre propiedades y usuarios

Create     procedure [dbo].[spCreatePropiedad_Usuario]
(
	@idU int,
	@idP int,
	@UsuarioACargo varchar(20),
	@IPusuario varchar(20)
)
as
Begin
	declare @jsonDespues varchar(500), @idModified int, @insertedAt DATETIME
	Insert into [dbo].Usuario_Prop(IdUsuario, IdPropiedad, EstaBorrado)
	Values (@idU, @idP, 0)
	SET @jsonDespues = (SELECT [id], [IdUsuario], [IdPropiedad]
	FROM [dbo].[Usuario_Prop] WHERE [IdUsuario] = @idU and [IdPropiedad] = @idP
	FOR JSON PATH)
	SET @idModified = (SELECT [ID] FROM [dbo].[Usuario_Prop] WHERE [IdUsuario] = @idU and [IdPropiedad] = @idP)
	SET @insertedAt = CONVERT(DATETIME, GETDATE())
	EXEC [dbo].[spInsertarBitacoraCambios] @inIdEntityType = 5,
										 @inEntityID = @idModified, 
										 @inJsonAntes = NULL,
										 @inJsonDespues = @jsonDespues, 
										 @inInsertedBy = @UsuarioACargo, 
										 @inInsertedIn = @IPusuario, 
										 @inInsertedAt = @insertedAt
End
GO
/****** Object:  StoredProcedure [dbo].[spEditarPropiedad]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create     procedure [dbo].[spEditarPropiedad] 
(      
	@id int,
	@NumFinca int,
	@Valor money,
	@Direccion VARCHAR(100)
)      
as      
begin  
     
   Update [dbo].Propiedad
   set NumFinca=@NumFinca, Valor=@Valor, Direccion = @Direccion
   where ID=@id      
End

GO
/****** Object:  StoredProcedure [dbo].[spEditarPropietario]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create   procedure [dbo].[spEditarPropietario]  
(      
	@id int,
	@Nombre VARCHAR(100),
	@IdTipoDocumento int,
	@ValorDocumento VARCHAR(30),
	@UsuarioACargo varchar(20),
	@IPusuario varchar(20)
)      
as      
begin  
    If @id is NULL
	BEGIN
		Return -1
	END 
	declare @jsonAntes varchar(500), @jsonDespues varchar(500), @idModified int, @insertedAt DATETIME
	   SET @insertedAt = GETDATE()
	   SET @idModified = (SELECT [ID] FROM [dbo].[Propietario] WHERE [ID] = @id)
	   -- Se crea el primer JSON
	   SET @jsonAntes = (SELECT [id], [nombre], [IdTipoDocumento], [ValorDocumento], [FechaIngreso]
	   FROM [dbo].[Propietario] WHERE [ID] = @id
	   FOR JSON PATH)
	   Update [dbo].Propietario
	   set Nombre=@Nombre, IdTipoDocumento=@IdTipoDocumento, ValorDocumento=@ValorDocumento
	   where ID=@id and EstaBorrado = 0   
	   -- Se crea el segundo JSON
	   SET @jsonDespues = (SELECT [ID], [Nombre], [IdTipoDocumento], [ValorDocumento], [FechaIngreso]
	   FROM [dbo].[Propietario] WHERE [ID] = @id
	   FOR JSON PATH)
	   EXEC [dbo].spInsertarBitacoraCambios @inIdEntityType = 2,
											@inEntityID = @idModified, 
											@inJsonAntes = @jsonAntes,
											@inJsonDespues = @jsonDespues, 
											@inInsertedBy = @UsuarioACargo, 
											@inInsertedIn = @IPusuario, 
											@inInsertedAt = @insertedAt
	End

GO
/****** Object:  StoredProcedure [dbo].[spEditarPropietario_Jud]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[spEditarPropietario_Jud]  
(      
	@id int,
	@Nombre VARCHAR(100),
	@IdTipoDocumento int,
	@ValorDocumento VARCHAR(30),
	@UsuarioACargo VARCHAR(20),
	@IPusuario VARCHAR(20)	
)      
as      
begin
	If @id is NULL
	BEGIN
		Return -1
	END
	BEGIN TRY
	declare @jsonAntes varchar(500), @jsonDespues varchar(500), @insertedAt DATETIME
	SET @insertedAt = GETDATE() 
	-- Se crea el primer JSON
	SET @jsonAntes = (SELECT  FechaIngreso, '' as Responsable, PJ.ID AS IDResable, NombrePersonaResponsable, PJ.IdTipoDocumento as TipoDocumentoR, PJ.ValorDocumento  as ValorDocumento,  
											'' as Propietario,  P.ID AS IDPropietario, Nombre, P.IdTipoDocumento as TipoDocumentoP, P.ValorDocumento as ValorDocumentoP
	FROM [dbo].[PropietarioJuridico] AS PJ
	INNER JOIN Propietario AS P ON P.ID = PJ.ID
	WHERE PJ.ID = @id
	FOR JSON PATH)
	Update [dbo].PropietarioJuridico
	set NombrePersonaResponsable=@Nombre, IdTipoDocumento=@IdTipoDocumento, ValorDocumento=@ValorDocumento
	where ID=@id and EstaBorrado = 0
	-- Se crea el segundo JSON
	SET @jsonDespues = (SELECT FechaIngreso, '' as Responsable, PJ.ID AS IDResable, NombrePersonaResponsable, PJ.IdTipoDocumento as TipoDocumentoR, PJ.ValorDocumento  as ValorDocumento,  
											 '' as Propietario,  P.ID AS IDPropietario, Nombre, P.IdTipoDocumento as TipoDocumentoP, P.ValorDocumento as ValorDocumentoP
	FROM [dbo].[PropietarioJuridico] AS PJ
	INNER JOIN Propietario AS P ON P.ID = PJ.ID
	WHERE PJ.ID = @id
	FOR JSON PATH)
	EXEC [dbo].spInsertarBitacoraCambios @inIdEntityType = 6,
				   						 @inEntityID = @id, 
										 @inJsonAntes = @jsonAntes,
										 @inJsonDespues = @jsonDespues, 
										 @inInsertedBy = @UsuarioACargo, 
										 @inInsertedIn = @IPusuario, 
										 @inInsertedAt = @insertedAt
	END TRY
	BEGIN CATCH
		If @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW 50002, 'Error no se pudo editar Propietario Juridico', 1
	END CATCH
End

GO
/****** Object:  StoredProcedure [dbo].[spEditarUsuario]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create   procedure [dbo].[spEditarUsuario]
(      
	@id int,
	@Nombre varchar(100),
	@Password varchar(100),
	@TipoUsuario VARCHAR(50),
	@UsuarioACargo varchar(20), 
	@IPusuario varchar(20) 
)      
as      
begin  
	begin try
	declare @jsonAntes varchar(500), @jsonDespues varchar(500), @idModified int, @insertedAt DATETIME
	SET @insertedAt = GETDATE()
	SET @idModified = (SELECT [ID] FROM [dbo].[Usuario] WHERE [ID] = @id)
   -- Se crea el primer JSON
   SET @jsonAntes = (SELECT [id], [nombre], [password], [tipoUsuario], [fechaIngreso]
   FROM [dbo].[Usuario] WHERE [ID] = @id
   FOR JSON PATH)

   Update [dbo].Usuario
   set Nombre=@Nombre, Password=@Password, TipoUsuario=@TipoUsuario
   where ID=@id     
   -- Se crea el segundo JSON
   SET @jsonDespues = (SELECT [ID], [Nombre], [Password], [TipoUsuario], [FechaIngreso]
   FROM [dbo].[Usuario] WHERE [ID] = @id
   FOR JSON PATH)
   EXEC [dbo].spInsertarBitacoraCambios @inIdEntityType = 3,
										@inEntityID = @idModified, 
										@inJsonAntes = @jsonAntes,
										@inJsonDespues = @jsonDespues, 
										@inInsertedBy = @UsuarioACargo, 
										@inInsertedIn = @IPusuario, 
										@inInsertedAt = @insertedAt    
	end try	
	begin catch
		If @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW 50001, 'Error no se pudo editar usuario', 1
	end catch
End

GO
/****** Object:  StoredProcedure [dbo].[spGeneraReciboAP]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[spGeneraReciboAP] 
@FechaActual date
AS 
BEGIN
	BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON
			DECLARE @dia int,
			@interesm MONEY,
			@montoamort MONEY,
			@idMenor INT,
			@idMayor INT,
			@idRecibo INT,
			@TasaInteresAnual FLOAT,
			@plazoRestante INT,
			@nuevoSaldo MONEY,
			@idMov INT;

			DECLARE @aps TABLE (sec INT IDENTITY(1,1),idap int);

			SET @TasaInteresAnual = CONVERT(decimal(5,2),(SELECT Valor FROM ValoresConfiguracion WHERE ID = 1));
			SET @dia = DAY(@FechaActual);

			--Todos los AP que generan recibos este día 
			INSERT INTO @aps(idap)
			SELECT id 
			FROM ArregloPago
			WHERE DAY(insertedAt) = @dia AND PlazoResta > 0;

			SELECT @idMenor = MIN(sec), @idMayor = MAX(sec) FROM @aps;

			  BEGIN TRAN
				WHILE (@idMenor<=@idMayor)
				BEGIN 
					--Se obtienen los datos de intereses y monto de amortización
					SElECT @interesm =  A.Saldo*(@TasaInteresAnual/12) / 100, @montoamort = A.Cuota - @interesm
					FROM ArregloPago AS A
					INNER JOIN @aps AS IA ON A.ID = IA.idap
					WHERE IA.sec = @idMenor;
					
					--Se actualiza el saldo del AP
					UPDATE ArregloPago
					SET Saldo = Saldo - @montoamort,
					PlazoResta = PlazoResta-1
					FROM ArregloPago AS AP 
					INNER JOIN @aps AS IA ON AP.id = IA.idap
					WHERE IA.sec = @idMenor;

					--Se obtienen los datos del plazo restante y saldo nuevo
					SELECT @plazoRestante = A.PlazoResta, @nuevoSaldo =  A.Saldo
					FROM ArregloPago AS A
					INNER JOIN @aps AS IA ON A.id = IA.idap
					WHERE IA.sec = @idMenor;

					--Se crea el Movimiento del AP
					INSERT INTO MovimientoAP (IdArregloPago,IdTipoMovAP,Monto,InteresesDelMes,plazoResta,nuevoSaldo,fecha,insertedAt)
					SELECT AP.id,2,@montoamort,@interesm,@plazoRestante,@nuevoSaldo,@FechaActual,@FechaActual
					FROM [dbo].[ArregloPago] AP
					INNER JOIN @aps AS IA ON AP.id = IA.idap
					WHERE IA.sec = @idMenor
					SET @idMov = IDENT_CURRENT('[dbo].[MovimientoAP]');

					--Se crea el recibo del AP
					INSERT INTO Recibo (IdCCobro,Monto,Estado,IdPropiedad,FechaEmision,FechaMaximaPago)
					SELECT C.ID,A.Cuota,0,A.IdPropiedad,@FechaActual,DATEADD(D,C.QDiasVencimiento,@FechaActual)
					FROM @aps IA 
					INNER JOIN CCobro AS C ON C.ID = 12
					INNER JOIN ArregloPago AS A ON A.ID = IA.idap
					WHERE IA.sec = @idMenor
					SET @idRecibo = IDENT_CURRENT('[dbo].[Recibo]');
					
					INSERT INTO Recibo_AP(ID,Descripcion,IdMovimientoAP)
					SELECT @idRecibo
						,'Interes mensual:'+CAST(@interesm AS VARCHAR(30))
						+', amortizacion:'+CAST(@montoamort AS VARCHAR(30))
						+', plazo resta:'+CAST(@plazoRestante AS VARCHAR(30))
						,@idMov
					SET @idMenor += 1;
				END

			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 50004,'Error: No se ha podido generar el recibo de AP',1;
		END CATCH
		return 0
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertarBitacoraCambios]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[spInsertarBitacoraCambios] 
	@inIdEntityType int, --referencia a table EntityType
	@inEntityID int,	 --Id de la entidad siendo actualizada
	@inJsonAntes VARCHAR(500), --Datos antes de ser cambiados
	@inJsonDespues VARCHAR(500), --Datos despues del cambio
	@inInsertedBy varchar(20),  --Insertado por
	@inInsertedIn varchar(20),  --Ip desde donde se insertó
	@inInsertedAt DATETIME --Fecha del cambio
AS   
BEGIN
	If (@inIdEntityType IS Null and @inEntityID is NUll)
    BEGIN
        Return -1 --ocurrio un error
    END
	BEGIN TRY
		INSERT INTO [dbo].[BitacoraCambios] ([idEntityType], [EntityId], [jsonAntes],[jsonDespues],
											 [insertedBy],[insertedIn],[insertedAt])
		SELECT @inIdEntityType, @inEntityID, @inJsonAntes, @inJsonDespues, @inInsertedBy, @inInsertedIn, @inInsertedAt
	END TRY
	BEGIN CATCH
		THROW 50001,'Error: No se realizó el cambio en la bitacora',1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertarPropiedad]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create     procedure [dbo].[spInsertarPropiedad]
(
	@NumFinca int,
	@Valor money,
	@Direccion VARCHAR(100)
)
as
Begin
	Insert into [dbo].Propiedad (NumFinca, Valor, Direccion, EstaBorrado)
	Values (@NumFinca, @Valor, @Direccion, 0)
End
GO
/****** Object:  StoredProcedure [dbo].[spInsertarPropietario]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   procedure [dbo].[spInsertarPropietario]
(
	@Nombre VARCHAR(100),
	@IdTipoDocumento int,
	@ValorDocumento VARCHAR(30),
	@UsuarioACargo varchar(20), 
	@IPusuario varchar(20)
)
as
Begin
	BEGIN TRY 
	declare @jsonDespues varchar(500), @idModified int, @insertedAt DATETIME
	Insert into [dbo].Propietario (Nombre, IdTipoDocumento, ValorDocumento, EstaBorrado, FechaIngreso)
	Values (@Nombre, @IdTipoDocumento, @ValorDocumento, 0, CONVERT(DATE,GETDATE()))
	select ID from Propietario where @Nombre=Nombre and @IdTipoDocumento=IdTipoDocumento and @ValorDocumento=ValorDocumento and 0=EstaBorrado
	SET @jsonDespues =( SELECT ID, Nombre, IdTipoDocumento, ValorDocumento, FechaIngreso
	FROM [dbo].Propietario WHERE [nombre] = @Nombre and ValorDocumento = @ValorDocumento
	FOR JSON PATH)
	SET @idModified = (SELECT [ID] FROM [dbo].Propietario WHERE [Nombre] = @Nombre and ValorDocumento = @ValorDocumento)
	SET @insertedAt = CONVERT(DATETIME, GETDATE())
	EXEC [dbo].[spInsertarBitacoraCambios] @inIdEntityType = 2,
										 @inEntityID = @idModified, 
										 @inJsonAntes = NULL,
										 @inJsonDespues = @jsonDespues, 
										 @inInsertedBy = @UsuarioACargo, 
										 @inInsertedIn = @IPusuario, 
										 @inInsertedAt = @insertedAt
	END TRY
	BEGIN CATCH
		If @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW 50001, 'Error, no se pudo insertar', 1
	END CATCH
End
GO
/****** Object:  StoredProcedure [dbo].[spInsertarPropietario_Jud]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--SPs para el CRUD de Propietarios Juridicos

CREATE   procedure [dbo].[spInsertarPropietario_Jud]
(
	@id int,
	@Nombre VARCHAR(100),
	@IdTipoDocumento int,
	@ValorDocumento VARCHAR(30),
	@UsuarioACargo VARCHAR(20),
	@IPusuario VARCHAR(20)
)
as
Begin
	If @id is NULL
	BEGIN
		Return -1
	END
	BEGIN TRY
	declare @jsonDespues varchar(500), @idModified int, @insertedAt DATETIME
	Insert into [dbo].PropietarioJuridico (ID, NombrePersonaResponsable, IdTipoDocumento, ValorDocumento, EstaBorrado)
	Values (@id, @Nombre, @IdTipoDocumento, @ValorDocumento, 0)
	select ID
	from PropietarioJuridico
	SET @jsonDespues = (SELECT FechaIngreso, '' as Responsable, PJ.ID AS IDResable, NombrePersonaResponsable, PJ.IdTipoDocumento as TipoDocumentoR, PJ.ValorDocumento  as ValorDocumento,  
											'' as Propietario,  P.ID AS IDPropietario, Nombre, P.IdTipoDocumento as TipoDocumentoP, P.ValorDocumento as ValorDocumentoP
	FROM [dbo].[PropietarioJuridico] AS PJ
	INNER JOIN Propietario AS P ON P.ID = PJ.ID
	WHERE NombrePersonaResponsable = @Nombre and PJ.ValorDocumento = @ValorDocumento
	FOR JSON PATH)
	SET @idModified = (SELECT [ID] FROM [dbo].PropietarioJuridico WHERE NombrePersonaResponsable = @Nombre and ValorDocumento = @ValorDocumento)
	SET @insertedAt = CONVERT(DATETIME, GETDATE())
	EXEC [dbo].[spInsertarBitacoraCambios] @inIdEntityType = 6,
										 @inEntityID = @idModified, 
										 @inJsonAntes = NULL,
										 @inJsonDespues = @jsonDespues, 
										 @inInsertedBy = @UsuarioACargo, 
										 @inInsertedIn = @IPusuario, 
										 @inInsertedAt = @insertedAt
	END TRY
	BEGIN CATCH
		If @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW 50001, 'Error no se pudo insertar Propietario Juridico', 1
	END CATCH
End

GO
/****** Object:  StoredProcedure [dbo].[spInsertarUsuario]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   procedure [dbo].[spInsertarUsuario]
(
	@Nombre VARCHAR(150),
	@Password VARCHAR(150),
	@TipoUsuario VARCHAR(150), 
	@UsuarioACargo varchar(20), 
	@IPusuario varchar(20)
)
as
Begin
	BEGIN TRY
	declare @jsonDespues varchar(500), @idModified int, @insertedAt DATETIME
	Insert into [dbo].Usuario(Nombre, Password, TipoUsuario, FechaIngreso, EstaBorrado )
	Values (@Nombre, @Password, @TipoUsuario, CONVERT(DATE,GETDATE()), 0)
	SET @jsonDespues = (SELECT [id], [Nombre], [Password], [TipoUsuario], [FechaIngreso]
	FROM [dbo].[Usuario] WHERE [nombre] = @Nombre and [Password] = @Password
	FOR JSON PATH)
	SET @idModified = (SELECT [ID] FROM [dbo].[Usuario] WHERE [Nombre] = @Nombre and [Password] = @Password)
	SET @insertedAt = CONVERT(DATETIME, GETDATE())
	EXEC [dbo].[spInsertarBitacoraCambios] @inIdEntityType = 3,
										 @inEntityID = @idModified, 
										 @inJsonAntes = NULL,
										 @inJsonDespues = @jsonDespues, 
										 @inInsertedBy = @UsuarioACargo, 
										 @inInsertedIn = @IPusuario, 
										 @inInsertedAt = @insertedAt
	END TRY
	BEGIN CATCH
		If @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW 50000, 'Error no se pudo insertar usuario', 1
	END CATCH
End
GO
/****** Object:  StoredProcedure [dbo].[spObtenerBitacora]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[spObtenerBitacora]
as
Begin
	select ID, insertedAt
	from [dbo].BitacoraCambios
End
GO
/****** Object:  StoredProcedure [dbo].[spObtenerBitacoraConsulta]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create     procedure [dbo].[spObtenerBitacoraConsulta]
(      
   @datei date,    
   @datee date,
   @type int
)      
as       
begin      
	begin try
		Select ID, insertedAt
		from [dbo].BitacoraCambios 
		where convert(date,insertedAt) >= @datei and  convert(date,insertedAt) <= @datee and IdEntityType = @type
	end try
	begin catch
		return -1
	end catch
End
GO
/****** Object:  StoredProcedure [dbo].[spObtenerComprobantesPedePropiedad]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[spObtenerComprobantesPedePropiedad] @id int as 	
	BEGIN
	BEGIN TRY
		SELECT C.ID, C.FechaPago, C.MontoTotal
		FROM ComprobantePago AS C
		INNER JOIN ReciboPagado AS RP ON RP.IdComprobante = C.ID
		INNER JOIN Recibo AS R ON RP.IdRecibo = R.ID
		WHERE @id=R.IdPropiedad
		GROUP BY C.ID, C.FechaPago, C.MontoTotal
		ORDER BY C.FechaPago DESC
	END TRY
	BEGIN CATCH
	If @@TRANCOUNT > 0 
		ROLLBACK TRAN;
		THROW 60000,'Error: No se ha podido buscar Recibos',1;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerporcentajeAP]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[spObtenerporcentajeAP] 
as 	
	BEGIN 
		BEGIN TRY
			SELECT Valor FROM ValoresConfiguracion WHERE ID = 1
		END TRY
		BEGIN CATCH
			THROW 60000,'Error: No se ha podido buscar porcentaje',1;
		END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPropiedades]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create     procedure [dbo].[spObtenerPropiedades]
as
Begin
	select ID, NumFinca, Valor, Direccion 
	from [dbo].Propiedad
	where EstaBorrado = 0
End
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPropiedades_Propietarios]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create     procedure [dbo].[spObtenerPropiedades_Propietarios]
(
	@id int
)
as
	SELECT Prop_Prop.ID, Propiedad.NumFinca, Propiedad.Valor, Propiedad.Direccion
	FROM Prop_Prop
	INNER JOIN Propiedad ON Prop_Prop.IdPropiedad=Propiedad.ID
	INNER JOIN Propietario ON Prop_Prop.IdPropietario=Propietario.ID
	where Propietario.ID = @id and Prop_Prop.EstaBorrado = 0 and Propietario.EstaBorrado=0 and Propiedad.EstaBorrado=0

GO
/****** Object:  StoredProcedure [dbo].[spObtenerPropiedades_Propietarios_Ingresado]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create     procedure [dbo].[spObtenerPropiedades_Propietarios_Ingresado]
	@ingresado varchar(100)
as
	SELECT Prop_Prop.ID, Propiedad.NumFinca, Propiedad.Valor, Propiedad.Direccion
	FROM Prop_Prop
	INNER JOIN Propiedad ON Prop_Prop.IdPropiedad=Propiedad.ID
	INNER JOIN Propietario ON Prop_Prop.IdPropietario=Propietario.ID
	where Propietario.Nombre = @ingresado or Propietario.ValorDocumento = @ingresado and Prop_Prop.EstaBorrado = 0 
	and Propietario.EstaBorrado=0 and Propiedad.EstaBorrado=0
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPropiedades_SinPropietario]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create     procedure [dbo].[spObtenerPropiedades_SinPropietario]
(
	@id int
)
as
	SELECT DISTINCT Propiedad.ID, Propiedad.NumFinca, Propiedad.Valor, Propiedad.Direccion
	FROM Prop_Prop
	FULL JOIN Propiedad ON Propiedad.ID=Prop_Prop.IdPropiedad
	FULL JOIN Propietario ON Prop_Prop.IdPropietario=Propietario.ID
	where Propietario.ID IS NULL or Propietario.ID <> @id and Propiedad.ID IS NOT NULL and Propietario.EstaBorrado = 0 and Propietario.EstaBorrado = 0 and Propiedad.EstaBorrado=0
	order by Propiedad.ID
	
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPropiedades_SinUsuario]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SP para saber que propiedades no están con el usuario

Create     procedure [dbo].[spObtenerPropiedades_SinUsuario]
(
	@id int
)
as
BEGIN
	SELECT DISTINCT Propiedad.ID, Propiedad.NumFinca, Propiedad.Valor, Propiedad.Direccion
	FROM Usuario_Prop
	FULL JOIN Propiedad ON Propiedad.ID=Usuario_Prop.IdPropiedad
	FULL JOIN Usuario ON Usuario_Prop.IdUsuario=Usuario.ID
	where (Usuario.ID=@id and Propiedad.ID=Usuario_Prop.ID) or Usuario.ID IS NULL or Usuario.ID <> @id and Propiedad.ID IS NOT NULL and (Usuario_Prop.EstaBorrado = 0 and Usuario.EstaBorrado = 0 and Propiedad.EstaBorrado=0)
	order by Propiedad.ID
END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPropiedades_Usuarios]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   procedure [dbo].[spObtenerPropiedades_Usuarios]
(
	@id int
)
as
	SELECT Propiedad.ID, Propiedad.NumFinca, Propiedad.Valor, Propiedad.Direccion
	FROM Usuario_Prop
	INNER JOIN Propiedad ON Usuario_Prop.IdPropiedad=Propiedad.ID
	INNER JOIN Usuario ON Usuario_Prop.IdUsuario=Usuario.ID
	where Usuario.ID = @id and Usuario_Prop.EstaBorrado = 0 and Usuario.EstaBorrado = 0 and Propiedad.EstaBorrado=0

GO
/****** Object:  StoredProcedure [dbo].[spObtenerPropiedades_Usuarios_PorNombre]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create       procedure [dbo].[spObtenerPropiedades_Usuarios_PorNombre]
(
	@nombre varchar(100)
)
as
BEGIN
	SELECT Usuario_Prop.ID, Propiedad.NumFinca, Propiedad.Valor, Propiedad.Direccion
	FROM Usuario_Prop
	INNER JOIN Propiedad ON Usuario_Prop.IdPropiedad=Propiedad.ID
	INNER JOIN Usuario ON Usuario_Prop.IdUsuario=Usuario.ID
	where Usuario.Nombre = @nombre and Usuario_Prop.EstaBorrado = 0 and Usuario.EstaBorrado = 0 and Propiedad.EstaBorrado=0
END 
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPropietario_SinPropiedad]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--SP para saber que propietarios no están con la propiedad

Create     procedure [dbo].[spObtenerPropietario_SinPropiedad]
(
	@id int
)
as
Begin
	SELECT DISTINCT Propietario.ID, Propietario.Nombre, Propietario.IdTipoDocumento, Propietario.ValorDocumento
	FROM Prop_Prop
	FULL JOIN Propiedad ON Propiedad.ID=Prop_Prop.IdPropiedad
	FULL JOIN Propietario ON Propietario.ID=Prop_Prop.IdPropietario
	where Propiedad.ID IS NULL or Propiedad.ID <> @id and Propietario.ID IS NOT NULL and Propietario.EstaBorrado = 0 and Propietario.EstaBorrado = 0 and Propiedad.EstaBorrado=0
	order by Propietario.ID
End
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPropietarios]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create     procedure [dbo].[spObtenerPropietarios]
as
Begin
	select ID, Nombre, IdTipoDocumento, ValorDocumento 
	from [dbo].Propietario
	where EstaBorrado = 0 and EstaBorrado = 0
End
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPropietarios_Propiedades]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create     procedure [dbo].[spObtenerPropietarios_Propiedades]
(
	@id int
)
as
BEGIN
	SELECT Prop_Prop.ID, Propietario.Nombre, Propietario.IdTipoDocumento, Propietario.ValorDocumento
	FROM Prop_Prop
	INNER JOIN Propiedad ON Prop_Prop.IdPropiedad=Propiedad.ID
	INNER JOIN Propietario ON Prop_Prop.IdPropietario=Propietario.ID
	where Propiedad.ID = @id and Prop_Prop.EstaBorrado = 0 and Propiedad.EstaBorrado =0 and Propietario.EstaBorrado=0
END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPropietarios_Propiedades_PorFinca]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create       procedure [dbo].[spObtenerPropietarios_Propiedades_PorFinca]
(
	@finca int
)
as
BEGIN
	SELECT Prop_Prop.ID, Propietario.Nombre, Propietario.IdTipoDocumento, Propietario.ValorDocumento
	FROM Prop_Prop
	INNER JOIN Propiedad ON Prop_Prop.IdPropiedad=Propiedad.ID
	INNER JOIN Propietario ON Prop_Prop.IdPropietario=Propietario.ID
	where Propiedad.NumFinca = @finca and Prop_Prop.EstaBorrado = 0 and Propiedad.EstaBorrado =0 and Propietario.EstaBorrado=0
END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPropietariosJuridicos]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create     procedure [dbo].[spObtenerPropietariosJuridicos]
as
Begin
	select P.Nombre, P.IdTipoDocumento, P.ValorDocumento, PJ.IdTipoDocumento, PJ.NombrePersonaResponsable, PJ.ValorDocumento
	from [dbo].PropietarioJuridico PJ inner join [dbo].Propietario P on PJ.ID = P.ID


End
GO
/****** Object:  StoredProcedure [dbo].[spObtenerRecibosdePropiedadConInteres]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[spObtenerRecibosdePropiedadConInteres] 
@id int
as 	
	BEGIN 
		BEGIN TRY

			SET NOCOUNT ON 
			SET XACT_ABORT ON

			DECLARE 
				@min int, 
				@max int, 
				@monto money, 
				@montointeres money, 
				@tasainteres float, 
				@fechaMax date, 
				@fechaOperacion date		

			DECLARE @result table(
				ID int, 
				FechaEmision date, 
				Nombre varchar(100), 
				Monto money, 
				Montointeres money
			)

			SELECT @min = MIN(ID), @max = Max(ID) 
			FROM Recibo AS R 
			WHERE R.Estado=0 AND @id=R.IdPropiedad

			BEGIN TRANSACTION
			WHILE (@min<=@max)
			BEGIN
				SET @monto = (SELECT Monto FROM Recibo WHERE @min = ID)
				SET @tasainteres = (SELECT CC.TasaInteresMoratorio FROM CCobro AS CC
									INNER JOIN Recibo AS R ON R.IdCCobro = CC.ID 
									WHERE @min = R.ID)
				SET @fechaOperacion = GETDATE()
				SET @FechaMax = (SELECT FechaMaximaPago FROM Recibo R WHERE @min = R.ID)
				SET @montointeres =  (@monto*@tasainteres/365)*ABS(DATEDIFF(day, @FechaMax, @fechaOperacion))

				IF @FechaMax < @fechaOperacion
					BEGIN
						--CREA UN RECIBO TIPO MORATORIO Y LO PAGA
						INSERT INTO [dbo].[Recibo](IdPropiedad,IdCCobro,Monto,Estado,FechaEmision,FechaMaximaPago)
						SELECT @id,  CC.ID, @montointeres, 1, @fechaOperacion, DATEADD(day, CC.QDiasVencimiento, @fechaOperacion)
						FROM [dbo].[CCobro] AS CC
						WHERE CC.ID = 11
					END

				INSERT INTO @result
				SELECT R.ID, R.FechaEmision, CC.Nombre, R.Monto, @montointeres
				FROM Recibo AS R
				INNER JOIN CCobro AS CC ON R.IdCCobro = CC.ID
				WHERE R.Estado=0 AND @id=R.IdPropiedad and  @min = R.ID

				

				SELECT @min = MIN(ID) FROM Recibo AS R WHERE R.Estado=0 AND @id=R.IdPropiedad and ID>@min
			END
			
			SELECT ID, FechaEmision, Nombre, Monto, Montointeres
			FROM @result AS r
			ORDER BY r.FechaEmision ASC
			COMMIT
		END TRY
		BEGIN CATCH
		If @@TRANCOUNT > 0 
			ROLLBACK TRAN;
			THROW 60000,'Error: No se ha podido buscar Recibos',1;
		END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerRecibosPedePropiedad]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[spObtenerRecibosPedePropiedad] @id int, @estado int as 	
BEGIN
BEGIN TRY
	SELECT R.ID, R.FechaEmision, CC.Nombre, R.Monto
	FROM Recibo AS R
	INNER JOIN CCobro AS CC ON R.IdCCobro = CC.ID
	WHERE R.Estado=@estado AND @id=R.IdPropiedad
	ORDER BY R.FechaEmision DESC
END TRY
BEGIN CATCH
	THROW 60000,'Error: No se ha podido buscar Recibos',1;
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerUsuarios]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create     procedure [dbo].[spObtenerUsuarios]
as
Begin
	select ID, Nombre, Password, TipoUsuario 
	from [dbo].Usuario
	where EstaBorrado = 0 
End
GO
/****** Object:  StoredProcedure [dbo].[spObtenerUsuarios_Propiedades]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create     procedure [dbo].[spObtenerUsuarios_Propiedades]
(
	@id int
)
as
BEGIN
	SELECT DISTINCT Usuario_Prop.ID, Usuario.Nombre, Usuario.Password, Usuario.TipoUsuario
	FROM Usuario_Prop
	INNER JOIN Propiedad ON Usuario_Prop.IdPropiedad=Propiedad.ID
	INNER JOIN Usuario ON Usuario_Prop.IdUsuario=Usuario.ID
	where Propiedad.ID = @id and Usuario_Prop.EstaBorrado = 0 and Usuario.EstaBorrado=0 and Propiedad.EstaBorrado=0
END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerUsuarios_Propiedades_PorFinca]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create       procedure [dbo].[spObtenerUsuarios_Propiedades_PorFinca]
(
	@finca int
)
as
BEGIN
	SELECT DISTINCT Usuario_Prop.ID, Usuario.Nombre, Usuario.Password, Usuario.TipoUsuario
	FROM Usuario_Prop
	INNER JOIN Propiedad ON Usuario_Prop.IdPropiedad=Propiedad.ID
	INNER JOIN Usuario ON Usuario_Prop.IdUsuario=Usuario.ID
	where Propiedad.NumFinca = @finca and Usuario_Prop.EstaBorrado = 0 and Usuario.EstaBorrado=0 and Propiedad.EstaBorrado=0
END 
GO
/****** Object:  StoredProcedure [dbo].[spObtenerUsuarios_SinPropiedad]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create     procedure [dbo].[spObtenerUsuarios_SinPropiedad]
(
	@id int
)
as
BEGIN
	SELECT DISTINCT Usuario.ID, Usuario.Nombre, Usuario.Password, Usuario.TipoUsuario
	FROM Usuario_Prop
	FULL JOIN Propiedad ON Propiedad.ID=Usuario_Prop.IdPropiedad
	FULL JOIN Usuario ON Usuario.ID=Usuario_Prop.IdUsuario
	where Propiedad.ID IS NULL or Propiedad.ID <> @id and Usuario.ID IS NOT NULL and Usuario.EstaBorrado = 0 and Usuario_Prop.EstaBorrado = 0 and Propiedad.EstaBorrado=0
	order by Usuario.ID
END
GO
/****** Object:  StoredProcedure [dbo].[spProcesaCambioValorPropiedad]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[spProcesaCambioValorPropiedad] @PropiedadCambio CambioValorPropiedadType READONLY   
AS
BEGIN
	
	-- Variables para controlar la iteración
	declare @Lo1 int, @Hi1 int
	
	BEGIN TRY 
		SELECT @Lo1 = min(sec), @Hi1=max(sec) 
		FROM @PropiedadCambio
		--iteramos del menor al mayor cambio
		WHILE @Lo1<=@Hi1
			BEGIN
				UPDATE dbo.Propiedad
				SET dbo.Propiedad.Valor = PC.nuevoValor
				FROM [dbo].[Propiedad] P
				INNER JOIN @PropiedadCambio PC ON PC.numFinca = P.NumFinca
				WHERE PC.sec = @Lo1
				SET @Lo1 = @Lo1+1 
			END
	END TRY
	BEGIN CATCH
		return @@Error * -1
	END CATCH
End

GO
/****** Object:  StoredProcedure [dbo].[spProcesaConsumo]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[spProcesaConsumo] @MovConsumo MovConsumoType READONLY
AS 
BEGIN
	BEGIN TRY
		DECLARE @Low  int, @High int
		DECLARE @ultimoRecibo int, @monto int, @NuevoAcumM3 int, @inLecturaM3 int
		
		SELECT @Low = min(sec) , @High = max(sec) 
		FROM @MovConsumo 

		BEGIN TRANSACTION
		WHILE @Low <= @High
		BEGIN
			
			SELECT @ultimoRecibo = P.M3AcumuladosUltimoRecibo, @inLecturaM3 = C.M3
			FROM dbo.Propiedad P
			INNER JOIN @MovConsumo C ON C.NumFinca = P.NumFinca
			WHERE C.sec = @Low
					 
			SET @monto = (@InLecturaM3 - @ultimoRecibo)
			SET @NuevoAcumM3 = (SELECT P.M3Acumulados 
								FROM [dbo].[Propiedad] as P
								INNER JOIN @MovConsumo C ON C.NumFinca = P.NumFinca 
								WHERE C.sec = @Low) + @monto --SUMAMOS EL MONTO
			

			INSERT INTO dbo.MovimientoConsumo(IdPropiedad, IdTipoMovimiento, Descripcion, MontoM3, LecturaConsumo, NuevoM3Consumo, FechaMov)
			SELECT Prop.ID
				, Cons.TipoMov 
				, Cons.Descripcion
				, CASE WHEN (Cons.TipoMov = 1) THEN @monto --Nuevo monto de la lectura
				  ELSE @InLecturaM3
				  END
				, CASE WHEN (Cons.TipoMov = 1) THEN Cons.M3 
				  ELSE 0 
				  END
				, CASE WHEN (Cons.TipoMov = 1) THEN @NuevoAcumM3
				  WHEN (Cons.TipoMov = 2) THEN Prop.M3Acumulados + @InLecturaM3 --Suma porque fue una lectura erronea
				  WHEN (Cons.TipoMov = 3) THEN Prop.M3Acumulados - @InLecturaM3 --Resta porque fue un reclamo de cliente
				  END
				, Cons.Fecha
 			FROM dbo.Propiedad Prop
			INNER JOIN @MovConsumo Cons ON Cons.NumFinca = Prop.NumFinca
			WHERE Cons.sec = @Low

			UPDATE dbo.Propiedad
			SET M3Acumulados = 
				CASE WHEN (C.TipoMov = 1) THEN @NuevoAcumM3
				WHEN (C.TipoMov = 2) THEN P.M3Acumulados + @InLecturaM3 --dudas
				WHEN (C.TipoMov = 3) THEN P.M3Acumulados - @InLecturaM3 --dudas
				END
			FROM dbo.Propiedad P 
			INNER JOIN @MovConsumo C ON C.NumFinca = P.NumFinca
			WHERE C.sec = @Low

			SET @Low = @Low + 1
		END
		COMMIT
	END TRY
	BEGIN CATCH
		If @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW 50001, 'Error en la transaccion de Consumos', 1
	END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[spProcesaPagos]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[spProcesaPagos] @PagosHoy PagosHoyType READONLY
AS   
	BEGIN
		BEGIN TRY
			SET NOCOUNT ON 
			SET XACT_ABORT ON
			
			--Variables para actualizaciones e inserts
			DECLARE @idMenor INT, @idMayor INT, @fechaVence DATE, @fechaOperacion DATE, @montoMoratorio MONEY, @inRecibo  INT,
					@idComprobante INT, @tasaMoratoria FLOAT, @montoRecibo MONEY, @tipoCC int, @idPropiedad INT
			
			--Tabla de id por concepto de cobro de cada propiedad 
			DECLARE @ReciboPagar TABLE
			(
				id INT IDENTITY(1,1),
				idRecibo INT
			)
			--@inRecibo itera sobre la tabla recibo
			SET @inRecibo = 1
			SELECT @idMenor = min([sec]), @idMayor=max([sec]) FROM @PagosHoy--SACA ID MAYOR Y MENOR PARA ITERAR LA TABLA
			
			BEGIN TRANSACTION
				--RECORRE LOS PAGOS DE FINCAS
				WHILE @idMenor<=@idMayor
				BEGIN
					SET @montoMoratorio = 0 --MONTO MORATORIO SE CAMBIA SI ES QUE HAY RECIBO MORATORIO, SINO ES 0
					SET @fechaOperacion = (SELECT Fecha FROM @PagosHoy WHERE sec = @idMenor)
					SET @tipoCC = (SELECT TipoRecibo FROM @PagosHoy WHERE sec = @idMenor)--TIPO CC EN EL PAGO
					SET @idPropiedad = (SELECT PR.ID FROM Propiedad AS PR --PROPIEDAD A LA QUE SE LE HACE EL PAGO
										INNER JOIN @PagosHoy AS P ON P.NumFinca = PR.NumFinca 
										WHERE P.sec = @idMenor)
					
					--VERIFICA SI EXISTE EL COMPROBANTE DE PAGO PARA ESA PROPIEDAD, ESE MISMO DIA
					SET @idComprobante = (SELECT CP.ID FROM ComprobantePago AS CP 
										  INNER JOIN ReciboPagado AS RP ON RP.IdComprobante = CP.ID
										  INNER JOIN Recibo R ON R.ID = RP.IdRecibo
										  WHERE R.IdPropiedad = @idPropiedad AND CP.FechaPago = @fechaOperacion)
				
					--SI NO EXISTE ENTONCES LO CREA
					IF @idComprobante IS NULL
					BEGIN
						INSERT INTO ComprobantePago(FechaPago, MontoTotal)
						SELECT @fechaOperacion, 0
						SET @idComprobante = IDENT_CURRENT('ComprobantePago')
					END
					
					--SE INSERTAN LOS RECIBOS DE LA PROPIEDAD EN LA TABLA VARIABLE, Y SE VAN ACUMULANDO, PARA ESO SE USA EL CONTADOR
					--SI ES CONCEPTO DE COBRO 10 (RECONEXION)
					IF @tipoCC = 10
						BEGIN
							INSERT INTO @ReciboPagar(idRecibo)
							SELECT R.ID
							FROM @PagosHoy P
							INNER JOIN dbo.Propiedad AS PR ON PR.NumFinca = P.NumFinca 
							INNER JOIN dbo.Recibo AS R ON R.IdPropiedad = PR.ID
							WHERE P.sec = @idMenor AND R.Estado = 0
							AND (R.IdCCobro = 1	  --GUARDA TODOS LOS RECIBOS DE AGUA PENDIENTES (1)
								OR R.IdCCobro = 11 --GUARDA TODOS LOS RECIBOS MORATORIOS PENDIENTES (11)
								OR R.IdCCobro = 10)--GUARDA TODOS LOS RECIBOS DE RECONEXION PENDIENTES (10)
						END
					ELSE--SI ES OTRO CONCEPTO DE COBRO
						BEGIN
							INSERT INTO @ReciboPagar(idRecibo)
							SELECT R.ID
							FROM @PagosHoy P
							INNER JOIN [dbo].[Propiedad] AS PR ON PR.NumFinca = P.NumFinca 
							INNER JOIN [dbo].[Recibo] AS R ON R.IdPropiedad = PR.ID
							WHERE P.sec = @idMenor AND R.[Estado] = 0
							AND (R.IdCCobro = 11			--GUARDA TODOS LOS RECIBOS MORATORIOS PENDIENTES (11)
								OR	R.IdCCobro = @tipoCC)--GUARDA TODOS LOS RECIBOS DE DE ESE CONCEPTO DE COBRO PENDIENTES (@TIPOCC)
						END
					

					--MIENTRAS EXISTA UN CONCEPTO DE COBRO SIN PAGAR, RECORRA LOS RECIBOS
					WHILE EXISTS(SELECT idRP.id FROM @ReciboPagar idRP INNER JOIN [dbo].[Recibo] AS R ON R.ID = idRP.idRecibo WHERE R.Estado = 0)
					BEGIN
						--ESTABLECE EL MONTO DEL RECIBO
						SET @montoRecibo = (SELECT R.Monto FROM [dbo].[Recibo] AS R
											INNER JOIN @ReciboPagar idRP ON R.id = idRP.idRecibo
											WHERE idRP.id = @inRecibo)

						--INSERTA UNA RELACION ENTRE RECIBO Y COMPROBANTE DE PAGO
						INSERT INTO [dbo].[ReciboPagado](IdRecibo, IdComprobante)
						SELECT idRP.idRecibo, @idComprobante
						FROM @ReciboPagar idRP
						WHERE idRP.id = @inRecibo 

						--PAGA EL RECIBO ACTUALIZANDO SU ESTADO A PAGADO
						UPDATE [dbo].[Recibo]
						SET [estado] = 1
						FROM @ReciboPagar idRP
						WHERE idRP.idRecibo = [dbo].[Recibo].[ID] AND idRP.id = @inRecibo

						--VERIFICA SI SE DEBE CREAR RECIBO MORATORIO
						--SACA LA FECHA EN LA QUE VENCE EL RECIBO
						SET @fechaVence = (SELECT FechaMaximaPago FROM [dbo].[Recibo] R
										   INNER JOIN @ReciboPagar idRP ON idRP.idRecibo = R.id
										   WHERE @inRecibo = idRP.id)
						--SI LA FECHA EN LA QUE VENCE ES MENOR A LA FECHA EN LA QUE SE ESTA PAGANDO EL RECIBO
						IF @fechaVence < @fechaOperacion
						BEGIN
							--SACA LA TASA MORATORIA DE ESE RECIBO
							SET @tasaMoratoria = (SELECT CC.TasaInteresMoratorio FROM [dbo].[CCobro] CC
													INNER JOIN [dbo].[Recibo] AS R ON R.IdCCobro = CC.ID 
													INNER JOIN  @ReciboPagar AS idRP ON idRP.idRecibo = R.id
													WHERE idRP.id = @inRecibo)
							--AQUI CAMBIA EL MONTO MORATORIO YA QUE SI SE DEBE CREAR RECIBO MORATORIO
							SET @montoMoratorio = (@montoRecibo*@tasaMoratoria/365)*ABS(DATEDIFF(day, @fechaVence, @fechaOperacion))
							
							--CREA UN RECIBO TIPO MORATORIO Y LO PAGA
							INSERT INTO [dbo].[Recibo](IdPropiedad,IdCCobro,Monto,Estado,FechaEmision,FechaMaximaPago)
							SELECT @idPropiedad, CC.ID,@montoMoratorio, 1, @fechaOperacion, DATEADD(day, CC.QDiasVencimiento, @fechaOperacion)
							FROM [dbo].[CCobro] AS CC
							WHERE CC.ID = 11
							
							--RELACION ENTRE EL RECIBO MORATORIO PAGADO Y EL COMPROBANTE DE PAGO
							INSERT INTO [dbo].[ReciboPagado](IdComprobante, IdRecibo)
							SELECT @idComprobante, IDENT_CURRENT('[dbo].[Recibo]')	
						END
						
						--SE ACTUALIZA EL MONTO DEL COMPROBANTE DE PAGO
						UPDATE [dbo].[ComprobantePago]
						SET MontoTotal = MontoTotal+@montoRecibo+@montoMoratorio--SI NO HUBO RECIBO MORATORIO SUMA 0 MAS EL MONTO POR LOS DEMAS RECIBOS
						WHERE ID = @idComprobante
						
						SET @inRecibo = @inRecibo+1
					END
					--PRINT @idMenor
					SET @idMenor = @idMenor+1
				END
				
				COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 50003, 'Error: No se ha podido crear los pago.', 1;
		END CATCH

		
	END
GO
/****** Object:  StoredProcedure [dbo].[spProcesaRecibos]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[spProcesaRecibos] @FechaActual DATE
AS 
BEGIN
	
	BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON
			DECLARE @dia int
			SET @dia  = DAY(@FechaActual)
			BEGIN TRAN
				INSERT INTO dbo.Recibo(IdPropiedad,IdCCobro,Monto,Estado,FechaEmision,FechaMaximaPago)
				SELECT
					P.ID,
					CC.ID,
					CASE WHEN (CC.esFijo = 'Si' AND CC.id != 1) THEN CCM.MontoFijo 
					WHEN (CC.esImpuesto = 'Si') THEN P.valor/100*CCI.Valor_Porcentual
					WHEN (CC.id = 1) THEN 
						CASE WHEN (P.M3acumulados - P.M3AcumuladosUltimoRecibo)*CCC.ConsumoM3 > CCC.MontoMinimoRecibo
						THEN (P.M3acumulados - P.M3AcumuladosUltimoRecibo)*CCC.ConsumoM3
						ELSE CCC.montoMinimoRecibo 
						END
					END,
					0,
					@FechaActual,
					DATEADD(day,CC.QDiasVencimiento, @FechaActual)
				FROM [dbo].[CCobro_PNP] CCP 
				INNER JOIN [dbo].[CCobro] CC ON CCP.IdCCobbro = CC.id
				INNER JOIN [dbo].[Propiedad] P ON CCP.idPropiedad = P.id
				FULL OUTER JOIN [dbo].[CCobro_InteresMoratorio] CCI ON CCI.ID = CC.ID
				FULL OUTER JOIN [dbo].[CCobro_ConsumoAgua] CCC ON CCC.id = CC.ID
				FULL OUTER JOIN [dbo].[CCobro_MontoFijo] CCM ON CCM.ID = CC.ID
				WHERE CC.DiaEmisionRecibo = @dia

				UPDATE [dbo].[Propiedad]
				SET M3AcumuladosUltimoRecibo = M3acumulados
				FROM [dbo].[Propiedad] P
				INNER JOIN [dbo].[CCobro_PNP] CCP ON CCP.IdPropiedad = P.id
				INNER JOIN [dbo].[CCobro] CC ON CC.ID = CCP.IdCCobbro
				WHERE CC.id = 1 AND CC.DiaEmisionRecibo = @dia AND P.M3AcumuladosUltimoRecibo != P.M3acumulados
			COMMIT
		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 50004,'Error: No se ha podido generar los recibos',1;
		END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[spProcesarPagosUsuario]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spProcesarPagosUsuario] @jsonRecibos varchar(MAX) -- [{"id":45},{"id":8}]
AS 
	BEGIN 
		BEGIN TRY 
		SET NOCOUNT ON 
		SET XACT_ABORT ON  
			
			
			--Variables para actualizaciones e inserts
			DECLARE @idMenor INT, 
					@idMayor INT, 
					@FechaMaxPago DATE, 
					@fechaOperacion DATE, 
					@montoMoratorio MONEY, 
					@tasaMoratoria FLOAT, 
					@montoRecibo MONEY, 
					@tipoCC int, 
					@idPropiedad INT;
			
			DECLARE @IdRecibosPagar TABLE
			(
				ID INT PRIMARY KEY
			);

			Declare @PagosHoy TABLE
			(
				sec INT PRIMARY KEY,
				NumFinca INT,
				TipoRecibo INT,
				Fecha DATE
			);

			INSERT INTO dbo.IdRecibosPorPagar(sec)
			SELECT id
			FROM OPENJSON (@jsonRecibos)
			WITH(
				id int '$.id'
			);

			
			--Obtenemos las id para iterar sobre los recibos por pagar desde la pagina del usuario
			SELECT @idMenor = MIN(RP.sec), @idMayor = MAX(RP.sec)
			FROM dbo.IdRecibosPorPagar as RP
			
			BEGIN TRAN
				WHILE @idMenor<=@idMayor--RECORRE LOS RECIBOS
				BEGIN

					SET @montoMoratorio = 0 --MONTO MORATORIO SE CAMBIA SI ES QUE HAY RECIBO MORATORIO, SINO ES 0

					SET @FechaOperacion =  GETDATE()

					SET @idPropiedad = (SELECT R.ID FROM [Recibo] R 
										INNER JOIN IdRecibosPorPagar idRP ON idRP.sec = R.ID
										WHERE @idMenor = idRP.sec		
									    )
					
					
					SET @FechaMaxPago = (SELECT R.FechaMaximaPago FROM [dbo].[Recibo] R
										 INNER JOIN dbo.IdRecibosPorPagar idRP ON idRP.sec = R.id
										 WHERE idRP.sec = @idMenor AND R.Estado = 0);
											
					SET @montoRecibo = (SELECT R.Monto FROM [dbo].[Recibo] R
										INNER JOIN dbo.IdRecibosPorPagar idRP ON R.id = idRP.sec
										WHERE idRP.sec = @idMenor);

					--Se crean intereses moratorios para aquellos que se pasaron de la fecha
					IF @FechaMaxPago < @FechaOperacion
					BEGIN
						--SACA LA TASA MORATORIA DEL RECIBO
						SET @tasaMoratoria = (	SELECT CC.TasaInteresMoratorio FROM [dbo].[CCobro] CC
												INNER JOIN [dbo].[Recibo] AS R ON R.IdCCobro = CC.ID 
												INNER JOIN  dbo.IdRecibosPorPagar AS RP ON Rp.sec = R.id
												WHERE Rp.sec = @idMenor
											  );

						--AQUI CAMBIA EL MONTO MORATORIO YA QUE SI SE DEBE CREAR RECIBO MORATORIO
						SET @montoMoratorio = (@montoRecibo * @tasaMoratoria/ 365) * ABS( DATEDIFF(d, @FechaMaxPago, @FechaOperacion) )
						
						
						--CREA UN RECIBO TIPO MORATORIO Y LO ESTABLECE COMO PENDIENTE
						INSERT INTO [dbo].[Recibo](IdPropiedad,IdCCobro,Monto,Estado,FechaEmision,FechaMaximaPago)
						SELECT	@idPropiedad, 
								CC.ID,
								@montoMoratorio, 
								0, --Estado pendiente
								@FechaOperacion, 
								DATEADD(day, CC.QDiasVencimiento, @FechaOperacion)
						FROM [dbo].[CCobro] AS CC
						WHERE CC.ID = 11 --Recibo de Agua
						
						--GUARDA ADEMAS LOS RECIBOS MORATORIOS A PAGAR
						INSERT INTO IdRecibosPorPagar(sec)
						SELECT IDENT_CURRENT('[dbo].[Recibo]')
						
						
					END
					
					SET @idMenor += 1
				END
			
			--HACER SP PARA ESTE PROCESO
			
			SELECT R.ID, CC.Nombre, R.Monto
			FROM Recibo AS R
			INNER JOIN IdRecibosPorPagar RP ON R.id = RP.sec
			INNER JOIN CCobro AS CC ON R.IdCCobro = CC.ID
			--REVISAR PORQUE HAY PROPIEDADES MALAS

			
			COMMIT

		END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 50003, 'No se ha podido crear los pago.', 1;
		END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spReconexionAgua]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[spReconexionAgua] @FechaActual DATE AS  	
	BEGIN
		BEGIN TRY
			DECLARE @idPropiedades TABLE(id INT IDENTITY(1,1),IdPropiedad int)
			DECLARE @idMenor INT, @idMayor INT, @idc INT, @cant INT
			BEGIN TRAN
				INSERT INTO @idPropiedades(idPropiedad)
				SELECT DISTINCT R.IdPropiedad
				FROM Recibo AS R
				WHERE 1 = ALL(SELECT estado FROM Recibo WHERE IdPropiedad = R.IdPropiedad)
				AND NOT EXISTS(SELECT * FROM Reconexion WHERE IdPropiedad = R.IdPropiedad)
				AND EXISTS(SELECT * FROM Corte WHERE IdPropiedad = R.IdPropiedad)
				AND (R.IdCCobro = 1 OR R.IdCCobro = 10)
				SELECT @idMenor = MIN(id), @idMayor = MAX(id) FROM @idPropiedades
				WHILE @idMenor<=@idMayor
				BEGIN
					INSERT INTO Reconexion(IdPropiedad,IdReciboReconexion, Fecha)
					SELECT idP.idPropiedad, R.id, @FechaActual
					FROM @idPropiedades idP
					INNER JOIN Recibo AS R ON R.IdPropiedad = idP.idPropiedad
					WHERE idP.id = @idMenor AND R.IdCCobro = 10
					SET @idMenor = @idMenor+1
				END
				
			COMMIT
		END TRY
		BEGIN CATCH
			If 
			@@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 50003,'Error: No se ha podido reconectar',1;
		END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[spValidarUsuario]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- SP para verificar usuarios

Create     procedure [dbo].[spValidarUsuario]
(      
   @Nombre varchar(100),
   @Password varchar(100)
)      
as       
begin      
   Select ID, Nombre, Password, TipoUsuario 
   from [dbo].Usuario where Nombre=@Nombre and Password=@Password and EstaBorrado=0
End
GO
/****** Object:  StoredProcedure [dbo].[spVerBitacora]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[spVerBitacora]
(      
   @ID int      
)      
as       
begin      
   Select ID, insertedAt, insertedBy, insertedIn, IdEntityType, EntityId, jsonAntes, jsonDespues
   from [dbo].BitacoraCambios where ID=@ID     
End
 
GO
/****** Object:  StoredProcedure [dbo].[spVerPropiedad]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create     procedure [dbo].[spVerPropiedad]
(      
   @ID int      
)      
as       
begin      
   Select ID, NumFinca, Valor, Direccion 
   from [dbo].Propiedad where ID=@ID     
End

GO
/****** Object:  StoredProcedure [dbo].[spVerPropietario]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create     procedure [dbo].[spVerPropietario]     
(      
   @ID int      
)      
as       
begin      
   Select ID, Nombre, IdTipoDocumento, ValorDocumento 
   from [dbo].Propietario where ID=@ID  and EstaBorrado = 0
End

GO
/****** Object:  StoredProcedure [dbo].[spVerPropietario_Jud]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [dbo].[spVerPropietario_Jud]     
(      
   @ID int      
)      
as       
begin
	If @id is NULL
	BEGIN
		Return -1
	END
	Select ID, NombrePersonaResponsable, IdTipoDocumento, ValorDocumento 
	from [dbo].PropietarioJuridico where ID=@ID  and EstaBorrado = 0
End

GO
/****** Object:  StoredProcedure [dbo].[spVerReciboPedePropiedad]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[spVerReciboPedePropiedad] @id int, @estado int as 	
	BEGIN
	BEGIN TRY
		SELECT R.ID, R.FechaEmision, R.FechaMaximaPago, P.NumFinca, CC.Nombre, R.Monto, R.IdPropiedad
		FROM Recibo AS R
		INNER JOIN CCobro AS CC ON R.IdCCobro = CC.ID
		INNER JOIN Propiedad AS P ON R.IdPropiedad = P.ID
		WHERE R.Estado=@estado AND @id=R.ID
		ORDER BY R.FechaEmision DESC
	END TRY
	BEGIN CATCH
	If @@TRANCOUNT > 0 
		ROLLBACK TRAN;
		THROW 60001,'Error: No se ha podido buscar Recibo',1;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[spVerUsuario]    Script Date: 5/8/2020 04:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create     procedure [dbo].[spVerUsuario]
(      
   @ID int      
)      
as       
begin      
   Select ID, Nombre, Password, TipoUsuario
   from [dbo].Usuario where ID=@ID     
End
GO
