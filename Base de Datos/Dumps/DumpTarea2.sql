USE [FacturacionMunicipal]
GO
/****** Object:  Table [dbo].[BitacoraCambios]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Create or Alter TABLE [dbo].[BitacoraCambios](
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
****** Object:  Table [dbo].[CCobro]    Script Date: 6/7/2020 17:21:44 ******
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TABLE [dbo].[CCobro](
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
****** Object:  Table [dbo].[CCobro_ConsumoAgua]    Script Date: 6/7/2020 17:21:44 ******
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TABLE [dbo].[CCobro_ConsumoAgua](
	[ID] [int] NOT NULL,
	[ConsumoM3] [int] NOT NULL,
	[MontoMinimoRecibo] [int] NOT NULL,
 CONSTRAINT [PK_CC Consumo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
****** Object:  Table [dbo].[CCobro_InteresMoratorio]    Script Date: 6/7/2020 17:21:44 ******
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TABLE [dbo].[CCobro_InteresMoratorio](
	[ID] [int] NOT NULL,
	[Valor_Porcentual] [float] NOT NULL,
 CONSTRAINT [PK_CC Porcentaje] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
****** Object:  Table [dbo].[CCobro_MontoFijo]    Script Date: 6/7/2020 17:21:44 ******
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TABLE [dbo].[CCobro_MontoFijo](
	[ID] [int] NOT NULL,
	[MontoFijo] [money] NOT NULL,
 CONSTRAINT [PK_CC Fijo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCobro_PNP]    Script Date: 6/7/2020 17:21:44 ******
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TABLE [dbo].[CCobro_PNP](
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
****** Object:  Table [dbo].[ComprobantePago]    Script Date: 6/7/2020 17:21:44 ******
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TABLE [dbo].[ComprobantePago](
	[ID] [int] NOT NULL,
	[FechaPago] [datetime] NOT NULL,
	[MontoTotal] [money] NOT NULL,
 CONSTRAINT [PK_ComprobantePago] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
****** Object:  Table [dbo].[Corte]    Script Date: 6/7/2020 17:21:44 ******
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TABLE [dbo].[Corte](
	[ID] [int] NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[IdReciboReconexion] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Corte] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
****** Object:  Table [dbo].[EntityType]    Script Date: 6/7/2020 17:21:44 ******
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TABLE [dbo].[EntityType](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EntityType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
****** Object:  Table [dbo].[MovimientoConsumo]    Script Date: 6/7/2020 17:21:44 ******
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TABLE [dbo].[MovimientoConsumo](
	[ID] [int] NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[IdTipoMovimiento] [int] NOT NULL,
	[FechaMov] [datetime] NOT NULL,
	[MontoM3] [money] NOT NULL,
	[LecturaConsumo] [int] NOT NULL,
	[NuevoM3Consumo] [int] NOT NULL,
 CONSTRAINT [PK_MovimientoConsumo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
****** Object:  Table [dbo].[Prop_Prop]    Script Date: 6/7/2020 17:21:44 ******
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TABLE [dbo].[Prop_Prop](
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
****** Object:  Table [dbo].[Propiedad]    Script Date: 6/7/2020 17:21:44 ******
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TABLE [dbo].[Propiedad](
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
****** Object:  Table [dbo].[Propietario]    Script Date: 6/7/2020 17:21:44 ******
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TABLE [dbo].[Propietario](
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
****** Object:  Table [dbo].[PropietarioJuridico]    Script Date: 6/7/2020 17:21:44 ******
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TABLE [dbo].[PropietarioJuridico](
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
****** Object:  Table [dbo].[Recibo]    Script Date: 6/7/2020 17:21:44 ******
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TABLE [dbo].[Recibo](
	[ID] [int] NOT NULL,
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
****** Object:  Table [dbo].[ReciboPagado]    Script Date: 6/7/2020 17:21:44 ******
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TABLE [dbo].[ReciboPagado](
	[ID] [int] NOT NULL,
	[IdRecibo] [int] NOT NULL,
	[IdComprobante] [int] NOT NULL,
 CONSTRAINT [PK_ReciboPagado] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
****** Object:  Table [dbo].[ReciboReconexion]    Script Date: 6/7/2020 17:21:44 ******
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TABLE [dbo].[ReciboReconexion](
	[ID] [int] NOT NULL,
 CONSTRAINT [PK_ReciboReconexion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
****** Object:  Table [dbo].[Reconexion]    Script Date: 6/7/2020 17:21:44 ******
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TABLE [dbo].[Reconexion](
	[ID] [int] NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[IdReciboReconexion] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Reconexion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
****** Object:  Table [dbo].[TipoDocumentoId]    Script Date: 6/7/2020 17:21:44 ******
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TABLE [dbo].[TipoDocumentoId](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoDocumentoId] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 6/7/2020 17:21:44 ******
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TABLE [dbo].[TipoMovimiento](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TipoMovimiento] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
****** Object:  Table [dbo].[Usuario]    Script Date: 6/7/2020 17:21:44 ******
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TABLE [dbo].[Usuario](
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
****** Object:  Table [dbo].[Usuario_Prop]    Script Date: 6/7/2020 17:21:44 ******
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create TABLE [dbo].[Usuario_Prop](
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
ALTER TABLE [dbo].[Usuario_Prop] CHECK CONSTRAINT [FK_Usuario_Prop_Usuario]*/*/
GO
/****** Object:  StoredProcedure [dbo].[IniciarSimulacion]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   PROCEDURE [dbo].[IniciarSimulacion]
AS
BEGIN
	EXEC ReiniciarTablas
	EXEC spCargarDatos
	EXEC spCargarDatosAdmin
	EXEC spCargarDatosCC
	EXEC Simulacion
END
GO
/****** Object:  StoredProcedure [dbo].[ReiniciarTablas]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   PROCEDURE [dbo].[ReiniciarTablas]
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [FacturacionMunicipal].[dbo].[CCobro_MontoFijo]

	DELETE FROM [FacturacionMunicipal].[dbo].[CCobro_ConsumoAgua]

	DELETE FROM [FacturacionMunicipal].[dbo].[CCobro_InteresMoratorio]

	DELETE FROM [FacturacionMunicipal].[dbo].[CCobro_PNP]

	DELETE FROM [FacturacionMunicipal].[dbo].[CCobro]

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

	DELETE FROM [FacturacionMunicipal].[dbo].[TipoDocumentoId]

END
GO
/****** Object:  StoredProcedure [dbo].[Simulacion]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create or Alter   PROCEDURE [dbo].[Simulacion]
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
	)

	Declare @Propietarios table 
	(
	   sec int identity(1,1) primary key, 
	   TipoDocId int, 
	   Nombre varchar(100),
	   ValorDocId varchar(100),
	   EstaBorrado bit
	)

	Declare @PropJuridico table
	(
		sec int identity(1,1) primary key,
		DocIdPersonaJuridica varchar(100),
		NombrePersonaResponsable varchar(100),
		IdTipoDocumento int,
		ValorDocumento varchar(100),
		EstaBorrado bit
	)

	Declare @PropiedadVsPropietario table
	(
		sec int identity(1,1) primary key, 
		IdPropiedad varchar(100),
		IdPropietario varchar(100),
		EstaBorrado bit
	)

	Declare @PropiedadesxCCobro table
	(
		sec int identity(1,1) primary key,
		IdCCobro int,
		IdPropiedad int, 
		FechaInic date,
		FechaFin date
	)

	Declare @Usuarios table
	(
		sec int identity(1,1) primary key,
		Nombre varchar(100),
		Password varchar(100),
		TipoUsuario varchar(100),
		EstaBorrado bit
	)

	Declare @UsuarioVersusPropiedad table
	(
		sec int identity(1,1) primary key,
		IdPropiedad varchar(100),
		IdUsuario varchar(100),
		EstaBorrado bit
	)

	Declare @FechaOperacion date

	-- se extraen fechas operación
	Declare @FechasAProcesar table 
	(
	   sec int identity(1,1) primary key, 
	   fecha date
	)

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
		SELECT 'Hubo un error de cargar fechas'
	END CATCH
	--parte 3 
	
	--select * from @FechasAProcesar
	-- variables que almacenan valor constante para controlar emision masiva de recibos

	--Declare @IdCCobro_ConsumoAgua=1, @IdCCobro_PatenteCantina=7   -- Son ids con valores solo de ejemplo

	-- Variables para controlar la iteración
	declare @Lo1 int, @Hi1 int, @Lo2 int, @Hi2 int
	declare @minfecha datetime, @maxfecha datetime 

	-- iterando de la fecha más antigua a la menos antigua

	Select @minfecha=min(F.fecha), @maxfecha=max(F.fecha)  -- min y max son funciones agregadas
	from @FechasAProcesar F

	select @Lo1=F.sec
	from @FechasAProcesar F
	where F.Fecha=@minfecha

	select @Hi1=F.sec
	from @FechasAProcesar F
	where F.Fecha=@maxfecha

	--parte4
	-- iteramos por fecha
	while @Lo1<=@Hi1
	Begin
		Select @FechaOperacion=F.Fecha from @FechasAProcesar F where sec=@Lo1
		
		--DECLARE @fechaOperacionNodo date
		--SET @fechaOperacionNodo = @DocumentoXML.value('(/Operaciones_por_Dia/OperacionDia/@fecha)[1]', 'DATE')--revisar

		-- procesar nodos propiedades
		delete @Propiedades
		insert @Propiedades (NumFinca, Valor, Direccion, EstaBorrado)
		select pd.value('@NumFinca', 'INT')
		, pd.value('@Valor', 'MONEY')
		, pd.value('@Direccion', 'VARCHAR(150)')
		, 0 AS EstaBorrado
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia/Propiedad') AS t(pd)
		where @DocumentoXML.value('(/Operaciones_por_Dia/OperacionDia/@fecha)[1]', 'DATE') = @FechaOperacion 

		-- iteramos en propiedades
		Select @Lo2=min(sec), @Hi2=max(sec) 
		from @Propiedades
		while @Lo2<=@Hi2
		Begin
		   insert dbo.Propiedad(NumFinca, Valor, Direccion, EstaBorrado)
		   Select Pd.NumFinca, Pd.Valor, Pd.Direccion, Pd.EstaBorrado 
		   from @Propiedades Pd where sec=@Lo2
		   Set @Lo2=@Lo2+1
		end
		
		-- procesar nodos propietario
		delete @Propietarios  
		insert @Propietarios (TipoDocId, Nombre, ValorDocId, EstaBorrado)
		select pt.value('@TipoDocIdentidad','INT')
		, pt.value('@Nombre', 'VARCHAR(100)')
		, pt.value('@identificacion', 'VARCHAR(100)')
		, 0 AS EstaBorrado
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia/Propietario') AS t(pt)
		where @DocumentoXML.value('(/Operaciones_por_Dia/OperacionDia/@fecha)[1]', 'DATE') = @FechaOperacion 
		

		-- iteramos en propietarios
		Select @Lo2=min(sec), @Hi2=max(sec)
		from @Propietarios
		while @Lo2<=@Hi2
		Begin
		   insert dbo.Propietario(IdTipoDocumento, Nombre, ValorDocumento, EstaBorrado)
		   Select P.TipoDocId, P.Nombre, P.ValorDocId, P.EstaBorrado 
		   from @Propietarios P where sec=@Lo2
		   Set @Lo2=@Lo2+1
		end

		--Propietarios Juridicos 
		-- procesar nodos propietarios juridicos
		delete @PropJuridico 
		insert @PropJuridico(DocIdPersonaJuridica, NombrePersonaResponsable, IdTipoDocumento, ValorDocumento, EstaBorrado)
		select --ID VALUE
		  pd.value('@docidPersonaJuridica', 'VARCHAR(100)')
		, pd.value('@Nombre', 'VARCHAR(100)')
		, pd.value('@TipDocIdRepresentante', 'INT')
		, pd.value('@DocidRepresentante', 'VARCHAR(100)')
		, 0 AS EstaBorrado
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia/PersonaJuridica') AS t(pd)
		where @DocumentoXML.value('(/Operaciones_por_Dia/OperacionDia/@fecha)[1]', 'DATE') = @FechaOperacion 

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
		end

		--Propietarios x Propiedades
		-- procesar nodos PropietarioxPropiedad
		delete @PropiedadVsPropietario
		insert @PropiedadVsPropietario (IdPropiedad, IdPropietario, EstaBorrado)
		select pp.value('@NumFinca', 'VARCHAR(100)')
		, pp.value('@identificacion', 'VARCHAR(100)')
		, 0 AS EstaBorrado
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia/PropiedadVersusPropietario') AS t(pp)
		where @DocumentoXML.value('(/Operaciones_por_Dia/OperacionDia/@fecha)[1]', 'DATE') = @FechaOperacion

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
		end

		--insertamos Usuarios
		delete @Usuarios
		insert @Usuarios (Nombre, Password, TipoUsuario, EstaBorrado)-- rultimo atributo 
		select u.value('@Nombre','VARCHAR(100)')
		, u.value('@password', 'VARCHAR(100)')
		, 'Normal' AS TipoUsuario
		, 0 AS EstaBorrado
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia/Usuario') AS t(u)
		where @DocumentoXML.value('(/Operaciones_por_Dia/OperacionDia/@fecha)[1]', 'DATE') = @FechaOperacion

		-- iteramos en Usuarios
		Select @Lo2=min(sec), @Hi2=max(sec)
		from @Usuarios
		while @Lo2<=@Hi2
		Begin
		   insert dbo.Usuario(Nombre, Password, TipoUsuario ,EstaBorrado)
		   Select U.Nombre, U.Password, U.TipoUsuario, U.EstaBorrado from @Usuarios U where sec=@Lo2
		   Set @Lo2=@Lo2+1
		end

		--CCobros x Propiedad
		--procesar nodos CCobroVsPropiedad
		delete @PropiedadesxCCobro 
		insert @PropiedadesxCCobro (IdCCobro, IdPropiedad, FechaInic)-- revisar ultimo atributo 
		select pc.value('@idcobro','INT') --buscar el id de ese valor
		, pc.value('@NumFinca', 'INT') --buscar el id de ese valor
		, @DocumentoXML.value('(/Operaciones_por_Dia/OperacionDia/@fecha)[1]', 'DATE') as FechaInic --error carga solo la primera fecha
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia/ConceptoCobroVersusPropiedad') AS t(pc)
		where @DocumentoXML.value('(/Operaciones_por_Dia/OperacionDia/@fecha)[1]', 'DATE') = @FechaOperacion

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
		end
		
		--Usuarios Versus Propiedad
		--procesamos nodos UsuarioVersusPropiedad
		delete @UsuarioVersusPropiedad
		insert @UsuarioVersusPropiedad (IdPropiedad, IdUsuario, EstaBorrado)
		select up.value('@NumFinca', 'VARCHAR(100)')
		, up.value('@nombreUsuario', 'VARCHAR(100)')
		, 0 as EstaBorrado
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia/UsuarioVersusPropiedad') AS t(up)
		where @DocumentoXML.value('(/Operaciones_por_Dia/OperacionDia/@fecha)[1]', 'DATE') = @FechaOperacion
		
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
		end

		set @Lo1 = @Lo1 + 1
		
	end

end
GO
/****** Object:  StoredProcedure [dbo].[spBorradoLogPropiedad]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter   PROCEDURE [dbo].[spBorradoLogPropiedad]
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
/****** Object:  StoredProcedure [dbo].[spBorradoLogPropiedad_Propietario]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create or Alter   PROCEDURE [dbo].[spBorradoLogPropiedad_Propietario]
	@ID int
AS 
BEGIN 
	UPDATE dbo.Prop_Prop
	SET EstaBorrado=1
	WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spBorradoLogPropiedad_Usuario]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SP para eliminar las propiedades de Usuarios 

Create or Alter   PROCEDURE [dbo].[spBorradoLogPropiedad_Usuario]
	@ID int
AS 
BEGIN 
	UPDATE dbo.Usuario_Prop
	SET EstaBorrado=1
	WHERE ID = @ID
END 
GO
/****** Object:  StoredProcedure [dbo].[spBorradoLogPropietario]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   PROCEDURE [dbo].[spBorradoLogPropietario]
(
	@ID int
)
AS 
BEGIN 
	UPDATE dbo.Propietario
	SET EstaBorrado=1
	WHERE ID = @ID
END 
GO
/****** Object:  StoredProcedure [dbo].[spBorradoLogPropietario_Jud]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   PROCEDURE [dbo].[spBorradoLogPropietario_Jud]
@ID int
AS 
BEGIN 
	UPDATE dbo.PropietarioJuridico
	SET EstaBorrado=1
	WHERE ID = @ID
END 

GO
/****** Object:  StoredProcedure [dbo].[spBorradoLogPropietario_Propiedad]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   PROCEDURE [dbo].[spBorradoLogPropietario_Propiedad]
	@ID int
AS 
BEGIN 
	UPDATE dbo.Prop_Prop
	SET EstaBorrado=1
	WHERE ID = @ID
END 

GO
/****** Object:  StoredProcedure [dbo].[spBorradoLogUsuario]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter   PROCEDURE [dbo].[spBorradoLogUsuario]
(
	@ID int
)
AS 
BEGIN 
	UPDATE dbo.Usuario
	SET EstaBorrado=1
	WHERE ID = @ID
END 
GO
/****** Object:  StoredProcedure [dbo].[spBorradoLogUsuario_Propiedad]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   PROCEDURE [dbo].[spBorradoLogUsuario_Propiedad]
	@ID int
AS 
BEGIN 
	UPDATE dbo.Usuario_Prop
	SET EstaBorrado=1
	WHERE ID = @ID 
END 

GO
/****** Object:  StoredProcedure [dbo].[spCargarDatos]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   PROCEDURE [dbo].[spCargarDatos]

AS
BEGIN
	SET NOCOUNT ON;

	-- VARIABLES --
	DECLARE @DocHandle int, @temp xml, @TipoDocumento xml, @CCobro xml
	
	DECLARE @TiposDocumentos TABLE
	(
		codigoDoc int,
		descripcion varchar(100)
	)
	BEGIN TRY
		--Insercion de los tipos de documentos de identificacion
		SELECT @TipoDocumento = TD
		FROM OPENROWSET (Bulk 'D:\Base de datos\FacturacionMunicipal_BD\Base de Datos\XML\TipoDocumentoIdentidad.xml', Single_BLOB) AS TipoDocumento(TD)

		INSERT INTO TipoDocumentoId(ID, Nombre)
		SELECT td.value('@codigoDoc', 'VARCHAR(10)')
		, td.value('@descripcion', 'VARCHAR(100)')
		FROM @TipoDocumento.nodes('/TipoDocIdentidad/TipoDocId') AS t(td)

	END TRY

	BEGIN CATCH
		return @@ERROR * -1
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spCargarDatosAdmin]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   PROCEDURE [dbo].[spCargarDatosAdmin]

AS
BEGIN
    SET NOCOUNT ON;

    -- VARIABLES --
    DECLARE @Usuario XML

    BEGIN TRY
        --Insercion de los tipos de documentos de identificacion
        SELECT @Usuario = U
        FROM OPENROWSET (Bulk 'D:\Base de datos\FacturacionMunicipal_BD\Base de Datos\XML\Administradores.xml', Single_BLOB) AS Usuario(U)

        INSERT INTO Usuario (Nombre, Password, TipoUsuario, EstaBorrado)
        SELECT u.value('@user','VARCHAR(100)') AS Nombre
            , u.value('@password','VARCHAR(100)') AS Password
            , 'Administrador' AS TipoUsuario
            , 0 AS EstaBorrado
        FROM @Usuario.nodes('/Administrador/UsuarioAdmi') AS t(u); 

    END TRY

    BEGIN CATCH
        return @@ERROR * -1
    END CATCH
 END
GO
/****** Object:  StoredProcedure [dbo].[spCargarDatosCC]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   PROCEDURE [dbo].[spCargarDatosCC]
AS
BEGIN
    SET NOCOUNT ON;

    -- VARIABLES --
    DECLARE @CCobro xml, @Monto MONEY, @ValorM3 MONEY, @ValorPorcentaje REAL

    BEGIN TRY
        --Insercion de los tipos de documentos de identificacion
        SELECT @CCobro = CC
        FROM OPENROWSET (Bulk 'D:\Base de datos\FacturacionMunicipal_BD\Base de Datos\XML\Concepto_de_Cobro.xml', Single_BLOB) AS CCobro(CC)

        INSERT INTO CCobro (ID, Nombre, TasaInteresMoratorio, DiaEmisionRecibo, QDiasVencimiento, EsImpuesto, EsRecurrente, EsFijo, TipoCC, Activo)
        SELECT c.value('@id','INT') AS ID
            , c.value('@Nombre','VARCHAR(100)') AS Nombre
            , c.value('@TasaInteresMoratoria','DECIMAL(10,2)') AS TasaInteresMoratorio
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
				, cca.value('@ValorM3','REAL') AS ConsumoM3
			FROM @CCobro.nodes('/Conceptos_de_Cobro/conceptocobro') AS t(cca)
		)
		INSERT INTO CCobro_ConsumoAgua(ID, ConsumoM3)
		SELECT ID, ConsumoM3 FROM ca
		WHERE ca.ConsumoM3 > 0;

    END TRY

    BEGIN CATCH
        return @@ERROR * -1
    END CATCH
 END
GO
/****** Object:  StoredProcedure [dbo].[spCreatePropiedad_Propietario]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   procedure [dbo].[spCreatePropiedad_Propietario]
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
	SET @idModified = (SELECT [ID] FROM [dbo].[Prop_Prop] WHERE [IdPropietario] = @idPropietario and [IdPropiedad] = @idPropiedad)
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
/****** Object:  StoredProcedure [dbo].[spCreatePropiedad_Usuario]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- SP para crear enlaces entre propiedades y usuarios

Create or Alter   procedure [dbo].[spCreatePropiedad_Usuario]
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
/****** Object:  StoredProcedure [dbo].[spEditarPropiedad]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   procedure [dbo].[spEditarPropiedad] 
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
/****** Object:  StoredProcedure [dbo].[spEditarPropietario]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   procedure [dbo].[spEditarPropietario]  
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
/****** Object:  StoredProcedure [dbo].[spEditarPropietario_Jud]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   procedure [dbo].[spEditarPropietario_Jud]  
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
   declare @jsonAntes varchar(500), @jsonDespues varchar(500), @idModified int, @insertedAt DATETIME
   SET @insertedAt = GETDATE()
   SET @idModified = (SELECT [ID] FROM [dbo].[PropietarioJuridico] WHERE [ID] = @id)
   -- Se crea el primer JSON
   SET @jsonAntes = (SELECT [ID], [NombrePersonaResponsable], [IdTipoDocumento], [ValorDocumento]
   FROM [dbo].[PropietarioJuridico] WHERE [ID] = @id
   FOR JSON PATH)
   Update [dbo].PropietarioJuridico
   set NombrePersonaResponsable=@Nombre, IdTipoDocumento=@IdTipoDocumento, ValorDocumento=@ValorDocumento
   where ID=@id and EstaBorrado = 0   
   -- Se crea el segundo JSON
   SET @jsonDespues = (SELECT [ID], [NombrePersonaResponsable], [IdTipoDocumento], [ValorDocumento]
   FROM [dbo].[PropietarioJuridico] WHERE [ID] = @id
   FOR JSON PATH)
   EXEC [dbo].spInsertarBitacoraCambios @inIdEntityType = 6,
										@inEntityID = @idModified, 
										@inJsonAntes = @jsonAntes,
										@inJsonDespues = @jsonDespues, 
										@inInsertedBy = @UsuarioACargo, 
										@inInsertedIn = @IPusuario, 
										@inInsertedAt = @insertedAt
End

GO
/****** Object:  StoredProcedure [dbo].[spEditarUsuario]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   procedure [dbo].[spEditarUsuario]
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
End

GO
/****** Object:  StoredProcedure [dbo].[spInsertarPropiedad]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   procedure [dbo].[spInsertarPropiedad]
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
/****** Object:  StoredProcedure [dbo].[spInsertarPropietario]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter   procedure [dbo].[spInsertarPropietario]
(
	@Nombre VARCHAR(100),
	@IdTipoDocumento int,
	@ValorDocumento VARCHAR(30),
	@UsuarioACargo varchar(20), 
	@IPusuario varchar(20)
)
as
Begin
	declare @jsonDespues varchar(500), @idModified int, @insertedAt DATETIME
	Insert into [dbo].Propietario (Nombre, IdTipoDocumento, ValorDocumento, FechaIngreso, EstaBorrado)
	Values (@Nombre, @IdTipoDocumento, @ValorDocumento, CONVERT(DATE,GETDATE()), 0)
	select ID from Propietario where @Nombre=Nombre and @IdTipoDocumento=IdTipoDocumento and @ValorDocumento=ValorDocumento and 0=EstaBorrado
	
	SET @jsonDespues = (SELECT [ID], [Nombre], [IdTipoDocumento], [ValorDocumento], [FechaIngreso]
	FROM [dbo].Propietario WHERE [nombre] = @Nombre and [ValorDocumento] = @ValorDocumento
	FOR JSON PATH)
	SET @idModified = (SELECT [ID] FROM [dbo].[Propietario] WHERE [Nombre] = @Nombre and [ValorDocumento] = @ValorDocumento)
	SET @insertedAt = CONVERT(DATETIME, GETDATE())
	EXEC [dbo].[spInsertarBitacoraCambios] @inIdEntityType = 2,
										 @inEntityID = @idModified, 
										 @inJsonAntes = NULL,
										 @inJsonDespues = @jsonDespues, 
										 @inInsertedBy = @UsuarioACargo, 
										 @inInsertedIn = @IPusuario, 
										 @inInsertedAt = @insertedAt
End
GO
/****** Object:  StoredProcedure [dbo].[spInsertarPropietario_Jud]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--SPs para el CRUD de Propietarios Juridicos

Create or Alter   procedure [dbo].[spInsertarPropietario_Jud]
(
	@id int,
	@Nombre VARCHAR(100),
	@IdTipoDocumento int,
	@ValorDocumento VARCHAR(30),
	@UsuarioACargo varchar(20), 
	@IPusuario varchar(20)
)
as
Begin
	declare @jsonDespues varchar(500), @idModified int, @insertedAt DATETIME
	Insert into [dbo].PropietarioJuridico (ID, NombrePersonaResponsable, IdTipoDocumento, ValorDocumento, EstaBorrado)
	Values (@id, @Nombre, @IdTipoDocumento, @ValorDocumento, 0)
	select ID
	from PropietarioJuridico
	SET @jsonDespues = (SELECT [ID], [NombrePersonaResponsable], [IdTipoDocumento], [ValorDocumento]
	FROM [dbo].[PropietarioJuridico] WHERE [NombrePersonaResponsable] = @Nombre and [ValorDocumento] = @ValorDocumento
	FOR JSON PATH)
	SET @idModified = (SELECT [ID] FROM [dbo].[PropietarioJuridico] WHERE [NombrePersonaResponsable] = @Nombre and [ValorDocumento] = @ValorDocumento)
	SET @insertedAt = CONVERT(DATETIME, GETDATE())
	EXEC [dbo].[spInsertarBitacoraCambios] @inIdEntityType = 6,
										 @inEntityID = @idModified, 
										 @inJsonAntes = NULL,
										 @inJsonDespues = @jsonDespues, 
										 @inInsertedBy = @UsuarioACargo, 
										 @inInsertedIn = @IPusuario, 
										 @inInsertedAt = @insertedAt
End

GO
/****** Object:  StoredProcedure [dbo].[spInsertarUsuario]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter procedure [dbo].[spInsertarUsuario]
(
	@Nombre VARCHAR(150),
	@Password VARCHAR(150),
	@TipoUsuario VARCHAR(150), 
	@UsuarioACargo varchar(20), 
	@IPusuario varchar(20)
)
as
Begin
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
	
End
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPropiedades]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter   procedure [dbo].[spObtenerPropiedades]
as
Begin
	select ID, NumFinca, Valor, Direccion 
	from [dbo].Propiedad
	where EstaBorrado = 0
End
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPropiedades_Propietarios]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter   procedure [dbo].[spObtenerPropiedades_Propietarios]
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
/****** Object:  StoredProcedure [dbo].[spObtenerPropiedades_Propietarios_Ingresado]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   procedure [dbo].[spObtenerPropiedades_Propietarios_Ingresado]
	@ingresado varchar(100)
as
	SELECT Prop_Prop.ID, Propiedad.NumFinca, Propiedad.Valor, Propiedad.Direccion
	FROM Prop_Prop
	INNER JOIN Propiedad ON Prop_Prop.IdPropiedad=Propiedad.ID
	INNER JOIN Propietario ON Prop_Prop.IdPropietario=Propietario.ID
	where Propietario.Nombre = @ingresado or Propietario.ValorDocumento = @ingresado and Prop_Prop.EstaBorrado = 0 
	and Propietario.EstaBorrado=0 and Propiedad.EstaBorrado=0
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPropiedades_SinPropietario]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   procedure [dbo].[spObtenerPropiedades_SinPropietario]
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
/****** Object:  StoredProcedure [dbo].[spObtenerPropiedades_SinUsuario]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SP para saber que propiedades no están con el usuario

Create or Alter   procedure [dbo].[spObtenerPropiedades_SinUsuario]
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
/****** Object:  StoredProcedure [dbo].[spObtenerPropiedades_Usuarios]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter   procedure [dbo].[spObtenerPropiedades_Usuarios]
(
	@id int
)
as
	SELECT Usuario_Prop.ID, Propiedad.NumFinca, Propiedad.Valor, Propiedad.Direccion
	FROM Usuario_Prop
	INNER JOIN Propiedad ON Usuario_Prop.IdPropiedad=Propiedad.ID
	INNER JOIN Usuario ON Usuario_Prop.IdUsuario=Usuario.ID
	where Usuario.ID = @id and Usuario_Prop.EstaBorrado = 0 and Usuario.EstaBorrado = 0 and Propiedad.EstaBorrado=0

GO
/****** Object:  StoredProcedure [dbo].[spObtenerPropiedades_Usuarios_PorNombre]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter     procedure [dbo].[spObtenerPropiedades_Usuarios_PorNombre]
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
/****** Object:  StoredProcedure [dbo].[spObtenerPropietario_SinPropiedad]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--SP para saber que propietarios no están con la propiedad

Create or Alter   procedure [dbo].[spObtenerPropietario_SinPropiedad]
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
/****** Object:  StoredProcedure [dbo].[spObtenerPropietarios]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   procedure [dbo].[spObtenerPropietarios]
as
Begin
	select ID, Nombre, IdTipoDocumento, ValorDocumento 
	from [dbo].Propietario
	where EstaBorrado = 0 and EstaBorrado = 0
End
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPropietarios_Propiedades]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   procedure [dbo].[spObtenerPropietarios_Propiedades]
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
/****** Object:  StoredProcedure [dbo].[spObtenerPropietarios_Propiedades_PorFinca]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter     procedure [dbo].[spObtenerPropietarios_Propiedades_PorFinca]
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
/****** Object:  StoredProcedure [dbo].[spObtenerPropietariosJuridicos]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   procedure [dbo].[spObtenerPropietariosJuridicos]
as
Begin
	select P.Nombre, P.IdTipoDocumento, P.ValorDocumento, PJ.IdTipoDocumento, PJ.NombrePersonaResponsable, PJ.ValorDocumento
	from [dbo].PropietarioJuridico PJ inner join [dbo].Propietario P on PJ.ID = P.ID


End
GO
/****** Object:  StoredProcedure [dbo].[spObtenerUsuarios]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter   procedure [dbo].[spObtenerUsuarios]
as
Begin
	select ID, Nombre, Password, TipoUsuario 
	from [dbo].Usuario
	where EstaBorrado = 0 
End
GO
/****** Object:  StoredProcedure [dbo].[spObtenerUsuarios_Propiedades]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   procedure [dbo].[spObtenerUsuarios_Propiedades]
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
/****** Object:  StoredProcedure [dbo].[spObtenerUsuarios_Propiedades_PorFinca]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter     procedure [dbo].[spObtenerUsuarios_Propiedades_PorFinca]
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
/****** Object:  StoredProcedure [dbo].[spObtenerUsuarios_SinPropiedad]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   procedure [dbo].[spObtenerUsuarios_SinPropiedad]
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
/****** Object:  StoredProcedure [dbo].[spValidarUsuario]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- SP para verificar usuarios

Create or Alter   procedure [dbo].[spValidarUsuario]
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
/****** Object:  StoredProcedure [dbo].[spVerPropiedad]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create or Alter   procedure [dbo].[spVerPropiedad]
(      
   @ID int      
)      
as       
begin      
   Select ID, NumFinca, Valor, Direccion 
   from [dbo].Propiedad where ID=@ID     
End

GO
/****** Object:  StoredProcedure [dbo].[spVerPropietario]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   procedure [dbo].[spVerPropietario]     
(      
   @ID int      
)      
as       
begin      
   Select ID, Nombre, IdTipoDocumento, ValorDocumento 
   from [dbo].Propietario where ID=@ID  and EstaBorrado = 0
End

GO
/****** Object:  StoredProcedure [dbo].[spVerPropietario_Jud]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   procedure [dbo].[spVerPropietario_Jud]     
(      
   @ID int      
)      
as       
begin      
   Select ID, NombrePersonaResponsable, IdTipoDocumento, ValorDocumento 
   from [dbo].PropietarioJuridico where ID=@ID  and EstaBorrado = 0
End

GO
/****** Object:  StoredProcedure [dbo].[spVerUsuario]    Script Date: 6/7/2020 17:21:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or Alter   procedure [dbo].[spVerUsuario]
(      
   @ID int      
)      
as       
begin      
   Select ID, Nombre, Password, TipoUsuario
   from [dbo].Usuario where ID=@ID     
End

GO
