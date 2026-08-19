-- 01_primera_tabla.sql
-- Objetivo: perder el miedo a la sintaxis básica de DDL

CREATE DATABASE SandboxBD1;
GO

USE SandboxBD1;
GO

CREATE TABLE Estudiante (
    id      INT IDENTITY(1,1) NOT NULL,
    nombre  VARCHAR(100) NOT NULL,
    correo  VARCHAR(150) NOT NULL,
    CONSTRAINT PK_Estudiante PRIMARY KEY (id)
);
GO

-- Prueba rápida
INSERT INTO Estudiante (nombre, correo) VALUES ('Ana Pérez', 'ana@example.com');
GO

SELECT * FROM Estudiante;
GO