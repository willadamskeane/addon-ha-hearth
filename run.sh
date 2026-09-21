#!/usr/bin/with-contenv bashio

# The server proxies /api/ and /local/ over the Supervisor network, while the
# browser receives a public Home Assistant origin derived from trusted Ingress
# headers (or from this optional direct-port mapping).
export ADDON="true"
export HASS_PORT="$(bashio::core.port)"
export HASS_URL="http://homeassistant:${HASS_PORT}"
export EXPOSED_PORT="$(bashio::addon.port "8099/tcp")"

echo "Starting Hearth..."

node server.js
