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
 

