#!/bin/sh -x

echo -e ">>> enabling firewalld\n"
sudo systemctl enable firewalld
sudo systemctl start firewalld

# Open ports
echo -e ">>> opening port 3306 for mysql users\n"
sudo firewall-cmd --zone=public --add-service=mysql --permanent
sudo firewall-cmd --zone=public --add-port=3306/tcp --permanent

sudo firewall-cmd --reload
