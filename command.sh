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
python manage.py collectstatic
gunicorn django3.wsgi
daphne django3.asgi
python manage.py startapp news
python manage.py makemigrations
python manage.py migrate
python manage.py startapp polls
python manage.py makemigrations polls
python manage.py sqlmigrate polls 0001
python manage.py migrate
python manage.py shell
# -------- model -------- #
# from polls.models import Choice, Question
# Question.objects.all()
# Question.objects.filter(id=1)
# Question.objects.filter(question_text__startswith='What')
# from django.utils import timezone
# current_year = timezone.now().year
# Question.objects.get(pub_date__year=current_year)
# Question.objects.get(id=2)
# Question.objects.get(pk=1)
# q = Question.objects.get(pk=1)
# q.was_published_recently()
# q = Question.objects.get(pk=1)
# q.choice_set.all()
# q.choice_set.create(choice_text='Not much', votes=0)
# q.choice_set.create(choice_text='The sky', votes=0)
# c = q.choice_set.create(choice_text='Just hacking again', votes=0)
# c.question
# q.choice_set.all()
# q.choice_set.count()
# Choice.objects.filter(question__pub_date__year=current_year)
# c = q.choice_set.filter(choice_text__startswith='Just hacking')
# c.delete()
# -------- model -------- #
python manage.py test polls
python manage.py shell
# -------- test -------- #
# from django.test import Client
# client = Client()
# response = client.get('/')
# response.status_code
# from django.urls import reverse
# response = client.get(reverse('polls:index'))
# response.status_code
# response.content
# response.context['latest_question_list']
# -------- test -------- #
python setup.py sdist

python -m pip install django3-polls-richasdy/dist/django3-polls-richasdy-0.1.tar.gz
pip install django3-polls-richasdy-0.1.tar.gz
python -c "import django3-polls-richasdy; print(django3-polls-richasdy.__path__)" #error
pip show django3-polls-richasdy

python -m pip uninstall django3-polls-richasdy