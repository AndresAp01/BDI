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

