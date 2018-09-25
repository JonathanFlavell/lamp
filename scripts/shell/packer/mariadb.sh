#!/bin/sh -x

# Install Databases
echo -e ">>> removing mariadb-libs\n"
sudo yum remove -y mariadb-libs

echo -e ">>> installing mariadb 10.1\n"
sudo yum install -y mariadb101u-server.x86_64

echo -e ">>> Enabling mariadb service on startup\n"
sudo systemctl enable mariadb
sudo service mariadb start

# mysql_'secure'_install
mysql -u root -e "UPDATE mysql.user SET Password=PASSWORD('') WHERE User='root';"
mysql -u root -e "DELETE FROM mysql.user WHERE User='';"
mysql -u root -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test_%' OR Db='test\_%';"
mysql -u root -e "DROP DATABASE test;"
mysql -u root -e "FLUSH PRIVILEGES;"

# Create user for host machines
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.33.%' IDENTIFIED BY '' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"

# Update group_concat_max_len global
mysql -u root -e "SET GLOBAL group_concat_max_len=10000;"
