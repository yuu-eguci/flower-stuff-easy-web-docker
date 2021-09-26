flower-stuff-easy-web-docker
===

## Description


## Installation

```bash
# Run docker.
docker-compose up -d

# Run flower-stuff-easy-web-vue.
docker-compose exec vue-service sh -c 'yarn install'
docker-compose exec vue-service sh -c 'yarn serve'

# Run flower-stuff-easy-web-django.
docker-compose exec django-service sh -c 'pipenv install'
docker-compose exec django-service sh -c 'pipenv run python manage.py migrate'
docker-compose exec django-service sh -c 'pipenv run python manage.py runserver 0.0.0.0:8000'
```
