#!/bin/bash
envsubst '$RADAR_SHEET_URL' < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf
exec nginx -g 'daemon off;'
