#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

for repo in flower-stuff-easy-web-vue flower-stuff-easy-web-django; do
  if [ ! -d "app/$repo" ]; then
    echo "app/$repo not found. Clone it first (README step 2)." >&2
    exit 1
  fi
done

for dockerfile in vue-container/Dockerfile django-container/Dockerfile; do
  docker run --rm -i hadolint/hadolint:v2.12.0 < "$dockerfile"
done

docker compose up --detach --build

docker compose exec -T vue-service sh -c 'yarn install --frozen-lockfile && yarn lint && yarn test:unit'
docker compose exec -T django-service sh -c 'pipenv install --deploy && pipenv run python manage.py check'

echo "Smoke test passed."
