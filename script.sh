#!/bin/bash
sudo apt install apache2 -y
sudo apt install mysql-server -y
sudo apt install php libapache2-mod-php php-mysql -y
sudo apt install php-curl php-json php-cgi php-gd php-zip php-mbstring php-xml php-xmlrpc -y

sudo ufw allow in 80/tcp -y

sudo mysql_secure_installation

