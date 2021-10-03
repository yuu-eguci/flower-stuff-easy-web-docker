FROM python:3.8.12-slim-buster

WORKDIR /app

RUN apt update && \
    pip install --upgrade pip && \
    pip install pipenv

# NOTE: このポートを解放する意図である、というドキュメントとして機能するコマンドです。
#       ポートを実際に解放するコマンドではありません。
EXPOSE 8000
