FROM nginx:1.10
RUN apt-get update && apt-get install -y python-pip
RUN pip install --upgrade awscli
COPY index.html /usr/share/nginx/html/
COPY mysite.template /etc/nginx/conf.d/
# Add a dummy test path to simplify local testing
ENV SERVICE_PATH testpath
ENV LINK_SERVER_NAME www.example.com
CMD /bin/bash -c "envsubst < /etc/nginx/conf.d/mysite.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
