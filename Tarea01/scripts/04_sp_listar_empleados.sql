USE BDI_TAREA01;
GO

IF OBJECT_ID('dbo.sp_ListarEmpleados', 'P') IS NOT NULL
BEGIN
    DROP PROCEDURE dbo.sp_ListarEmpleados;
END
GO

CREATE PROCEDURE dbo.sp_ListarEmpleados
AS
BEGIN
    SET NOCOUNT ON;
 
    BEGIN TRY
        SELECT id, Nombre, Salario
        FROM dbo.Empleado
        ORDER BY Nombre ASC;
    END TRY
    BEGIN CATCH
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


EXEC dbo.sp_ListarEmpleados;
GO
