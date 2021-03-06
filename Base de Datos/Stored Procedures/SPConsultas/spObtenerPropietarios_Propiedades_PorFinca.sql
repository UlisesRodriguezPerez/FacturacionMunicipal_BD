USE [FacturacionMunicipal]
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPropietarios_Propiedades]    Script Date: 7/6/2020 01:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER   procedure [dbo].[spObtenerPropietarios_Propiedades_PorFinca]
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
Go 

exec spObtenerPropietarios_Propiedades_PorFinca @finca = 3120927
