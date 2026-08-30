import re
import pymssql
from fastapi import FastAPI, Form, Request
from fastapi.responses import RedirectResponse
from fastapi.templating import Jinja2Templates
 
app = FastAPI()
templates = Jinja2Templates(directory="templates")

#
# ----------------------- datos de conexion
SERVIDOR = "localhost"
PUERTO = 1433
USUARIO = "sa"
CONTRASENA = "Bd2026Segura!"
BASE_DATOS = "BDI_Tarea01"

#
def obtener_conexion():
    """Abre una conexion nueva a SQL Server. Se cierra despues de cada uso."""
    return pymssql.connect(
        server=SERVIDOR,
        port=PUERTO,
        user=USUARIO,
        password=CONTRASENA,
        database=BASE_DATOS,
        as_dict=True, #
    )

# validaciones permitidas ----------------------------------
# Todo lo demas vive en el stored procedure, que es el que hace la validacion final

PATRON_NOMBRE = re.compile(r"^[A-Za-zÁÉÍÓÚáéíóúÑñ\- ]+$")
PATRON_SALARIO = re.compile(r"^\d+(\.\d{2,4})?$")
 
 
def validar_nombre(nombre: str) -> bool:
    return bool(nombre) and bool(PATRON_NOMBRE.match(nombre))
 
 
def validar_salario(salario_texto: str) -> bool:
    return bool(salario_texto) and bool(PATRON_SALARIO.match(salario_texto))
 
##FUNCIONA ^--

#rutas -----------------------------------------------------

@app.get("/") #
def lista_empleados(request: Request):
    """Pantalla principal: llama a sp_ListarEmpleados y muestra el grid."""
    conexion = obtener_conexion()
    cursor = conexion.cursor()
    cursor.execute("EXEC dbo.sp_ListarEmpleados")
    empleados = cursor.fetchall()
    conexion.close()
 
    return templates.TemplateResponse(
        "lista.html",
        {"request": request, "empleados": empleados},
    )
    
@app.post("/insertar")
def procesar_insertar(
    request: Request,
    nombre: str = Form(...),
    salario: str = Form(...),
):
    """Recibe el formulario, valida formato, y llama a sp_InsertarEmpleado."""
 
    # 1. Validaciones de capa UI (formato), tal como pide el enunciado.
    if not validar_nombre(nombre):
        return templates.TemplateResponse(
            "insertar.html",
            {
                "request": request,
                "error": "El nombre solo puede contener letras, espacios y guiones.",
            },
        )
 
    if not validar_salario(salario):
        return templates.TemplateResponse(
            "insertar.html",
            {
                "request": request,
                "error": "El salario debe ser un numero valido (ej. 300000.50).",
            },
        )
 
    # 2. Llamamos al stored procedure - el sabe si el nombre ya existe.
    conexion = obtener_conexion()
    cursor = conexion.cursor()
    cursor.execute(
        "EXEC dbo.sp_InsertarEmpleado %s, %s",
        (nombre, salario),
    )
    resultado = cursor.fetchone()
    conexion.commit()
    conexion.close()
 
    if resultado["Resultado"] == 0:
        # Insercion exitosa -> volvemos a la lista.
        return RedirectResponse(url="/", status_code=303)
    else:
        # Codigo 1 (ya existe) o 2 (error inesperado) -> mostramos el mensaje.
        return templates.TemplateResponse(
            "insertar.html",
            {"request": request, "error": resultado["Mensaje"]},
        )

