# Tarea 01 — Prueba de Concepto (BD + App Web + SPs)

**Curso:** Bases de Datos I — ITCR 2026 \
**Profesor:** Franco Quirós \
**Fecha de entrega:** Lunes 7 de septiembre 2026 \
**Equipo:** Luis Andrés Acuña Pérez + [Compañera]

<p align="center">
  <a href="#bitacora.md">Bitacora</a>
</p>

## Objetivos

- Implementar ambiente de desarrollo colaborativo (2 estaciones + servidor BD compartido) (Listo)
- App web simple que consulta e inserta en BD vía Stored Procedures 
- Validaciones de formato en UI, validaciones de negocio en SP (Listo)
- Grid de empleados ordenado alfabéticamente (Listo)
- Formulario "Insertar Empleado" con validación y feedback (Listo)

## Arquitectura

```
Browser (Tailscale) ──────► HTTP-HTML-JINJA2 ──────► FastAPI (Python) ──────► TDS ──────►  SQL Server (Docker)

```
---
## Inicio rápido / Quickstart

```bash
# 1. Clonar repo
git clone https://github.com/AndresAp01/BDI.git
cd BDI/Tarea01

# 2. Levantar SQL Server con Docker
docker compose up -d

# 3. Verificar que el contenedor está healthy
docker ps --filter name=bdi_sqlserver

# 4. Crear/activar entorno virtual Python
python -m venv venv
source venv/bin/activate #Linux/macOS
# venv\Scripts\activate #Windows

# 5. Instalar dependencias
pip install -r requirements.txt

# 6. Ejecutar la app web
uvicorn app.main:app --host 0.0.0.0 --port 5000 --reload

# 7. Abrir en navegador
# Local: http://localhost:5000
# Tailscale: http://<ip-tailscale>:5000
```