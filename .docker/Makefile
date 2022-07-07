# makefile

build:
	docker-compose --file dc-produccion.yml --project-name participacion-estudiantes up -d --build --force-recreate --remove-orphans
	docker ps

restart:
	docker restart participacion-estudiantes
	docker ps

update:
	git submodule update
	git stash
	git pull
	git stash pop

static:
	docker exec participacion-estudiantes python manage.py collectstatic --no-input

# loaddata:
# 	docker exec participacion-estudiantes make loaddata

# backup:
# 	docker exec participacion-estudiantes make backup

media:
	sudo cp -r ../media/* /home/instalar/media/participacion-estudiantes

migrate:
	docker exec participacion-estudiantes python manage.py migrate

ssh:
	docker exec -it participacion-estudiantes bash

deploy:
	make update
	make build
	make migrate
	# make loaddata
	make static
	make media
	make restart

_secret:
	./app/secret.sh

__media:
	sudo cp -r ../media/* /home/instalar/media/participacion-estudiantes/