#!/bin/bash

docker build --no-cache=true -t efk_base:latest . --build-arg HTTP_PROXY=${http_proxy}

