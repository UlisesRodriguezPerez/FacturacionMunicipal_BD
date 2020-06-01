-- =================================================================================================
-- Autores:		<Kevin Fallas y Johel Mora>
-- Fecha de creacion: <31/5/2020>
-- Fecha de Ultima Modification: <>
-- Descripcion:	<SP para cargar datos de tablas [TipoDocumentoId], >
-- =================================================================================================

USE [FacturacionMunicipal]
GO

SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO

CREATE OR ALTER PROCEDURE [dbo].[spCargarDatos]

AS
BEGIN
	SET NOCOUNT ON;

	-- VARIABLES --
	DECLARE @DocHandle int, @temp xml, @TipoDocumento xml
	
	DECLARE @TiposDocumentos TABLE
	(
		codigoDoc int,
		descripcion varchar(100)
	)
	BEGIN TRY
		--Insercion de los tipos de documentos de identificacion
		SELECT @TipoDocumento = TD
		FROM OPENROWSET (Bulk 'D:\Base de datos\FacturacionMunicipal_BD\Base de Datos\XML\TipoDocumentoIdentidad.xml', Single_BLOB) AS TipoDocumento(TD)
		EXEC sp_xml_preparedocument @DocHandle OUTPUT, @TipoDocumento

		INSERT INTO TipoDocumentoId
		SELECT codigoDoc, descripcion 
		FROM OPENXML(@DocHandle, '/TipoDocIdentidad/TipoDocId', 1) -- El uno es para que sea attribute centric
		WITH
		(
			codigoDoc VARCHAR(10) '@codigoDoc' ,
			descripcion VARCHAR(100) '@descripcion'
		)

		EXEC sp_xml_removedocument @DocHandle

		--INSERT INTO TipoDocumentoId
		--SELECT D.codigoDoc, D.codigoDoc
		--FROM @TiposDocumentos D

	END TRY

	BEGIN CATCH
		return @@ERROR * -1
	END CATCH

END
GO

exec spCargarDatos