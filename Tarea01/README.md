# Tarea 01 — Prueba de Concepto (BD + App Web + SPs)

**Curso:** Bases de Datos I — ITCR 2026  
**Profesor:** Franco Quirós
**Fecha de entrega:** Lunes 7 de septiembre 2026  
**Equipo:** Luis Andrés Acuña Pérez + [Compañera]

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
