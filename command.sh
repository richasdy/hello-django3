#!/bin/sh

mkdir django3
cd django3
touch .gitignore
touch requirements.txt
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt