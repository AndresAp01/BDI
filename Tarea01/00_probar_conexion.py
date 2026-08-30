"""
Script minimo para confirmar que Python puede hablar con SQL Server corriendo en Docker.
"""

import pymssql

# Datos de conexion
SERVIDOR = "localhost"
PUERTO = 1433
USUARIO = "sa"
CONTRASENA = "Bd2026Segura!"

print(f"Intentando conectar a {SERVIDOR}:{PUERTO} como {USUARIO}...")

try:
    conexion = pymssql.connect(
        server=SERVIDOR,
        port=PUERTO,
        user=USUARIO,
        password=CONTRASENA,
    )
    print("Conexion exitosa!")

    cursor = conexion.cursor()
    cursor.execute("SELECT @@VERSION;")
    resultado = cursor.fetchone()

    print("\nEl servidor respondio:")
    print(resultado[0])

    conexion.close()
    print("\nConexion cerrada correctamente.")

except Exception as error:
    print("\nAlgo fallo al conectar. Este es el error exacto:")
    print(error)
