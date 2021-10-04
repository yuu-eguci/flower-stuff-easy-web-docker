flower-stuff-easy-web-docker
===

## Description

 🐳 Dev environment for flower-stuff-easy-web project. It starts Vue and Django projects in Docker containers.

- flower-stuff-easy-web-vue([https://github.com/yuu-eguci/flower-stuff-easy-web-vue](https://github.com/yuu-eguci/flower-stuff-easy-web-vue))
- flower-stuff-easy-web-django([https://github.com/yuu-eguci/flower-stuff-easy-web-django](https://github.com/yuu-eguci/flower-stuff-easy-web-django))

## Installation

### Prerequisites

- Docker Desktop([https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop))
- Clone this repository itself

### 1. Start Docker Desktop

Start it.

### 2. Clone Vue and Django repositories

Run commands below in flower-stuff-easy-web-docker repository.

```bash
mkdir app && \
git clone git@github.com:yuu-eguci/flower-stuff-easy-web-vue.git ./app/flower-stuff-easy-web-vue && \
git clone git@github.com:yuu-eguci/flower-stuff-easy-web-django.git ./app/flower-stuff-easy-web-django
```

### 3. Start docker containers

```bash
# In flower-stuff-easy-web-docker repository.
docker-compose up -d
```

### 4. Up flower-stuff-easy-web-vue

```bash
docker-compose exec vue-service sh -c 'yarn install' && \
docker-compose exec vue-service sh -c 'yarn serve'
```

Then open [http://localhost:8080/flower-stuff-easy-web-vue/](http://localhost:8080/flower-stuff-easy-web-vue/)

### 5. Up flower-stuff-easy-web-django

In **another terminal**

```bash
docker-compose exec django-service sh -c 'pipenv run pip install -r requirements.txt' && \
docker-compose exec django-service sh -c 'pipenv run python manage.py migrate' && \
docker-compose exec django-service sh -c 'pipenv run python manage.py runserver 0.0.0.0:8000'
```

Then open [http://localhost:8000/](http://localhost:8000/)

### 6. Finish development

```bash
docker-compose down
```
