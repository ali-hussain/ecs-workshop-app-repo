#!/bin/bash
aws s3 sync $(RESOURCE_BUCKET)${RESOURCE_BUCKET_PATH}/ /usr/share/nginx/html/
envsubst < /etc/nginx/conf.d/mysite.template > /etc/nginx/conf.d/default.conf
nginx -g 'daemon off;'
