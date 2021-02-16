#!/bin/bash
sudo apt install apache2 -y
sudo apt install mysql-server -y
sudo apt install php libapache2-mod-php php-mysql -y
sudo apt install php-curl php-json php-cgi php-gd php-zip php-mbstring php-xml php-xmlrpc -y

sudo ufw allow in 80/tcp -y

sudo mysql_secure_installation

#create passwd
PASSWDDB="$(openssl rand -base64 12)"
#create username
MAINDB=${USER_NAME//[^a-zA-Z0-9]/_}
#create database
mysql -e "CREATE DATABASE ${MAINDB} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
mysql -e "CREATE USER ${MAINDB}@localhost IDENTIFIED BY '${PASSWDDB}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MAINDB}.* TO '${MAINDB}'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"
