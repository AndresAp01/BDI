-- 03_tabla_log_errores.sql
-- Tabla donde se registran las excepciones que ocurran dentro de los stored procedures
-- que SP la genero, en que linea, que tipo de error, y la severidad

USE BDI_Tarea01;
GO

IF OBJECT_ID('dbo.LogErrores', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.LogErrores;
END
GO

CREATE TABLE dbo.LogErrores
(
    id              INT IDENTITY(1,1) PRIMARY KEY,
    FechaHora       DATETIME NOT NULL DEFAULT GETDATE(),
    NombreSP        NVARCHAR(128)  NULL,
    Linea           INT            NULL,
    MensajeError    NVARCHAR(2000) NULL,
    Severidad       INT            NULL,
    NumeroError     INT            NULL
);
GO
