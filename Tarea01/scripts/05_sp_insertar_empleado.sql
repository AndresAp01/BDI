-- 05_sp_insertar_empleado.sql
-- lo que Python va a pedir cuando el usuario llena el formulario
-- de "Insertar Empleado" y presiona el boton.
--
-- Reglas del enunciado:
--   - Si el nombre ya existe, NO inserta, devuelve un codigo de error.
--   - Esa validacion se hace programaticamente (con un SELECT), no con
--     un indice UNIQUE.

USE BDI_Tarea01;
GO

IF OBJECT_ID('dbo.sp_InsertarEmpleado', 'P') IS NOT NULL
BEGIN
    DROP PROCEDURE dbo.sp_InsertarEmpleado;
END
GO

CREATE PROCEDURE dbo.sp_InsertarEmpleado
    @Nombre  VARCHAR(128),
    @Salario MONEY
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Revisamos si el nombre ya existe
        IF EXISTS (SELECT 1 FROM dbo.Empleado WHERE Nombre = @Nombre)
        BEGIN
            -- Codigo 1 = "ya existe", no se inserta nada.
            SELECT 1 AS Resultado, 'Nombre de Empleado ya existe.' AS Mensaje;
            RETURN;
        END

        -- Si no existe, insertamos dentro de una transaccion
        -- para garantizar que la operacion sea todo-o-nada.
        BEGIN TRANSACTION;

            INSERT INTO dbo.Empleado (Nombre, Salario)
            VALUES (@Nombre, @Salario);

        COMMIT TRANSACTION;

        -- Codigo 0 = insercion exitosa.
        SELECT 0 AS Resultado, 'Insercion exitosa.' AS Mensaje;

    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        INSERT INTO dbo.LogErrores (NombreSP, Linea, MensajeError, Severidad, NumeroError)
        VALUES (
            'sp_InsertarEmpleado',
            ERROR_LINE(),
            ERROR_MESSAGE(),
            ERROR_SEVERITY(),
            ERROR_NUMBER()
        );

        -- Codigo 2 = error inesperado (no es el caso de "ya existe").
        SELECT 2 AS Resultado, 'Ocurrio un error inesperado.' AS Mensaje;
    END CATCH
END
GO

-- Pruebas manuales:

-- Prueba A: insertar un nombre nuevo, deberia decir "Insercion exitosa."
EXEC dbo.sp_InsertarEmpleado @Nombre = 'Pedro Gonzalez', @Salario = 300000.00;
GO

-- Prueba B: insertar el mismo nombre otra vez, deberia decir "ya existe."
EXEC dbo.sp_InsertarEmpleado @Nombre = 'Pedro Gonzalez', @Salario = 300000.00;
GO
