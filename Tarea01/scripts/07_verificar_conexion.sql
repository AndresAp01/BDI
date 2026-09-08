CREATE PROCEDURE dbo.sp_VerificarConexion
AS
BEGIN
    SET NOCOUNT ON;

    SELECT DB_NAME() AS BaseDatos;
END;
GO