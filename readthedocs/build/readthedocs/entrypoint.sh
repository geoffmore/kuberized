#!/bin/bash
# Inspired By:
#   https://github.com/nextcloud/docker/blob/master/docker-entrypoint.sh
# script should generate if there does not exist a database/etc to do work from

. "./venv/bin/activate"

python manage.py migrate
python manage.py collectstatic
python manage.py createsuperuser \
  --no-input \
  --username "user" \
  --email "user@example.com"
  #--username "${RTD_USERNAME:=user}" \
  #--email "${RTD_EMAIL:=user@example.com}"
  # --database $DATABASE

# Give superuser password here
# https://stackoverflow.com/questions/6358030/how-to-reset-django-admin-password

if [ -n "${ELASTICSEACH_USER+x}" ] && [ -n "${ELASTICSEARCH_PASSWORD+x}" ] && [ -n "${ELASTICSEARCH_HOST+x}"]; then
    python manage.py provision_elasticsearch
    python manage.py reindex_elasticsearch
fi

if [ -n "${POSTGRES_DB+x}" ] && [ -n "${POSTGRES_USER+x}" ] && [ -n "${POSTGRES_PASSWORD+x}" ] && [ -n "${POSTGRES_HOST+x}" ]; then
    echo "Not Configured"
fi

if [ -n "${REDIS_USER+x}" ] && [ -n "${REDIS_PASSWORD+x}" ] && [ -n "${REDIS_HOST+x}" ]; then
    echo "Not Configured"
fi
python manage.py runserver 0.0.0.0:8000