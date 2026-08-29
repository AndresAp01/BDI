-- 01_crear_tabla.sql
-- Crea la base de datos del proyecto y la tabla Empleado
-- tal como la pide el enunciado de la Primera Tarea Programada.

-- Si la base de datos no existe, se crea
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'BDI_Tarea01')
BEGIN
    CREATE DATABASE BDI_Tarea01;
END
GO

-- Nos movemos a trabajar dentro de esa base de datos.
USE BDI_Tarea01;
GO

-- Si la tabla ya existia de un intento anterior, la borramos primero
-- para poder correr este script las veces que sea necesario sin errores.
IF OBJECT_ID('dbo.Empleado', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Empleado;
END
GO

CREATE TABLE dbo.Empleado
(
    id      INT IDENTITY(1,1) PRIMARY KEY,
    Nombre  VARCHAR(128) NOT NULL,
    Salario MONEY NOT NULL
);
GO

-- Confirmacion visual de que la tabla quedo creada correctamente.
SELECT * FROM dbo.Empleado;
GO
