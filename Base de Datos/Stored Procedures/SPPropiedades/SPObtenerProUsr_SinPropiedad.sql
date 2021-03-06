--SP para saber que usuarios no est�n con la propiedad
Use FacturacionMunicipal
Go

Create or Alter procedure [dbo].[spObtenerUsuarios_SinPropiedad]
(
	@id int
)
as
BEGIN
	If @id is null
	BEGIN
		return -1
	END 
	SELECT DISTINCT Usuario.ID, Usuario.Nombre, Usuario.Password, Usuario.TipoUsuario
	FROM Usuario_Prop
	FULL JOIN Propiedad ON Propiedad.ID=Usuario_Prop.IdPropiedad
	FULL JOIN Usuario ON Usuario.ID=Usuario_Prop.IdUsuario
	where Propiedad.ID IS NULL or Propiedad.ID <> @id and Usuario.ID IS NOT NULL and Usuario.EstaBorrado = 0 and Usuario_Prop.EstaBorrado = 0 and Propiedad.EstaBorrado=0
	order by Usuario.ID
END
go

--SP para saber que propietarios no est�n con la propiedad

Create or Alter procedure [dbo].[spObtenerPropietario_SinPropiedad]
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