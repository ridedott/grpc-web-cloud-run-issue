# cspell:ignore chmod, entrypoint, envoyproxy, gettext

FROM envoyproxy/envoy:v1.18.3

RUN apt-get update && \
  apt-get --quiet install --assume-yes --no-install-recommends gettext && \
  rm -rf /var/lib/apt/lists/*

COPY ./envoy.template.yaml /etc/envoy/envoy.template.yaml
COPY ./entrypoint.sh /usr/local/bin/entrypoint

RUN chmod 500 /usr/local/bin/entrypoint

ENV ENVOY_UID 0
ENV PORT 8080

CMD [ "/usr/local/bin/entrypoint" ]
