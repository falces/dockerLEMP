# Descripción

Contenedores Docker incluidos en la aplicación:

- Servidor web NGINX
- Intérprete PHP-FPM
- Base de datos:
  - MySQL
- Portainer
- PHPMyAdmin

# Instalación

Crear una carpeta (myFolder) donde tendremos la carpeta con nuestro código y la carpeta con este proyecto docker y nos situamos dentro de esta carpeta:

```bash
$ mkdir myFolder
$ cd myFolder
```

Clonamos este proyecto y nos ubicamos dentro de la carpeta creada:

```bash
# SSH
$ git clone git@github.com:falces/dockerLEMP.git
# Opcionalmente podemos indicar un nombre de carpeta destino diferente:
$ git clone git@github.com:falces/dockerLEMP.git docker
$ cd docker
```

Creamos un archivo `.env` a partir de la plantilla incluida `.env.template`:

```bash
$ cp .env.template .env
```

Editamos el archivo `.env`, prestando especial atención a los apartados APP y PORTS, donde daremos el nombre de nuestra aplicación, el nombre de la carpeta donde se contendrá y el prefijo para el nombre de los contenedores, así como los puertos a través de los cuales accederemos a los contenedores, que no deben coincidir con otros puertos que podamos tener expuestos en otras aplicaciones.

APP_FOLDER es el nombre de la carpeta donde tendremos nuestro código, dentro de myFolder en este ejemplo:

```bash
#!/usr/bin/env bash

# APP
COMPOSE_PROJECT_NAME=myTest
PROJECT_PREFIX=mt_
APP_NAME=myTest
APP_FOLDER=mySymfony
# Access via thisDomainName.local (add in /etc/hosts):
NGINX_BACKEND_DOMAIN=mySymfony

# PORTS
PUBLIC_WEB_PORT=8010
MYSQL_PORT=8011
PHPMYADMIN_PORT=8012
PORTAINER_PORT=8013
```

Editar esta línea del archivo de configuración del sitio en Nginx `/docker/nginx/conf/site.conf`:

```bash
# Edit this root folder
root            /var/www/public;
```

Por defecto apunta a la carpeta public que tendremos dentro de la carpeta de código de nuestro proyecto si, por ejemplo, esta fuera a usar Symfony. Si queremos que la raíz del proyecto sea también la raíz de nuestra carpeta de código, modificaremos:

```bash
# Edit this root folder
root            /var/www;
```

Para instalar Symfony nos situamos en la carpeta myFolder y ejecutamos:

```bash
# Con Symfony-CLI:
$ symfony new mySymfony --version=5.4

# Con Composer:
$ composer create-project symfony/skeleton:"^5.4" mySymfony

# Si queremos crear una web en lugar de una API, añadimos:
$ composer require webapp
```

La estructura de carpetas en este ejemplo quedaría así:

```
myFolder
  ↳ docker
  ↳ mySymfony
    ↳ ...
    ↳ public
    ↳ ...
```

## Docker Compose en Mac con procesador M1

En el archivo docker-compose.override.yml se incluye una línea para adaptar la instalación de MySQL a la arquitectura del procesador M1. Si no se usa este tipo de procesador u ordenador, eliminar este archivo.

# Ejecución

Necesitaremos tener instalado y en ejecución Docker.

Para construir y levantar el contenedor, nos situamos en terminal dentro de la carpeta del proyecto y ejecutamos:

```bash
$ docker-compose up --build -d
```
