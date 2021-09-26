FROM node:lts-alpine

WORKDIR /app

RUN apk update && \
    npm install && \
    npm install -g npm && \
    npm install -g vue-cli

# NOTE: このポートを解放する意図である、というドキュメントとして機能するコマンドです。
#       ポートを実際に解放するコマンドではありません。
EXPOSE 8080
