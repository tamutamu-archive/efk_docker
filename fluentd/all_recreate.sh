#!/bin/bash

docker-compose down
docker-compose rm --all
docker system prune

#docker build --no-cache=true -t fluentd . --build-arg HTTP_PROXY=${http_proxy} --build-arg HTTPS_PROXY=${http_proxy}

#docker-compose build --no-cache
#docker-compose up --build --force-recreate -d

