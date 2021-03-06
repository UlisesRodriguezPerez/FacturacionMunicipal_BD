USE [FacturacionMunicipal]
GO
/****** Object:  StoredProcedure [dbo].[spObtenerBitacoraConsulta]    Script Date: 15/7/2020 01:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or ALTER   procedure [dbo].[spObtenerBitacoraConsulta]
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