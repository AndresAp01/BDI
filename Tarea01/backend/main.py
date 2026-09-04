from fastapi import FastAPI
from basedatos import obtener_conexion

app = FastAPI()

@app.get("/")
def inicio():
    return {"mensaje": "Backend sí sirve"}

@app.get("/conexion")
def probar_conexion():
    conexion = obtener_conexion()
    cursor = conexion.cursor()

    cursor.execute("SELECT DB_NAME()")
    resultado = cursor.fetchone()

    conexion.close()

    return {
        "mensaje": "Conexión exitosa",
        "base_datos": resultado[0]
    }

@app.get("/empleados")
def listar_empleados():
    conexion = obtener_conexion()
    cursor = conexion.cursor(as_dict=True)

    cursor.callproc("sp_ListarEmpleados")
    empleados = cursor.fetchall()

    conexion.close()

    return empleados