#!/bin/sh -x

echo -e ">>> enabling firewalld\n"
sudo systemctl enable firewalld
sudo systemctl start firewalld

echo -e ">>> opening port 80\n"
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent

echo -e ">>> opening port 443\n"
sudo firewall-cmd --zone=public --add-port=443/tcp --permanent

echo -e ">>> opening port 8025 for mailhog\n"
sudo firewall-cmd --zone=public --add-port=8025/tcp --permanent

sudo firewall-cmd --reload
