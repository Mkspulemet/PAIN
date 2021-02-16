#!/bin/bash

sudo apt update

sudo apt install apache2 -y
sudo apt install mysql-server -y
sudo apt install php libapache2-mod-php php-mysql -y
sudo apt install php-curl php-json php-cgi php-gd php-zip php-mbstring php-xml php-xmlrpc -y


sudo touch /etc/apache2/sites-available/bin.by.conf

echo "<VirtualHost *:80>" | sudo tee a /etc/apache2/sites-available/bin.by.conf
echo "	ServerName bin.by" | sudo tee -a /etc/apache2/sites-available/bin.by.conf
echo "	ServerAdmin webmaster@host" | sudo tee -a /etc/apache2/sites-available/bin.by.conf
echo "	DocumentRoot /var/www/bin.by" | sudo tee -a /etc/apache2/sites-available/bin.by.conf
echo "	ErrorLog \${APACHE_LOG_DIR}/errlog.log" | sudo tee -a /etc/apache2/sites-available/bin.by.conf
echo "	CustomLog \${APACHE_LOG_DIR}/acclog.log combined" | sudo tee -a /etc/apache2/sites-available/bin.by.conf
echo "</VirtualHost>" | sudo tee -a /etc/apache2/sites-available/bin.by.conf


sudo wget https://ru.wordpress.org/latest-ru_RU.zip
sudo unzip latest-ru_RU.zip -d /var/www/
sudo mv /var/www/wordpress/ /var/www/bin.by/

sudo mysql_secure_installation

mysql  -u root -e "CREATE DATABASE pulemet;"
mysql  -u root -e "CREATE USER mkspulemet@localhost IDENTIFIED BY '07071989';"
mysql  -u root -e "GRANT ALL PRIVILEGES ON pulemet.* TO 'mkspulemet'@'localhost';"
mysql  -u root -e "FLUSH PRIVILEGES;"

sudo chown -R www-data:www-data /var/www/bin.by/
sudo a2ensite bin.by.conf
sudo service apache2 restart
# bye
