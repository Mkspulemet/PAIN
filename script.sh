#!/bin/bash

sudo apt update

sudo apt install apache2 -y
sudo apt install mysql-server -y
sudo apt install php libapache2-mod-php php-mysql -y
sudo apt install php-curl php-json php-cgi php-gd php-zip php-mbstring php-xml php-xmlrpc -y

sudo ufw allow in 80/tcp -y

sudo touch /etc/apache2/sites-availeble/bin.by.conf

sudo echo "<virtualHost *:80>" > /etc/apache2/sites-available/bin.by.conf
sudo echo "	ServerName bin.by" > /etc/apache2/sites-available/bin.by.conf
sudo echo "	ServerAdmin webmaster@host" > /etc/apache2/sites-available/bin.by.conf
sudo echo "	DocumentRoot /var/www/bin.by" > /etc/apache2/sites-available/bin.by.conf
sudo echo "	ErrorLog \${APACHE_LOG_DIR}/$errlog.log" > /etc/apache2/sites-available/bin.by.conf
sudo echo "	CustomLog \${APACHE_LOG_DIR}/$acclog.log combined" > /etc/apache2/sites-available/bin.by.conf
sudo echo "</VirtualHost>" > /etc/apache2/sites-available/bin.by.conf


sudo wget https://ru.wordpress.org/latest-ru_RU.zip
sudo unzip latest-ru_RU.zip -d /var/www/
sudo mv /var/www/wordpress/ /var/www/bin.by/

sudo mysql_secure_installation

mysql  -e "CREATE DATABASE PULEMET"
mysql  -e "CREATE USER mkspulemet@localhost IDENTIFIED BY '07071989';"
mysql  -e "GRANT ALL PRIVILEGES ON mkspulemet.* TO 'mkspulemet'@'localhost';"
mysql  -e "FLUSH PRIVILEGES;"


sudo wget https://ru.wordpress.org/latest-ru_RU.zip
sudo unzip latest-ru_RU.zip -d /var/www/
sudo mv /var/www/wordpress/ /var/www/bin.by/

sudo a2ensite bin.by.conf
sudo service apache2 restart
