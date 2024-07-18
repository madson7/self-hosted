ARG BASE_IMAGE
FROM ${BASE_IMAGE}

COPY ./config.yml .relay/

RUN relay credentials generate --stdout > credentials.json && \
    mv credentials.json .relay/credentials.json
