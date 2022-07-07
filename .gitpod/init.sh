# /bin/bash

echo INIT

git submodule sync
git submodule foreach git checkout main
git submodule foreach git pull

cd /workspace/participacion-estudiantes
cp app/core/settings/gitpod.py app/core/settings/gitpod-tmp.py

echo "# /bin/bash
" > .gitpod/env.sh

cat .docker/app/.env | while read -r line
do
    [ -z "$line" ] && continue
    echo "export $line" >> .gitpod/env.sh
done
chmod +x .gitpod/env.sh

rm /workspace/participacion-estudiantes/app/sso
ln -s /workspace/participacion-estudiantes/django_sso/app/sso /workspace/participacion-estudiantes/app/sso

export GITPOD_HOST=`gp url | sed "s|https://||"`
sed -i "s|GITPOD_HOST|8000-$GITPOD_HOST|g" app/core/settings/gitpod-tmp.py
sed -i "s|GITPOD_URL|https://8000-$GITPOD_HOST|g" app/core/settings/gitpod-tmp.py
sed -i "s|core.settings.production|core.settings.gitpod-tmp|g" .gitpod/env.sh
sed -i "s|http://localhost:8000|https://8000-$GITPOD_HOST|g" .gitpod/env.sh
source .gitpod/env.sh

psql -U gitpod -c "SELECT 1 FROM pg_database WHERE datname = 'participacion_estudiantes'" | grep -q 1 || psql -U gitpod -c "CREATE DATABASE participacion_estudiantes"

cd /workspace/participacion-estudiantes/app
python manage.py migrate
echo "from django.contrib.auth.models import User; User.objects.create_superuser('desarrollo', '', 'desarroll0')" | python manage.py shell