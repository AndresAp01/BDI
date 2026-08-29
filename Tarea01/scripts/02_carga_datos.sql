-- 02_carga_datos.sql
-- Carga 40 filas de prueba en la tabla Empleado.

USE BDI_Tarea01;
GO

INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Juan Perez', 200000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Maria Rodriguez', 450000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Carlos Jimenez', 375500.50);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Ana Rojas', 250000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Luis Chaves', 200000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Sofia Vargas', 520000.75);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Diego Solano', 310000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Valeria Mora', 289900.25);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Andres Fernandez', 400000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Camila Araya', 610000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Jose Ramirez', 330000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Paula Castro', 275000.50);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Kevin Alvarado', 355000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Daniela Salazar', 480000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Esteban Quiros', 295000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Gabriela Monge', 410000.25);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Fernando Ugalde', 360000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Natalia Herrera', 500000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Ricardo Sanchez', 320000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Melissa Brenes', 275500.75);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Alberto Cordero', 340000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Karla Zuniga', 290000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Pablo Villalobos', 425000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Laura Espinoza', 385000.50);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Mauricio Barrantes', 310500.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Silvia Campos', 455000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Roberto Nunez', 300000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Adriana Guzman', 470000.25);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Manuel Duran', 335000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Patricia Leiton', 260000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Alvaro Segura', 390000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Vanessa Blanco', 415000.50);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Federico Aguilar', 350000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Marcela Rojas', 305000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Ivan Mendez', 265000.75);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Grettel Chacon', 495000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Wilbert Gomez', 315000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Tatiana Marin', 280000.25);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Rodolfo Vega', 370000.00);
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('Yolanda Picado', 445000.00);
GO

-- Confirmacion
SELECT COUNT(*) AS TotalEmpleados FROM dbo.Empleado;
GO

-- Vista rapida ordenada como la pide el enunciado (alfabetico por nombre).
SELECT * FROM dbo.Empleado ORDER BY Nombre ASC;
GO
