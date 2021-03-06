USE [FacturacionMunicipal]
GO

--SPs para el CRUD de Propietarios Juridicos

CREATE OR ALTER procedure [dbo].[spInsertarPropietario_Jud]
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

go

CREATE OR ALTER procedure [dbo].[spEditarPropietario_Jud]  
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

go 

CREATE OR ALTER procedure [dbo].[spVerPropietario_Jud]     
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

go

CREATE or ALTER PROCEDURE [dbo].[spBorradoLogPropietario_Jud]
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

go 

