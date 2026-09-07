## Bitacora 
Para llevar la cuenta de lo aprendido y como me organizo en el curso. 
La cuenta de los días trabajados lo llevará Git y GitHub.

MSSQL
Docker
Python - FastAPI Flask
VSCode

SQLServer es donde viven los datos, las tablas. 
Docker es una caja cerrada para que vivan aplicaciones, (como SQLServer) para que corra igual en cualquier computadora, sin instalarlo directamente en tu sistema.
    docker-compose.yml es la lista de instrucciones que le dice a Docker qué cajas (contenedores) levantar y cómo.
Python/FastAPI es el lenguaje que usaremos para escribir el programa que se habla con la base de datos
Tailscale es una red privada segura

1. En VSCode, se instala MSSQL Una extension para bases de datos.

2. Se crea una carpeta en algun lado de la PC 
En mi caso: `/home/andres/Dev/BasesDatosI`contiene la carpeta principal del curso, `/home/andres/Dev/BasesDatosI/BDI/Pruebas` es donde voy a trabajar los contenedores.
Para esta primera tarea: '/home/andres/Dev/BasesDatosI/BDI/Tarea01'
3. Se abre una terminal en la ubicacion del primer ejercicio o proyecto, y se ejecuta docker

4. Se crea un archivo .yml que es como un lienzo para ejecutar la BD Y Crear una carpeta llamada scripts para que Docker no la cree con permisos de root
5. En la terminal: 

```bash
docker compose up -d
docker ps   # se debería ver bd1-sqlserver como "Up"
```
/home/andres/Dev/BasesDatosI/BDI/Tarea01/recursos_bitacora/dockerps.png

1. Se abren las conexiones en VS Code
    1. En la barra lateral izquierda de VS Code va a aparecer un ícono nuevo (un cilindro/base de datos) — es el panel de MSSQL. Click ahí.
    2. **Crear una nueva conexión**
    
    Click en "Add Connection" (o el `+`) y llena: