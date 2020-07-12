USE [FacturacionMunicipal]
GO
/****** Object:  StoredProcedure [dbo].[spObtenerComprobantesPedePropiedad]    Script Date: 10/7/2020 08:26:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE or ALTER PROC [dbo].spObtenerComprobantesPedePropiedad @id int as 	
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