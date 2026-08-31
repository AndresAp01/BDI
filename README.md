# BDI

<p align="center">
  <img src="assets/logo_tec.png" alt="ITCR" width="238">
</p>
<p align="center">
  Repositorio del curso Base de Datos I — Escuela de Ingeniería en Computación, ITCR. Segundo semestre 2026. 
</p>

<p align="center">
  <a href="#inicio_rapido">Inicio Rápido</a> ·
  <a href="setup.md">Guía de Instalación</a> ·
  <a href="\Tareas">Tareas</a> ·
  <a href="\Proyectos">Proyectos</a>
</p>

Se utiliza Docker para hostear el servidor. VSCode para acceder y programar la BD, Tailscale como red.
Se distribuye en carpetas, una para cada proyecto o ejercicio. 

---
## Inicio rápido (para cualquier tarea) / QuickStart

```bash
# 1. Clonar repo
git clone https://github.com/AndresAp01/BDI.git
cd BDI/Tarea01   # o la tarea

# 2. Levantar SQL Server con Docker
docker compose up -d

# 3. Verificar que el contenedor está healthy
docker ps --filter name=bdi_sqlserver

# 4. Crear/activar entorno virtual Python
python -m venv venv
source venv/bin/activate   #Linux/macOS
# venv\Scripts\activate    #Windows

# 5. Instalar dependencias
pip install -r requirements.txt

# 6. Ejecutar la app web
uvicorn app.main:app --host 0.0.0.0 --port 5000 --reload

# 7. Abrir en navegador
# Local: http://localhost:5000
# Tailscale: http://<tu-ip-tailscale>:5000
```

> **Nota:** Los scripts SQL en `scripts/` se ejecutan manualmente desde VS Code (extensión MSSQL) o `sqlcmd` la primera vez. Ver `scripts/01_crear_tabla.sql` → `05_sp_insertar_empleado.sql`.

---

## Estructura

```
BDI/
├── Pruebas/ # Experimentos, pruebas de concepto, sandbox
├── Tarea01/ # Primera tarea programada (Prueba de concepto)
│   ├── docker-compose.yml
│   ├── scripts/ # Scripts SQL (01–0x)
│   ├── app/ # FastAPI + Jinja2
│   │   ├── main.py
│   │   └── templates/ #html para la pagina
│   ├── bitacora.md #de la prog
│   └── requirements.txt
├── Tarea02/ # ()
├── Proyecto01/ # ()
└── docs/ # Documentos
```

> Cada tarea/proyecto es **autocontenido**: su propio `docker-compose.yml`, scripts, app y documentación.

---
## Stack

| Capa | Tecnología |
|------|------------|
| **Motor BD** | Microsoft SQL Server 2022 (en Docker) |
| **Orquestación** | Docker Compose |
| **Backend / API** | Python 3 + FastAPI + Uvicorn |
| **Driver BD** | pymssql |
| **Frontend (SSR)** | Jinja2 Templates (HTML + CSS vanilla) |
| **Validaciones UI** | Regex en Python + HTML5 |
| **Validaciones negocio** | Stored Procedures (T-SQL) |
| **Red colaborativa** | Tailscale (mesh VPN) |
| **Editor / IDE** | VS Code + extensión MSSQL |
| **Control de versiones** | Git + GitHub |
| **Bitácora** | Disponible en Blogger - Markdown en repo (`bitacora.md` por tarea) |

## Licencia / Uso académico

Este repositorio es **trabajo académico** para el curso Bases de Datos I (ITCR 2026).  
No se autoriza su uso comercial ni distribución sin consentimiento de los autores.

## Autores

| Nombre | GitHub | Rol |
|--------|--------|-----|
| **Luis Andrés Acuña Pérez** |[@AndresAp01](https://github.com/AndresAp01)|
| **[Compañera]** |[@usuario]|

---


