CREATE PROCEDURE dbo.sp_VerificarConexion --solo verifica que la app pueda comunicarse con la base de datos
AS
BEGIN
    SET NOCOUNT ON; --no mostrar mensajes de confirmacion de filas afectadas

    SELECT DB_NAME() AS BaseDatos; --devuelve el nombre de la base de datos actualmente conectada
END;
GO