FROM efk_base:latest


WORKDIR ./

COPY scripts/*.sh scripts/

RUN chmod 755 scripts/*.sh \
    && scripts/01-fluentd.sh
