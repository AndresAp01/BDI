USE BDI_TAREA01;
GO

IF OBJECT_ID('dbo.sp_ListarEmpleados', 'P') IS NOT NULL -- si ya existia, la borramos 
BEGIN
    DROP PROCEDURE dbo.sp_ListarEmpleados; --
END
GO

CREATE PROCEDURE dbo.sp_ListarEmpleados -- creamos el stored procedure
AS
BEGIN
    SET NOCOUNT ON; -- evita
 
    BEGIN TRY --excepciones
        SELECT id, Nombre, Salario
        FROM dbo.Empleado
        ORDER BY Nombre ASC;
    END TRY
    BEGIN CATCH -- si ocurre un error, lo registramos en la tabla de log
        INSERT INTO dbo.LogErrores (NombreSP, Linea, MensajeError, Severidad, NumeroError)
        VALUES (
            'sp_ListarEmpleados',
            ERROR_LINE(),
            ERROR_MESSAGE(),
            ERROR_SEVERITY(),
            ERROR_NUMBER()
        );
 
        THROW;
    END CATCH
END
GO


EXEC dbo.sp_ListarEmpleados; -- prueba manual del stored procedure
GO

GRANT EXECUTE ON dbo.sp_ListarEmpleados TO Angela; -- otorga permiso de ejecucion a Angela
GO
