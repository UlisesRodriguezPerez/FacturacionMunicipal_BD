USE [master]
GO
/****** Object:  Database [FacturacionMunicipal]    Script Date: 14/7/2020 09:25:21 ******/
CREATE DATABASE [FacturacionMunicipal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FacturacionMunicipal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FacturacionMunicipal.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FacturacionMunicipal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FacturacionMunicipal_log.ldf' , SIZE = 663552KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FacturacionMunicipal] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FacturacionMunicipal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FacturacionMunicipal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FacturacionMunicipal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FacturacionMunicipal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FacturacionMunicipal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FacturacionMunicipal] SET ARITHABORT OFF 
GO
ALTER DATABASE [FacturacionMunicipal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FacturacionMunicipal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FacturacionMunicipal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FacturacionMunicipal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FacturacionMunicipal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FacturacionMunicipal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FacturacionMunicipal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FacturacionMunicipal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FacturacionMunicipal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FacturacionMunicipal] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FacturacionMunicipal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FacturacionMunicipal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FacturacionMunicipal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FacturacionMunicipal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FacturacionMunicipal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FacturacionMunicipal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FacturacionMunicipal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FacturacionMunicipal] SET RECOVERY FULL 
GO
ALTER DATABASE [FacturacionMunicipal] SET  MULTI_USER 
GO
ALTER DATABASE [FacturacionMunicipal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FacturacionMunicipal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FacturacionMunicipal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FacturacionMunicipal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FacturacionMunicipal] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FacturacionMunicipal', N'ON'
GO
ALTER DATABASE [FacturacionMunicipal] SET QUERY_STORE = OFF
GO
USE [FacturacionMunicipal]
GO
/****** Object:  UserDefinedTableType [dbo].[CambioValorPropiedadType]    Script Date: 14/7/2020 09:25:21 ******/
CREATE TYPE [dbo].[CambioValorPropiedadType] AS TABLE(
	[sec] [int] IDENTITY(1,1) NOT NULL,
	[NumFinca] [int] NULL,
	[NuevoValor] [money] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[MovConsumoType]    Script Date: 14/7/2020 09:25:22 ******/
CREATE TYPE [dbo].[MovConsumoType] AS TABLE(
	[sec] [int] IDENTITY(1,1) NOT NULL,
	[NumFinca] [int] NULL,
	[M3] [int] NULL,
	[TipoMov] [int] NULL,
	[Fecha] [date] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[PagosHoyType]    Script Date: 14/7/2020 09:25:22 ******/
CREATE TYPE [dbo].[PagosHoyType] AS TABLE(
	[sec] [int] IDENTITY(1,1) NOT NULL,
	[NumFinca] [int] NULL,
	[TipoRecibo] [int] NULL,
	[Fecha] [date] NULL
)
GO
/****** Object:  Table [dbo].[BitacoraCambios]    Script Date: 14/7/2020 09:25:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCobro]    Script Date: 14/7/2020 09:25:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCobro_ConsumoAgua]    Script Date: 14/7/2020 09:25:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCobro_InteresMoratorio]    Script Date: 14/7/2020 09:25:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCobro_MontoFijo]    Script Date: 14/7/2020 09:25:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCobro_PNP]    Script Date: 14/7/2020 09:25:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComprobantePago]    Script Date: 14/7/2020 09:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComprobantePago](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FechaPago] [datetime] NOT NULL,
	[MontoTotal] [money] NOT NULL,
 CONSTRAINT [PK_ComprobantePago] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Corte]    Script Date: 14/7/2020 09:25:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntityType]    Script Date: 14/7/2020 09:25:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoConsumo]    Script Date: 14/7/2020 09:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoConsumo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdPropiedad] [int] NOT NULL,
	[IdTipoMovimiento] [int] NOT NULL,
	[FechaMov] [datetime] NOT NULL,
	[MontoM3] [money] NOT NULL,
	[LecturaConsumo] [int] NULL,
	[NuevoM3Consumo] [int] NOT NULL,
 CONSTRAINT [PK_MovimientoConsumo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prop_Prop]    Script Date: 14/7/2020 09:25:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propiedad]    Script Date: 14/7/2020 09:25:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Propietario]    Script Date: 14/7/2020 09:25:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropietarioJuridico]    Script Date: 14/7/2020 09:25:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recibo]    Script Date: 14/7/2020 09:25:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReciboPagado]    Script Date: 14/7/2020 09:25:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReciboReconexion]    Script Date: 14/7/2020 09:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReciboReconexion](
	[ID] [int] NOT NULL,
 CONSTRAINT [PK_ReciboReconexion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reconexion]    Script Date: 14/7/2020 09:25:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocumentoId]    Script Date: 14/7/2020 09:25:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 14/7/2020 09:25:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 14/7/2020 09:25:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_Prop]    Script Date: 14/7/2020 09:25:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[Usuario_Prop] CHECK CONSTRAINT [FK_Usuario_Prop_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[IniciarSimulacion]    Script Date: 14/7/2020 09:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[IniciarSimulacion]
AS
BEGIN
	EXEC ReiniciarTablas
	EXEC spCargarDatos
	EXEC spCargarDatosAdmin
	EXEC spCargarDatosCC
	EXEC Simulacion
END

GO
/****** Object:  StoredProcedure [dbo].[ReiniciarTablas]    Script Date: 14/7/2020 09:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[ReiniciarTablas]
AS
BEGIN
	SET NOCOUNT ON;

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

	DELETE FROM [FacturacionMunicipal].[dbo].[Reconexion]
		DBCC CHECKIDENT ('[Reconexion]', RESEED, 0) --para los identity
	
	DELETE FROM [FacturacionMunicipal].[dbo].[EntityType]

	DELETE FROM [FacturacionMunicipal].[dbo].[TipoMovimiento]

	DELETE FROM [FacturacionMunicipal].[dbo].[TipoDocumentoId]

END
GO
/****** Object:  StoredProcedure [dbo].[Simulacion]    Script Date: 14/7/2020 09:25:22 ******/
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
		FechaIngreso date,
		EstaBorrado bit
	)

	Declare @UsuarioVersusPropiedad table
	(
		sec int identity(1,1) primary key,
		IdPropiedad varchar(100),
		IdUsuario varchar(100),
		EstaBorrado bit
	)

	--Tabla para almacenar los cambios en un dia

	Declare @PropiedadCambio CambioValorPropiedadType

	--Tabla variable para almacenar los pagos dia por dia
	Declare @PagosHoy PagosHoyType

	--Tabla para los movimientos de consumo de agua
	Declare @MovConsumo MovConsumoType

	--Fecha para las simulaciones
	Declare @FechaOperacion date

	-- se extraen fechas operaci�n
	Declare @FechasAProcesar table 
	(
	   sec int identity(1,1) primary key, 
	   fecha date
	)

	-- Variables para leer xml
	DECLARE @DocumentoXML xml 

	BEGIN TRY
		SELECT @DocumentoXML = DXML
		FROM OPENROWSET (Bulk 'C:\Users\Johel Mora\Desktop\FacturacionMunicipal_BD\Base de Datos\XML\Operaciones.xml', Single_BLOB) AS DocumentoXML(DXML)
		insert @FechasAProcesar (fecha)
		select f.value('@fecha', 'DATE')
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia') AS t(f);
	END TRY
	BEGIN CATCH
		PRINT 'Hubo un error de cargar fechas'
		RETURN @@ERROR * -1
	END CATCH

	--GUARDAR EL XML CON OPENXML
	DECLARE @XMLData XML
	DECLARE @hdoc INT
	SELECT @XMLData = C
	FROM OPENROWSET (Bulk 'C:\Users\Johel Mora\Desktop\FacturacionMunicipal_BD\Base de Datos\XML\Operaciones.xml', Single_BLOB) AS ReturnData(C)
	EXEC sp_xml_preparedocument @hdoc OUTPUT, @XMLData


	--parte 3 
	
	-- variables que almacenan valor constante para controlar emision masiva de recibos

	--Declare @IdCCobro_ConsumoAgua=1, @IdCCobro_PatenteCantina=7   -- Son ids con valores solo de ejemplo

	-- Variables para controlar la iteraci�n
	declare @Lo1 int, @Hi1 int, @Lo2 int, @Hi2 int
	declare @minfecha datetime, @maxfecha datetime 
	DECLARE @fechaOperacionNodo date

	-- iterando de la fecha m�s antigua a la menos antigua
	Select @minfecha=min(F.fecha), @maxfecha=max(F.fecha)  -- min y max son funciones agregadas
	from @FechasAProcesar F

	select @Lo1=F.sec
	from @FechasAProcesar F
	where F.Fecha=@minfecha

	select @Hi1=F.sec
	from @FechasAProcesar F
	where F.Fecha=@maxfecha

	--parte4
	--iteramos por fecha
	while @Lo1<=@Hi1
	Begin
		Select @FechaOperacion=F.Fecha 
		from @FechasAProcesar F 
		where sec=@Lo1
		
		--DECLARE @fechaOperacionNodo date
		SET @fechaOperacionNodo = @DocumentoXML.value('(/Operaciones_por_Dia/OperacionDia/@fecha)[1]', 'DATE')--revisar

		
		--delete @Propiedades -- ELIMINAR

		--procesar nodos propiedades MASIVO

		INSERT INTO Propiedad (NumFinca, Valor, Direccion, M3Acumulados, M3AcumuladosUltimoRecibo, FechaIngreso, EstaBorrado)
		select pd.value('@NumFinca', 'INT')
		, pd.value('@Valor', 'MONEY')
		, pd.value('@Direccion', 'VARCHAR(150)')
		, 0 AS M3Acumulados
		, 0 AS M3AcumuladosUltimoRecibo
		, pd.value('../@fecha', 'DATE')
		, 0 AS EstaBorrado
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia/Propiedad') AS t(pd)
		where @DocumentoXML.value('(/Operaciones_por_Dia/OperacionDia/@fecha)[1]', 'DATE') = @FechaOperacion 
		

		--delete @Propietarios
		-- procesar nodos propietario
		INSERT INTO Propietario (IdTipoDocumento, Nombre, ValorDocumento, FechaIngreso, EstaBorrado)
		select pt.value('@TipoDocIdentidad','INT')
		, pt.value('@Nombre', 'VARCHAR(100)')
		, pt.value('@identificacion', 'VARCHAR(100)')
		, pt.value('../@fecha', 'DATE')
		, 0 AS EstaBorrado
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia/Propietario') AS t(pt)
		where @DocumentoXML.value('(/Operaciones_por_Dia/OperacionDia/@fecha)[1]', 'DATE') = @FechaOperacion 
		

		--Propietarios Juridicos 
		-- procesar nodos propietarios juridicos ITERATIVO -- considerar hacerlos masivos
		delete @PropJuridico 
		insert @PropJuridico(DocIdPersonaJuridica, NombrePersonaResponsable, IdTipoDocumento, ValorDocumento, EstaBorrado)
		select pd.value('@docidPersonaJuridica', 'VARCHAR(100)')
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
	 
		--insertamos Usuarios insert MASIVO
		--delete @Usuarios
		INSERT INTO Usuario (Nombre, Password, TipoUsuario, FechaIngreso, EstaBorrado)-- rultimo atributo 
		select u.value('@Nombre','VARCHAR(100)')
		, u.value('@password', 'VARCHAR(100)')
		, 'Normal' AS TipoUsuario
		, u.value('../@fecha', 'DATE')
		, 0 AS EstaBorrado
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia/Usuario') AS t(u)
		where @DocumentoXML.value('(/Operaciones_por_Dia/OperacionDia/@fecha)[1]', 'DATE') = @FechaOperacion

		--CCobros x Propiedad
		--procesar nodos CCobroVsPropiedad
		delete @PropiedadesxCCobro 
		insert @PropiedadesxCCobro (IdCCobro, IdPropiedad, FechaInic)-- revisar ultimo atributo 
		select pc.value('@idcobro','INT') --buscar el id de ese valor
		, pc.value('@NumFinca', 'INT') --buscar el id de ese valor
		, pc.value('../@fecha', 'DATE' ) as FechaInic -- POSIBLE error carga solo la primera fecha
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

		/*-- procesar los cambios en las propiedades por dia
		DELETE @PropiedadCambio
		INSERT @PropiedadCambio (NumFinca, NuevoValor)
		select pc.value('@NumFinca', 'INT')
			, pc.value('@NuevoValor', 'MONEY')
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia/PropiedadCambio') AS t(pc)
		where @DocumentoXML.value('(/Operaciones_por_Dia/OperacionDia/@fecha)[1]', 'DATE') = @FechaOperacion
		EXEC spProcesaCambioValorPropiedad @PropiedadCambio*/

		--PAGO DE LOS RECIBOS  
	
		DELETE @PagosHoy
		INSERT INTO @PagosHoy(NumFinca,TipoRecibo,Fecha)  
			SELECT [NumFinca],[TipoRecibo],[fechaDeIngreso9]
			FROM OPENXML (@hdoc, 'Operaciones_por_Dia/OperacionDia/PagoRecibo',1)  
				WITH (	[NumFinca]		VARCHAR(30)	'@NumFinca',  
						[TipoRecibo]	INT			'@TipoRecibo',
						[fechaDeIngreso9]	VARCHAR(100)	'../@fecha')
				WHERE [fechaDeIngreso9] = @FechaOperacion
		EXEC spProcesaPagos @PagosHoy
		
		--procesa los movimientos en los consumos de las propiedades
		DELETE @MovConsumo
		INSERT INTO @MovConsumo(NumFinca, M3, TipoMov, Fecha)
		SELECT [NumFinca], [M3], [TipoMov], [fechaDeIngreso10]
		FROM OPENXML (@hdoc,'/Operaciones_por_Dia/OperacionDia/TransConsumo',1)  
			WITH (	[NumFinca]		VARCHAR(30)	'@NumFinca',  
					[M3]			INT			'@LecturaM3',
					[TipoMov]		INT			'@id',
					[fechaDeIngreso10]	VARCHAR(100)	'../@fecha')
			WHERE [fechaDeIngreso10] = @FechaOperacion

		/*select mc.value('@NumFinca', 'INT')
			, mc.value('@LecturaM3', 'INT')
			, mc.value('@id', 'INT')
			, mc.value('../@fecha', 'DATE')
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia/TransConsumo') AS t(mc)
		where @DocumentoXML.value('(/Operaciones_por_Dia/OperacionDia/@fecha)[1]', 'DATE') = @FechaOperacion*/

		EXEC spProcesaConsumo @MovConsumo

		EXEC spCortaAgua @FechaActual = @FechaOperacion
		EXEC spReconexionAgua @FechaActual = @FechaOperacion

		EXEC spProcesaRecibos @FechaActual = @FechaOperacion
		

		-- PSEUDOCODIGO PARA PROCESAR PAGOS

		/*
		Extraer en una variable table los pagos del dia, @PagosHoy

		-- en algun lado un 
		declare @PagosHoy table (id int identity Primary Key, NumFinca int, IdTipoRecibo int)

		INSERT @PagosHoy (NumFinca, IdTipoRecibo)
		select ph.value('@NumFinca', 'INT')
			, ph.value('idTipoRecibo', 'INT')
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia/PagoRecibo') AS t(ph)
		where @DocumentoXML.value('(/Operaciones_por_Dia/OperacionDia/@fecha)[1]', 'DATE') = @FechaOperacion 
		
		EXEC SP_PROCESACAMBIOVALORPROPIEDAD ... se le envia la tabla con la info

		EXEC SP_PROCESAPAGOS ... (se le envia @PagosHoy) --ES ATOMICO, se usa transact

		EXEC SP_PROCESACONSUMO ... se le envia la tabla con la info

		EXEC SP_ProcesaCortes ... se le envia la tabla con la info

		EXEC SP_ProcesaReconexion ... se le envia la tabla con la info

		EXEC_SP_GeneraRecibos




		/*--procesa los pagos de un dia
		DELETE @PagosHoy
		INSERT @PagosHoy (NumFinca, TipoRecibo, Fecha)
		select ph.value('@NumFinca', 'INT')
			, ph.value('@TipoRecibo', 'INT')
			, ph.value('../@fecha', 'DATE')
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia/PagoRecibo') AS t(ph)
		where @DocumentoXML.value('(/Operaciones_por_Dia/OperacionDia/@fecha)[1]', 'DATE') = @FechaOperacion
		--PRINT  @DocumentoXML.value('(/Operaciones_por_Dia/OperacionDia/@fecha)[1]', 'DATE')
		PRINT @FechaOperacion
		SELECT * from @PagosHoy
		EXEC spProcesaPagos @PagosHoy*/

		/*--procesa los movimientos en los consumos de las propiedades
		DELETE @MovConsumo
		INSERT @MovConsumo(NumFinca, M3, TipoMov, Fecha)
		select mc.value('@NumFinca', 'INT')
			, mc.value('@LecturaM3', 'INT')
			, mc.value('@id', 'INT')
			, mc.value('../@fecha', 'DATE')
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia/TransConsumo') AS t(mc)
		where @DocumentoXML.value('(/Operaciones_por_Dia/OperacionDia/@fecha)[1]', 'DATE') = @FechaOperacion
		EXEC spProcesaConsumo @MovConsumo

		EXEC spCortaAgua @FechaActual = @FechaOperacion
		EXEC spReconexionAgua @FechaActual = @FechaOperacion

		EXEC spProcesaRecibos @FechaActual = @FechaOperacion
		*/

		-- PSEUDOCODIGO PARA PROCESAR PAGOS

		/*
		Extraer en una variable table los pagos del dia, @PagosHoy

		-- en algun lado un 
		declare @PagosHoy table (id int identity Primary Key, NumFinca int, IdTipoRecibo int)

		INSERT @PagosHoy (NumFinca, IdTipoRecibo)
		select ph.value('@NumFinca', 'INT')
			, ph.value('idTipoRecibo', 'INT')
		from @DocumentoXML.nodes('/Operaciones_por_Dia/OperacionDia/PagoRecibo') AS t(ph)
		where @DocumentoXML.value('(/Operaciones_por_Dia/OperacionDia/@fecha)[1]', 'DATE') = @FechaOperacion 
		
		EXEC SP_PROCESACAMBIOVALORPROPIEDAD ... se le envia la tabla con la info

		EXEC SP_PROCESAPAGOS ... (se le envia @PagosHoy) --ES ATOMICO, se usa transact

		EXEC SP_PROCESACONSUMO ... se le envia la tabla con la info

		EXEC SP_ProcesaCortes ... se le envia la tabla con la info

		EXEC SP_ProcesaReconexion ... se le envia la tabla con la info

		EXEC_SP_GeneraRecibos*/


		
		*/

		set @Lo1 = @Lo1 + 1
		
	end
	--select * from @PagosHoy
end
EXEC sp_xml_removedocument @hdoc 
GO
/****** Object:  StoredProcedure [dbo].[spBorradoLogPropiedad]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spBorradoLogPropiedad_Propietario]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spBorradoLogPropiedad_Usuario]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spBorradoLogPropietario]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spBorradoLogPropietario_Jud]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spBorradoLogPropietario_Propiedad]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spBorradoLogUsuario]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spBorradoLogUsuario_Propiedad]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spCargarDatos]    Script Date: 14/7/2020 09:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     PROCEDURE [dbo].[spCargarDatos]

AS
BEGIN
	SET NOCOUNT ON;

	-- VARIABLES --
	DECLARE @TipoDocumento xml, @TipoEntidad xml, @TipoConsumo xml
	
	BEGIN TRY
		--Insercion de los tipos de documentos de identificacion
		SELECT @TipoDocumento = TD
		FROM OPENROWSET (Bulk 'C:\Users\Johel Mora\Desktop\FacturacionMunicipal_BD\Base de Datos\XML\TipoDocumentoIdentidad.xml', Single_BLOB) AS TipoDocumento(TD)

		INSERT INTO dbo.TipoDocumentoId(ID, Nombre)
		SELECT td.value('@codigoDoc', 'VARCHAR(10)')
		, td.value('@descripcion', 'VARCHAR(100)')
		FROM @TipoDocumento.nodes('/TipoDocIdentidad/TipoDocId') AS t(td)

		--Insercion de los tipos de entidad
		SELECT @TipoEntidad = TE
		FROM OPENROWSET (Bulk 'C:\Users\Johel Mora\Desktop\FacturacionMunicipal_BD\Base de Datos\XML\EntityType.xml', Single_BLOB) AS TipoEntidad(TE)
		INSERT INTO dbo.EntityType(ID, Nombre)
		SELECT te.value('@id', 'INT')
		, te.value('@Nombre', 'VARCHAR(100)')
		FROM @TipoEntidad.nodes('/TipoEntidades/Entidad') AS t(te)

		--Insercion de los tipos de consumo
		SELECT @TipoConsumo = TC
		FROM OPENROWSET (Bulk 'C:\Users\Johel Mora\Desktop\FacturacionMunicipal_BD\Base de Datos\XML\TipoTransConsumo.xml', Single_BLOB) AS TipoConsumo(TC)
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
/****** Object:  StoredProcedure [dbo].[spCargarDatosAdmin]    Script Date: 14/7/2020 09:25:22 ******/
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
        FROM OPENROWSET (Bulk 'C:\Users\Johel Mora\Desktop\FacturacionMunicipal_BD\Base de Datos\XML\Administradores.xml', Single_BLOB) AS Usuario(U)
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
/****** Object:  StoredProcedure [dbo].[spCargarDatosCC]    Script Date: 14/7/2020 09:25:22 ******/
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
		declare @jsonAntes varchar(500), @insertedAt DATETIME, @max INT, @min INT, @IP VARCHAR(20)
		SET @insertedAt = GETDATE() 
        --Insercion de los tipos de CCobro
        SELECT @CCobro = CC
        FROM OPENROWSET (Bulk 'C:\Users\Johel Mora\Desktop\FacturacionMunicipal_BD\Base de Datos\XML\Concepto_de_Cobro.xml', Single_BLOB) AS CCobro(CC)

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
			SET @jsonAntes = (SELECT  ID, Nombre, TasaInteresMoratorio, DiaEmisionRecibo, QDiasVencimiento, EsImpuesto,  EsRecurrente, EsFijo, TipoCC
			FROM CCobro WHERE ID=@min
			FOR JSON PATH)
			EXEC [dbo].spInsertarBitacoraCambios @inIdEntityType = 7,
				   						 @inEntityID = @min, 
										 @inJsonAntes = @jsonAntes,
										 @inJsonDespues = NULL, 
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
/****** Object:  StoredProcedure [dbo].[spCortaAgua]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spCreatePropiedad_Propietario]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spCreatePropiedad_Usuario]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spEditarPropiedad]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spEditarPropietario]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spEditarPropietario_Jud]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spEditarUsuario]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spInsertarBitacoraCambios]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spInsertarPropiedad]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spInsertarPropietario]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spInsertarPropietario_Jud]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spInsertarUsuario]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spObtenerBitacora]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spObtenerComprobantesPedePropiedad]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spObtenerPropiedades]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spObtenerPropiedades_Propietarios]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spObtenerPropiedades_Propietarios_Ingresado]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spObtenerPropiedades_SinPropietario]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spObtenerPropiedades_SinUsuario]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spObtenerPropiedades_Usuarios]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spObtenerPropiedades_Usuarios_PorNombre]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spObtenerPropietario_SinPropiedad]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spObtenerPropietarios]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spObtenerPropietarios_Propiedades]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spObtenerPropietarios_Propiedades_PorFinca]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spObtenerPropietariosJuridicos]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spObtenerRecibosPedePropiedad]    Script Date: 14/7/2020 09:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[spObtenerRecibosPedePropiedad] @id int, @estado int as 	
	BEGIN
	BEGIN TRY
		SELECT R.ID, R.FechaEmision, CC.Nombre
		FROM Recibo AS R
		INNER JOIN CCobro AS CC ON R.IdCCobro = CC.ID
		WHERE R.Estado=@estado AND @id=R.IdPropiedad
		ORDER BY R.FechaEmision DESC
	END TRY
	BEGIN CATCH
	If @@TRANCOUNT > 0 
		ROLLBACK TRAN;
		THROW 60000,'Error: No se ha podido buscar Recibos',1;
	END CATCH
	END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerUsuarios]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spObtenerUsuarios_Propiedades]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spObtenerUsuarios_Propiedades_PorFinca]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spObtenerUsuarios_SinPropiedad]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spProcesaCambioValorPropiedad]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spProcesaConsumo]    Script Date: 14/7/2020 09:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[spProcesaConsumo] @MovConsumo MovConsumoType READONLY
AS 
BEGIN
	--BEGIN TRY
		DECLARE @Low  int, @High int
		SELECT @Low = min(sec) , @High = max(sec) 
		FROM @MovConsumo 

		BEGIN TRANSACTION
		WHILE @Low <= @High
		BEGIN
			INSERT INTO dbo.MovimientoConsumo(IdPropiedad, IdTipoMovimiento, FechaMov, MontoM3, LecturaConsumo, NuevoM3Consumo)
			SELECT Prop.ID
				, Cons.TipoMov 
				, Cons.Fecha
				, CASE WHEN (Cons.TipoMov = 1) THEN Cons.M3-Prop.M3Acumulados
				  ELSE Cons.M3
				  END
				, CASE WHEN (Cons.TipoMov = 1) THEN Cons.M3 
				  ELSE NULL 
				  END
				, CASE WHEN (Cons.TipoMov = 1) THEN Cons.M3 
				  WHEN (Cons.TipoMov = 2) THEN Prop.M3Acumulados - Cons.M3
				  WHEN (Cons.TipoMov = 3) THEN Prop.M3Acumulados + Cons.M3
				  END
 			FROM dbo.Propiedad Prop
			INNER JOIN @MovConsumo Cons ON Cons.NumFinca = Prop.NumFinca
			WHERE Cons.sec = @Low

			UPDATE dbo.Propiedad
			SET M3Acumulados = 
				CASE WHEN (Cons.TipoMov = 1) THEN Cons.M3
				WHEN (Cons.TipoMov = 2) THEN M3Acumulados - Cons.M3
				WHEN (Cons.TipoMov = 3) THEN M3Acumulados + Cons.M3
				END
			FROM dbo.Propiedad Prop 
			INNER JOIN @MovConsumo Cons ON Cons.NumFinca = Prop.NumFinca
			WHERE Cons.sec = @Low

			SET @Low = @Low + 1
		END
		COMMIT
	/*END TRY
	BEGIN CATCH
		If @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;
		THROW 50001, 'Error en la transaccion de Consumos', 1
	END CATCH;*/
END
GO
/****** Object:  StoredProcedure [dbo].[spProcesaPagos]    Script Date: 14/7/2020 09:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[spProcesaPagos] @PagosHoy PagosHoyType READONLY
AS   
	BEGIN
		--BEGIN TRY
		SET NOCOUNT ON 
		SET XACT_ABORT ON

			DECLARE @idMenor INT, @idMayor INT, @fechaVence DATE, @fechaOperacion DATE, @montoMoratorio MONEY, @contador INT,
					@idComprobante INT, @tasaMoratoria FLOAT, @montoRecibo MONEY, @tipoCC int, @idPropiedad INT
			--TABLA DE IDS DE RECIBOS POR CONCEPTO DE COBRO DE CADA PROPIEDAD 
			DECLARE @idRecibosPagar TABLE(id INT IDENTITY(1,1),idRecibo INT)
			--CONTADOR PARA ITERAR TABLA DE RECIBOS DE CADA PROPIEDAD Y SABER DONDE QUEDE LA ULTIMA VEZ
			SET @contador = 1
			SELECT @idMenor = min([sec]), @idMayor=max([sec]) FROM @PagosHoy--SACA ID MAYOR Y MENOR PARA ITERAR LA TABLA
			
			--BEGIN TRAN
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
							INSERT INTO @idRecibosPagar(idRecibo)
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
							INSERT INTO @idRecibosPagar(idRecibo)
							SELECT R.ID
							FROM @PagosHoy P
							INNER JOIN [dbo].[Propiedad] AS PR ON PR.NumFinca = P.NumFinca 
							INNER JOIN [dbo].[Recibo] AS R ON R.IdPropiedad = PR.ID
							WHERE P.sec = @idMenor AND R.[Estado] = 0
							AND (R.IdCCobro = 11			--GUARDA TODOS LOS RECIBOS MORATORIOS PENDIENTES (11)
								OR	R.IdCCobro = @tipoCC)--GUARDA TODOS LOS RECIBOS DE DE ESE CONCEPTO DE COBRO PENDIENTES (@TIPOCC)
						END
					
					--MIENTRAS EXISTA UN CONCEPTO DE COBRO SIN PAGAR, RECORRA LOS RECIBOS
					WHILE EXISTS(SELECT idRP.id FROM @idRecibosPagar idRP INNER JOIN [dbo].[Recibo] AS R ON R.ID = idRP.idRecibo WHERE R.Estado = 0)
					BEGIN
						--ESTABLECE EL MONTO DEL RECIBO
						SET @montoRecibo = (SELECT R.Monto FROM [dbo].[Recibo] AS R
											INNER JOIN @idRecibosPagar idRP ON R.id = idRP.idRecibo
											WHERE idRP.id = @contador)

						--INSERTA UNA RELACION ENTRE RECIBO Y COMPROBANTE DE PAGO
						INSERT INTO [dbo].[ReciboPagado](IdRecibo, IdComprobante)
						SELECT idRP.idRecibo, @idComprobante
						FROM @idRecibosPagar idRP
						WHERE idRP.id = @contador

						--PAGA EL RECIBO ACTUALIZANDO SU ESTADO A PAGADO
						UPDATE [dbo].[Recibo]
						SET [estado] = 1
						FROM @idRecibosPagar idRP
						WHERE idRP.idRecibo = [dbo].[Recibo].[ID] AND idRP.id = @contador

						--VERIFICA SI SE DEBE CREAR RECIBO MORATORIO
						--SACA LA FECHA EN LA QUE VENCE EL RECIBO
						SET @fechaVence = (SELECT FechaMaximaPago FROM [dbo].[Recibo] R
										   INNER JOIN @idRecibosPagar idRP ON idRP.idRecibo = R.id
										   WHERE @contador = idRP.id)
						--SI LA FECHA EN LA QUE VENCE ES MENOR A LA FECHA EN LA QUE SE ESTA PAGANDO EL RECIBO
						IF @fechaVence < @fechaOperacion
						BEGIN
							--SACA LA TASA MORATORIA DE ESE RECIBO
							SET @tasaMoratoria = (SELECT CC.TasaInteresMoratorio FROM [dbo].[CCobro] CC
													INNER JOIN [dbo].[Recibo] AS R ON R.IdCCobro = CC.ID 
													INNER JOIN  @idRecibosPagar AS idRP ON idRP.idRecibo = R.id
													WHERE idRP.id = @contador)
							--AQUI CAMBIA EL MONTO MORATORIO YA QUE SI SE DEBE CREAR RECIBO MORATORIO
							SET @montoMoratorio = (@montoRecibo*@tasaMoratoria/365)*ABS(DATEDIFF(day, @fechaVence, @fechaOperacion))
							
							--CREA UN RECIBO RE TIPO MORATORIO Y LO PAGA
							INSERT INTO [dbo].[Recibo](IdPropiedad,IdCCobro,Monto,Estado,FechaEmision,FechaMaximaPago)
							SELECT @idPropiedad, CC.ID,@montoMoratorio, 1, @fechaOperacion, DATEADD(day, CC.QDiasVencimiento, @fechaOperacion)
							FROM [dbo].[CCobro] AS CC
							WHERE CC.ID = 11
							
							--INSERTAR UNA RELACION ENTRE EL RECIBO MORATORIO PAGADO Y EL COMPROBANTE DE PAGO
							INSERT INTO [dbo].[ReciboPagado](IdComprobante,IdRecibo)
							SELECT @idComprobante, IDENT_CURRENT('[dbo].[Recibo]')	
						END
						--AL FINAL ACTUALIZA EL MONTO DEL COMPROBANTE DE PAGO
						UPDATE [dbo].[ComprobantePago]
						SET MontoTotal = MontoTotal+@montoRecibo+@montoMoratorio--SI NO HUBO RECIBO MORATORIO SUMA 0 MAS EL MONTO POR LOS DEMAS RECIBOS
						WHERE ID = @idComprobante
						SET @contador = @contador+1--INCREMENTA EL CONTADOR
					END
					--PRINT @idMenor
					SET @idMenor = @idMenor+1
				END
				
				--COMMIT
		/*END TRY
		BEGIN CATCH
			If @@TRANCOUNT > 0 
				ROLLBACK TRAN;
			THROW 50003, 'Error: No se ha podido crear los pago.', 1;
		END CATCH*/

		
	END
GO
/****** Object:  StoredProcedure [dbo].[spProcesaRecibos]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spReconexionAgua]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spValidarUsuario]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spVerBitacora]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spVerPropiedad]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spVerPropietario]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spVerPropietario_Jud]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spVerReciboPedePropiedad]    Script Date: 14/7/2020 09:25:22 ******/
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
/****** Object:  StoredProcedure [dbo].[spVerUsuario]    Script Date: 14/7/2020 09:25:22 ******/
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
USE [master]
GO
ALTER DATABASE [FacturacionMunicipal] SET  READ_WRITE 
GO
