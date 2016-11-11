FROM ubuntu:xenial
MAINTAINER Matteo Fortini <matteo.fortini@gmail.com>

# Install required software
RUN apt-get update && \
    apt-get install -y git nginx npm ruby-dev libcurl3
RUN npm install -g github-webhook
RUN gem install bundle

# Configure installed software
RUN ln -s /usr/bin/nodejs /usr/bin/node && \
    echo "daemon off;" >> /etc/nginx/nginx.conf

# Add configuration files & scripts
COPY * /
RUN mkdir /source /site && \
    chmod +x /*.sh

EXPOSE 80
CMD ["/run.sh"]

