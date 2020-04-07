#!/bin/bash

read -p "? This script will install PHP on your device. Are you ready (y/n)?" cmsg

if [ "$cmsg" = "Y" -o "$cmsg" = "y" ]; then
    echo "- GeniSysAI installing PHP"
    sudo apt-get install php-fpm php-mysql

    read -p "! Now we will open the php.ini file, you need to change cgi.fix_pathinfo to 0. Are you ready (y/n)?" cmsg

    if [ "$cmsg" = "Y" -o "$cmsg" = "y" ]; then
        sudo nano /etc/php/7.2/fpm/php.ini
        sudo systemctl restart php7.2-fpm

        read -p "! Now we will copy a new NGINX configuration file that has been optimized for PHP servers, you need to replace YourSubdomain.YourDomain.TLD with the forwarded domain you set up earlier in the installation process. Are you ready (y/n)?" cmsg

        if [ "$cmsg" = "Y" -o "$cmsg" = "y" ]; then
            sudo cp Scripts/Installation/NGINX /etc/nginx/sites-available/default
            sudo nano /etc/nginx/sites-available/default
            sudo nginx -t
            sudo systemctl reload nginx
            echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php
            echo "- You can now view your PHP configuration at https://www.YourDomain.com/info";
            echo "- GeniSysAI installed PHP";
            exit 0
        else
            echo "- GeniSysAI PHP installation terminated";
            exit 1
        fi

        echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php
        echo "- You can now view your PHP configuration at https://www.YourDomain.com/info";
        echo "- GeniSysAI installed PHP";
        exit 0
    else
        echo "- GeniSysAI PHP installation terminated";
        exit 1
    fi
else
    echo "- GeniSysAI PHP installation terminated";
    exit 1
fi
