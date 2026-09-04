import os
import pymssql
from dotenv import load_dotenv

load_dotenv() #carga variables del archivo .env al entorno de ejecución

#os.getenv obtiene el valor de db_server para conectarse a la base de datos
def obtener_conexion():
    return pymssql.connect(
        server=os.getenv("DB_SERVER"),
        port=int(os.getenv("DB_PORT")),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB_NAME")
    )