import os
import re
import pymssql
from dotenv import load_dotenv
from fastapi import FastAPI, Form, Request
from fastapi.responses import RedirectResponse
from fastapi.templating import Jinja2Templates

app = FastAPI()

load_dotenv()
templates = Jinja2Templates(directory="app/templates")

#datos de conexion, ambos definimos los valores en nuestrapropia maquina (ver README),
#nunca se escriben fijos aqui
SERVIDOR = os.environ.get("DB_SERVIDOR")
PUERTO = int(os.environ.get("DB_PUERTO", "14330"))
USUARIO = os.environ.get("DB_USUARIO")
CONTRASENA = os.environ.get("DB_CONTRASENA")
BASE_DATOS = os.environ.get("DB_NOMBRE", "BDI_Tarea01")


def obtener_conexion():
    """Abre una conexion nueva a SQL Server. Se cierra despues de cada uso."""
    return pymssql.connect(
        server=SERVIDOR,
        port=PUERTO,
        user=USUARIO,
        password=CONTRASENA,
        database=BASE_DATOS,
        as_dict=True,
    )
#asi cada fila

# -validaciones capa ui
PATRON_NOMBRE = re.compile(r"^[A-Za-zÁÉÍÓÚáéíóúÑñ\- ]+$")
PATRON_SALARIO = re.compile(r"^\d+(\.\d{2,4})?$")


def validar_nombre(nombre: str) -> bool:
    return bool(nombre) and bool(PATRON_NOMBRE.match(nombre))


def validar_salario(salario_texto: str) -> bool:
    return bool(salario_texto) and bool(PATRON_SALARIO.match(salario_texto))


# -rutas

@app.get("/")
def lista_empleados(request: Request, mensaje: str | None = None):
    conexion = obtener_conexion()
    cursor = conexion.cursor(as_dict=True)

    cursor.callproc("sp_ListarEmpleados")
    empleados = cursor.fetchall()
    cursor.close()
    conexion.close()

    return templates.TemplateResponse(
        "lista.html",
        {
            "request": request,
            "empleados": empleados,
            "mensaje": mensaje
        },
    )


@app.get("/insertar")
def formulario_insertar(request: Request):
    return templates.TemplateResponse(
        "insertar.html",
        {"request": request, "error": None},
    )


@app.post("/insertar")
def procesar_insertar(
    request: Request,
    nombre: str = Form(...),
    salario: str = Form(...),
):
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

    conexion = obtener_conexion()
    cursor = conexion.cursor(as_dict=True)

    cursor.callproc(
        "sp_InsertarEmpleado",
        (nombre, salario)
    )

    resultado = cursor.fetchone()
    conexion.commit()
    cursor.close()
    conexion.close()

    if resultado["Resultado"] == 0:
        return RedirectResponse(
            url="/?mensaje=Insercion%20exitosa",
            status_code=303
    )
    else:
        return templates.TemplateResponse(
            "insertar.html",
            {"request": request, "error": resultado["Mensaje"]},
        )