#!/bin/bash

sudo apt update

sudo apt install apache2 -y
sudo apt install mysql-server -y
sudo apt install php libapache2-mod-php php-mysql -y
sudo apt install php-curl php-json php-cgi php-gd php-zip php-mbstring php-xml php-xmlrpc -y

sudo ufw allow in 80/tcp -y

sudo mysql_secure_installation


mysql -e "CREATE DATABASE PULEMET"
mysql -e "CREATE USER mkspulemet@localhost IDENTIFIED BY '07071989';"
mysql -e "GRANT ALL PRIVILEGES ON mkspulemet.* TO 'mkspulemet'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"
