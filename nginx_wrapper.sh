#!/bin/bash
if [ -z ${RESOURCE_BUCKET} ]; then
  echo get images from S3
  aws s3 sync $(RESOURCE_BUCKET)${RESOURCE_BUCKET_PATH}/ /usr/share/nginx/html/
fi
envsubst < /etc/nginx/conf.d/mysite.template > /etc/nginx/conf.d/default.conf
nginx -g 'daemon off;'
