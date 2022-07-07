# participacion-estudiantes



## Integración MiUchile

Este template incluye el proyecto [django_sso](https://github.com/DCC-FCFM-UCHILE/django_sso) que corresponde a una integración que
permite utilizar las credenciales de MiUchile con este sistema.

Para poder utilizar esta funcionalidad en el ambiente de desarrollo (local o gitpod) debe enviar un correo a desarrollo@dcc.uchile.cl 
indicando los RUTs de los integrantes del equipo.

## Consideraciones

### Al clonar el repositorio

Al clonar un proyecto basado en este template recuerde hacerlo usando la opción `--recursive` para que se descargue junto con el submodulo django_sso.

```console
git clone --recursive git@github.com:DCC-FCFM-UCHILE/participacion-estudiantes.git
```

### Automatización

Este proyecto considera la automatización de algunas tareas al usar GitPod como ambiente de desarrollo, por ejemplo:

- Actualización automática de los requirements.
- Actualización automática de los submodules.
- Formateo automático usando PEP8 usando `black` y linter del código usando `flake8`.
- Modificación de los ALLOWED_HOSTS y CSRF_TRUSTED_ORIGINS en `core/settings/gitpod.py` (este archivo no debe ser commiteado!).
- Creación de un Django Admin con credenciales: desarrollo/desarroll0.

Estas automatizaciones se basan en rutas y nombres que deben ser actualizadas en `.gitpod/*.sh`.
 
Puede revisar cómo funcionan estas automatizaciones y otros comandos útiles en:

- .gitpod.yml
- .gitpod/*.sh
- app/Makefile

### Al correrlo de forma local con Docker

Este proyecto se encuentra configurado con Docker para levantar un ambiente local de desarrollo. El [Portal](https://portal.dcc.uchile.cl) es compatible para trabajar con Apps que funcionen en localhost, para más información contacte al Área de Desarrollo del DCC.

```console
dev@DCC ~/.docker/ $ docker-compose up -d --build
dev@DCC ~/.docker/ $ docker exec django python manage.py migrate
dev@DCC ~/.docker/ $ docker exec -it django python manage.py createsuperuser
```

## Colaboradoras y colaboradores del Proyecto

- Alejandro Torres - alejandro.torres.s@ug.uchile.cl
- Benjamín Avendaño - benjamin.avendano@ing.uchile.cl
- Benjamín Herrera - benjamin.herrera@ing.uchile.cl
- Camila Labarca - camila.labarca@ug.uchile.cl
- Germán Urrea - g.urrea.mansilla@gmail.com
- Mario Pineda - mario.pineda@ug.uchile.cl
- Monserrat Prado - monserrat.prado@ug.uchile.cl
- Ricardo Valdivia - Ricardo.valdivia22@gmail.com 
- Sebastián Contreras - scaphismm@gmail.com

