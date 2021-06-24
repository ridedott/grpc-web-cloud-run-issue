#!/usr/bin/env sh

# cspell:ignore envsubst

set -e

echo "Generating envoy.yaml configuration file..."
cat /etc/envoy/envoy.template.yaml | envsubst \$PORT >/etc/envoy/envoy.yaml

echo "Starting Envoy..."
/usr/local/bin/envoy --config-path /etc/envoy/envoy.yaml --disable-hot-restart
