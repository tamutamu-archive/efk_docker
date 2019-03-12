FROM phusion/baseimage:0.11

ARG HTTP_PROXY=""

ENV http_proxy ${HTTP_PROXY}
ENV https_proxy ${HTTP_PROXY}

WORKDIR ./

COPY scripts/*.sh scripts/

RUN chmod 755 scripts/*.sh \
    && scripts/01-base.sh
