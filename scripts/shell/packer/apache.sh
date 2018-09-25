#!/usr/bin/env bash

sudo yum install -y httpd \
    php72u \
    php72u-cli \
    php72u-common \
    php72u-fpm \
    php72u-gd \
    php72u-mbstring \
    php72u-opcache \
    php72u-pdo \
    php72u-mysqlnd \
    php72u-pecl-igbinary \
    php72u-pecl-memcached \
    php72u-process \
    php72u-xml \
    php72u-json \
    php72u-intl \
    mod_php72u \
    mod_ssl

mkdir -p /srv/sysconfig

echo -e "APPLICATION_ENV=vagrant\nDATABASE_SERVER=192.168.33.113" > /etc/sysconfig/httpd
echo -e "APPLICATION_ENV=vagrant\nDATABASE_SERVER=192.168.33.113" >> /home/vagrant/.bash_profile

sed -i "s/EnableSendfile on/EnableSendfile off/" /etc/httpd/conf/httpd.conf
