FROM python:3.8-slim-bookworm

WORKDIR /app

# この段階ではまだ mount されていません。 pipenv install -r ./requirements.txt は不可です。
RUN pip install --no-cache-dir pipenv==2024.0.1

# NOTE: このポートを解放する意図である、というドキュメントとして機能するコマンドです。
#       ポートを実際に解放するコマンドではありません。
EXPOSE 8000
