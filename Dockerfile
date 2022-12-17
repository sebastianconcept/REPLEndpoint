# Base image
FROM debian:11-slim as base
LABEL maintainer="sebastianconcept@gmail.com"
WORKDIR /opt/pharo
RUN set -eu; \
  apt-get update; \
  apt-get install --assume-yes --no-install-recommends \
  ca-certificates \
  ; \
  apt-get clean; \
  useradd --uid 7431 --gid 100 --home-dir /opt/pharo --no-create-home --no-user-group pharo; \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*; \
  printf '#!/bin/bash\n/opt/pharo/vm/pharo --headless "$@"' > /opt/pharo/pharo; \
  ln -s /opt/pharo/pharo /usr/local/bin/pharo; \
  chmod a+x /usr/local/bin/pharo; \
  chown 7431:100 /opt/pharo -R; \
  true

FROM alpine:3.12 as download-vm
RUN apk add unzip bash curl
WORKDIR /tmp/pharo
RUN curl https://get.pharo.org/vm100 | bash

# Add the vm into the base image
FROM base as vm
COPY --from=download-vm --chown=pharo:users /tmp/pharo/pharo-vm /opt/pharo/vm
RUN rm -rf /tmp/pharo
USER pharo

# Download pharo image
FROM download-vm as download-image
WORKDIR /opt/pharo/images
ADD http://files.pharo.org/get-files/100/pharo64.zip ./
RUN set -eu; \
  unzip pharo64.zip; \
  rm pharo64.zip; \
  mv ./*.image Pharo.image; \
  mv ./*.changes Pharo.changes; \
  true

# Copy image into the loader image and build the app
FROM vm as loader
COPY --from=download-image --chown=pharo:users /opt/pharo/images /opt/pharo/
RUN chmod a+w /opt/pharo
USER pharo
WORKDIR /opt/pharo/
COPY docker/build.st ./
COPY ./src ./src
RUN pharo Pharo.image build.st

# Copy the built image into the app image
FROM loader as app
WORKDIR /opt/pharo/
COPY --from=loader --chown=pharo:users /opt/pharo/ ./
COPY --chown=pharo:users docker/startup.st ./
ENV REPL_PORT=1853
EXPOSE $REPL_PORT
CMD [ "pharo", "Pharo.image", "./startup.st" ]