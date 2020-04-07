#!/bin/bash

read -p "? This script will install MySQL on your device. Are you ready (y/n)?" cmsg

if [ "$cmsg" = "Y" -o "$cmsg" = "y" ]; then
    echo "- GeniSysAI installing MySQL"
    echo "! Make sure you keep note of all passwords etc you create."
    sudo apt-get install mysql-server
    sudo mysql_secure_installation
    read -p "! Enter your mysql root password specified during set up:" rpassword
    read -p "! Enter a new phpMyAdmin database user:" dbusername
    read -p "! Enter a new phpMyAdmin database password:" dbpassword
    echo "- GeniSysAI creating phpMyAdmin password"
    sudo mysql -uroot -p$rpassword -e "GRANT ALL PRIVILEGES ON *.* TO  $dbusername@localhost IDENTIFIED BY '$dbpassword'";
    sudo mysql -uroot -p$rpassword -e "SELECT host, user from mysql.user";
    read -p "! Enter a new application database user:" adbusername
    read -p "! Enter a new application database password:" adbpassword
    sudo mysql -uroot -p$rpassword -e "GRANT SELECT, INSERT, DELETE  ON *.* TO $adbusername@localhost IDENTIFIED BY '$adbpassword'";
    sudo mysql -uroot -p$rpassword -e "SELECT host, user from mysql.user";
    read -p "! Enter a new database name:" dbname
    sudo mysql -uroot -p$rpassword -e "CREATE DATABASE $dbname";
    echo "- GeniSysAI installed MySQL";
    exit 0
else
    echo "- GeniSysAI MySQL installation terminated";
    exit 1
fi
