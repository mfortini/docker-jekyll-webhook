FROM debian:buster-slim
MAINTAINER Matteo Fortini <matteo.fortini@gmail.com>

# Install required software
RUN apt-get update && \
    apt-get install -y git nginx ruby-dev libcurl4 zlib1g-dev curl build-essential
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g github-webhook
RUN gem install bundle
RUN apt-get clean

# Configure installed software
#RUN ln -s /usr/bin/nodejs /usr/bin/node && \
#    echo "daemon off;" >> /etc/nginx/nginx.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Add configuration files & scripts
COPY * /
COPY gzip.conf /etc/nginx/conf.d/
RUN mkdir /source /site && \
    chmod +x /*.sh
EXPOSE 80
CMD ["/run.sh"]

