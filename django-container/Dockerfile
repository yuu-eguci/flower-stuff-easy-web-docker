FROM python:3.8.12-slim-buster

WORKDIR /app

# この段階ではまだ mount されていません。 pipenv install -r ./requirements.txt は不可です。
RUN apt update && \
    pip install --upgrade pip && \
    pip install pipenv

# NOTE: このポートを解放する意図である、というドキュメントとして機能するコマンドです。
#       ポートを実際に解放するコマンドではありません。
EXPOSE 8000
