#!/bin/sh

mkdir django3
cd django3
touch .gitignore
touch requirements.txt
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
django-admin startproject django3 .
python manage.py runserver
# http://127.0.0.1:8000
# http://127.0.0.1:8000/admin
python manage.py migrate
python manage.py createsuperuser
# http://127.0.0.1:8000/admin login admin/admin
