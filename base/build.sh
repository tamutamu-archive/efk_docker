#!/bin/bash

docker build -t efk_base . --build-arg HTTP_PROXY=${http_proxy}

