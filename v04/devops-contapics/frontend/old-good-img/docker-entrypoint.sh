#!/bin/sh
envsubst < /usr/share/nginx/html/env.template.js > /usr/share/nginx/html/config.js
exec nginx -g "daemon off;"