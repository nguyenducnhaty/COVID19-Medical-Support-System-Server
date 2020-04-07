#!/bin/bash

read -p "? This script will install phpMyAdmin on your device. Are you ready (y/n)?" cmsg

if [ "$cmsg" = "Y" -o "$cmsg" = "y" ]; then
    echo "- GeniSysAI installing phpMyAdmin"
    echo "! tab -> enter -> yes -> password "
    sudo apt-get install phpmyadmin
    sudo ln -s /usr/share/phpmyadmin /var/www/html
    echo "- GeniSysAI installed phpMyAdmin";
    exit 0
else
    echo "- GeniSysAI phpMyAdmin installation terminated";
    exit 1
fi
