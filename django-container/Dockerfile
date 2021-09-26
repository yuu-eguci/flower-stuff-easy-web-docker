FROM python:3.7-alpine

WORKDIR /app

RUN apk update && \
    pip install --upgrade pip && \
    pip install pipenv

# NOTE: このポートを解放する意図である、というドキュメントとして機能するコマンドです。
#       ポートを実際に解放するコマンドではありません。
EXPOSE 8000
