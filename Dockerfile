
FROM tonnyorg/laravel-fpm:1.1.0

EXPOSE 9001

# Install supervisor
RUN apt-get update && \
    apt-get install -y supervisor

# Remove FPM specific files and packages
RUN apt-get purge -y php7.4-fpm && \
    apt-get autoremove -y  && \
    rm -rf /run/php

# Need this directory so supervisor can start
RUN mkdir -p /var/log/supervisor
