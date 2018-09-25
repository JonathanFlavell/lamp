#!/usr/bin/env bash

# Install IUS Repositories
sudo yum install -y https://centos7.iuscommunity.org/ius-release.rpm

sudo yum groupinstall -y 'Development Tools'

sudo yum install -y git \
    lsof \
    nodejs \
    npm \
    ruby-devel \
    rubygems
