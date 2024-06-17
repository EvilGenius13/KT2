#!/bin/bash

cd "$(dirname "$0")/.."

docker build -t "dev-build_app" .

docker tag "dev-build_app" "evilgenius13/kt2:prod"

docker push "evilgenius13/kt2:prod"