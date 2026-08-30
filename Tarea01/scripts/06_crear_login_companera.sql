-- 06_crear_login_companera.sql
-- Crea un usuario dedicado para tu companera de equipo

-- crear el login a nivel de servidor
CREATE LOGIN Angela WITH PASSWORD = 'ClaveDeElla2026!';
GO

-- acceso especificamente a la base de datos del proyecto
USE BDI_Tarea01;
GO

CREATE USER Angela FOR LOGIN Angela;
GO

-- permisos de lectura y escritura
ALTER ROLE db_datareader ADD MEMBER Angela;
ALTER ROLE db_datawriter ADD MEMBER Angela;
GO

-- Para que pueda ejecutar los stored procedures
GRANT EXECUTE ON dbo.sp_ListarEmpleados TO Angela;
GRANT EXECUTE ON dbo.sp_InsertarEmpleado TO Angela;
GO
