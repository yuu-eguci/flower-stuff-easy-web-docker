flower-stuff-easy-web-docker
===

## Description

 🐳 Dev environment for flower-stuff-easy-web project. It starts Vue and Django projects in Docker containers.

- flower-stuff-easy-web-vue([https://github.com/yuu-eguci/flower-stuff-easy-web-vue](https://github.com/yuu-eguci/flower-stuff-easy-web-vue))
- flower-stuff-easy-web-django([https://github.com/yuu-eguci/flower-stuff-easy-web-django](https://github.com/yuu-eguci/flower-stuff-easy-web-django))

## Installation

### Prerequisites

- Docker Desktop([https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop))
- Assure that you can connect to GitHub using SSH ([https://docs.github.com/ja/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent](https://docs.github.com/ja/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent))

If your machine is Windows ...

- Git Bash ([https://gitforwindows.org/](https://gitforwindows.org/))

### 1. Start Docker Desktop

Start it.

### 2. Clone relevant repositories this repository

```bash
git clone git@github.com:yuu-eguci/flower-stuff-easy-web-docker.git && \
mkdir ./flower-stuff-easy-web-docker/app && \
git clone git@github.com:yuu-eguci/flower-stuff-easy-web-vue.git ./app/flower-stuff-easy-web-vue && \
git clone git@github.com:yuu-eguci/flower-stuff-easy-web-django.git ./app/flower-stuff-easy-web-django && \
cd flower-stuff-easy-web-docker
```

### 3. Up docker containers

```bash
# In flower-stuff-easy-web-docker repository.
docker-compose up -d
```

### 4. Up flower-stuff-easy-web-vue

```bash
docker-compose exec vue-service sh -c 'yarn install' && \
docker-compose exec vue-service sh -c 'yarn serve'
```

### 5. Up flower-stuff-easy-web-django

In **another terminal**

```bash
# Although already run "pipenv install" in Dockerfile, run this again for new libraries added.
docker-compose exec django-service sh -c 'pipenv install' && \
docker-compose exec django-service sh -c 'pipenv run python manage.py runserver 0.0.0.0:8000'
```

### 6. Open web page

- [http://localhost:8080/flower-stuff-easy-web-vue/](http://localhost:8080/flower-stuff-easy-web-vue/)

### 7. Finish development

```bash
docker-compose down
```

## tips for django

### Command

```bash
docker-compose exec django-service sh -c 'pipenv run python ./app/download_hdf5.py'
```
