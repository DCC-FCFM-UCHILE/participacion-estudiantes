# /bin/bash

echo BEFORE

cd /workspace/participacion-estudiantes/app
pip install --upgrade pip
pip install -r _requirements/base.txt -r _requirements/develop.txt
pur -r _requirements/base.txt
pur -r _requirements/production.txt
