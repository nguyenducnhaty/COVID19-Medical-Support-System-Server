#!/bin/bash

read -p "? This script will install UFW Firewall on your device. Are you ready (y/n)?" cmsg

if [ "$cmsg" = "Y" -o "$cmsg" = "y" ]; then
    echo "GeniSysAI installing UFW"
    sudo apt-get install ufw
    echo "GeniSysAI testing UFW"
    sudo ufw enable
    sudo ufw disable
    echo "GeniSysAI opening default ports"
    sudo ufw allow 22
    sudo ufw allow 80
    sudo ufw allow 443
    echo "GeniSysAI enabling UFW"
    sudo ufw enable
    echo "GeniSysAI checking UFW"
    sudo ufw status
    echo "GeniSysAI installed UFW"
    exit 0
else
    echo "- GeniSysAI Let's Encypt NGINX installation terminated";
    exit 1
fi