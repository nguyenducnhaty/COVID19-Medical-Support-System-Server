
#!/bin/bash

read -p "? This script will install NGINX on your device. Are you ready (y/n)?" cmsg

if [ "$cmsg" = "Y" -o "$cmsg" = "y" ]; then

    echo "- GeniSysAI installing NGINX"

    sudo apt-get install nginx
    sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.backup

    echo ""
    read -p "? The following line will open the default configuration for NGINX in the NANO text editor. Here you need to edit the default Nginx configuration replacing _ in server_name _; with your domain that you have forwarded to your network using an A record. IE server_name www.YourDomain.com. Once you have made your edit you need to press ctrl x to exit to save (if you made the changes), y for yes, and then enter to save the modified file. Ready (y/n)?" cmsg

    if [ "$cmsg" = "Y" -o "$cmsg" = "y" ]; then
        sudo nano /etc/nginx/sites-available/default 
        sudo nginx -t
        sudo systemctl reload nginx
        echo "- GeniSysAI installed NGINX";
        exit 0
    else
        echo "- GeniSysAI NGINX installation terminated";
        exit 1
    fi

else
    echo "- GeniSysAI NGINX installation terminated";
    exit 1
fi
