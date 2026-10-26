flower-stuff-easy-web-docker
===

![](https://img.shields.io/badge/-Python-F9DC3E.svg?logo=python&style=for-the-badge) ![](https://img.shields.io/badge/-Django-092E20.svg?logo=django&style=for-the-badge) ![](https://img.shields.io/badge/-Vue.js-96FF33.svg?logo=vue.js&style=for-the-badge) ![](https://img.shields.io/badge/-Docker-1488C6.svg?logo=docker&style=for-the-badge) ![](https://img.shields.io/badge/-Github-181717.svg?logo=github&style=for-the-badge) ![](https://img.shields.io/badge/-Azure%20App%20Service-0078D7.svg?logo=azure-devops&style=for-the-badge) ![](https://img.shields.io/badge/-Linux-000000.svg?logo=linux&style=for-the-badge)

![flower-stuff-easy-web トップ画像](https://user-images.githubusercontent.com/28250432/137093980-3fdaa06d-7bde-4d89-b65b-de49a2a0fe01.png)

## Description

 🐳 Dev environment for flower-stuff-easy-web project. It starts Vue and Django projects in Docker containers.

- flower-stuff-easy-web-vue([https://github.com/yuu-eguci/flower-stuff-easy-web-vue](https://github.com/yuu-eguci/flower-stuff-easy-web-vue))
- flower-stuff-easy-web-django([https://github.com/yuu-eguci/flower-stuff-easy-web-django](https://github.com/yuu-eguci/flower-stuff-easy-web-django))

## Installation

### Prerequisites

- Docker Desktop([https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop)) with the Docker Compose plugin (`docker compose`)
- Assure that you can connect to GitHub using SSH ([https://docs.github.com/ja/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent](https://docs.github.com/ja/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent))

If your machine is Windows ...

- Git Bash ([https://gitforwindows.org/](https://gitforwindows.org/))

### 1. Start Docker Desktop

Start it.

### 2. Clone relevant repositories this repository

```bash
git clone git@github.com:yuu-eguci/flower-stuff-easy-web-docker.git && \
cd flower-stuff-easy-web-docker && \
git clone git@github.com:yuu-eguci/flower-stuff-easy-web-vue.git ./app/flower-stuff-easy-web-vue && \
git clone git@github.com:yuu-eguci/flower-stuff-easy-web-django.git ./app/flower-stuff-easy-web-django
```

### 3. Up docker containers

```bash
# In flower-stuff-easy-web-docker repository.
docker compose up -d
```

### 4. Up flower-stuff-easy-web-vue

```bash
docker compose exec vue-service sh -c 'yarn install' && \
docker compose exec vue-service sh -c 'yarn serve'
```

### 5. Up flower-stuff-easy-web-django

In **another terminal**

```bash
cd flower-stuff-easy-web-docker && \
# The Dockerfile installs only pipenv because the app is mounted at runtime.
docker compose exec django-service sh -c 'pipenv install' && \
docker compose exec django-service sh -c 'pipenv run python ./app/download_hdf5.py' && \
docker compose exec django-service sh -c 'pipenv run python manage.py runserver 0.0.0.0:8000'
```

> [!WARNING]
> As of October 2026, the trained model on Google Drive (`APP_HDF5_DRIVE_ID`) returns 404.
> `download_hdf5.py` still finishes, but saves an HTML error page as `app/hdf5.hdf5`.
> Delete that file (`rm ./app/flower-stuff-easy-web-django/app/hdf5.hdf5`) or skip the download step.
> Sign-in works without the model, but image prediction does not.

### 6. Open web page

- [http://localhost:8080/flower-stuff-easy-web-vue/](http://localhost:8080/flower-stuff-easy-web-vue/)

### 7. Finish development

```bash
docker compose down
```

## Notes on pinned versions

The related repositories have not changed since 2021, so the containers pin versions that match them.

- `vue-container` uses `node:16-alpine`. flower-stuff-easy-web-vue (Vue CLI 4.5) fails to build on Node 18, and its CI tests Node 12 to 16.
- `django-container` uses `python:3.8-slim-bookworm` because the Pipfile requires Python 3.8.
- `django-service` runs as `linux/amd64` because TensorFlow 2.6.0 provides x86_64 wheels only. On Apple Silicon, Docker Desktop emulates it, so `pipenv install` takes a few minutes.
