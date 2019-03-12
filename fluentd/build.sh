#!/bin/bash

docker build -t fluentd . --build-arg HTTP_PROXY=${http_proxy}

