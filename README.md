# Descripción

Configuración de un docker local con los servicios:

- NGINX
- PHP-FPM
- MySQL

Adicionalmente, para configuración del propio contenedor, se levantan las imágenes de los servicios:

- Portainer

# Ejecución

Necesitaremos tener instalado y en ejecución Docker.

Para construir y levantar el contenedor, nos situamos en terminal dentro de la carpeta del proyecto y ejecutamos:

```bash
$ docker-compose up --build
```

# Configuración

## Variables de entorno

Se configuran en el archivo .env

## Mac

Para levantar el contenedor de MySQL en ordenadores Mac con procesador M1, se sobreescribe la plataforma del servicio mysql en el archivo docker-compose.override.yml
