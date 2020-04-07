#!/bin/bash

read -p "? This script will install the GeniSysAI network server on your device. Are you ready (y/n)?" cmsg

if [ "$cmsg" = "Y" -o "$cmsg" = "y" ]; then

    echo "- Installing GeniSysAI Server"

    sh Scripts/Installation/NGINX.sh
    if [ $? -ne 0 ]; then
        echo "- GeniSysAI installation terminated";
        exit
    fi 

    sh Scripts/Installation/LetsEncrypt.sh 
    if [ $? -ne 0 ]; then
        echo "- GeniSysAI installation terminated";
        exit
    fi 

    sh Scripts/Installation/UFW.sh 
    if [ $? -ne 0 ]; then
        echo "- GeniSysAI installation terminated";
        exit
    fi 

    sh Scripts/Installation/MySQL.sh 
    if [ $? -ne 0 ]; then
        echo "- GeniSysAI installation terminated";
        exit
    fi 

    sh Scripts/Installation/PHP.sh 
    if [ $? -ne 0 ]; then
        echo "- GeniSysAI installation terminated";
        exit
    fi 

    sh Scripts/Installation/phpMyAdmin.sh 
    if [ $? -ne 0 ]; then
        echo "- GeniSysAI installation terminated";
        exit
    fi 

    sh Scripts/Installation/iotJumpWay.sh 
    if [ $? -ne 0 ]; then
        echo "- GeniSysAI installation terminated";
        exit
    fi 

else
    echo "- GeniSysAI installation terminated";
    exit
fi
