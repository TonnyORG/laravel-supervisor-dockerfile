
FROM tonnyorg/laravel-fpm:2.0.0

EXPOSE 9001

# Install supervisor
RUN apt-get update && \
    apt-get install -y supervisor

# Remove FPM specific files and packages
RUN apt-get purge -y php8.0-fpm && \
    apt-get autoremove -y  && \
    rm -rf /run/php

# Need this directory so supervisor can start
RUN mkdir -p /var/log/supervisor
