flower-stuff-easy-web-docker
===

## Description


## Installation

### Prerequisites

- Docker Desktop([https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop))

### 1. Start Docker Desktop

Start it.

### 2. Start docker containers

```bash
# In flower-stuff-easy-web-docker repository.
docker-compose up -d
```

### 3. Up  flower-stuff-easy-web-vue

```bash
docker-compose exec vue-service sh -c 'yarn install' && \
docker-compose exec vue-service sh -c 'yarn serve'
```

### 4. Up flower-stuff-easy-web-django

```bash
docker-compose exec django-service sh -c 'pipenv install' && \
docker-compose exec django-service sh -c 'pipenv run python manage.py migrate' && \
docker-compose exec django-service sh -c 'pipenv run python manage.py runserver 0.0.0.0:8000'
```
