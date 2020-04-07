#!/bin/bash

read -p "? This script will install the iotJumpWay MQTT library on your device. Are you ready (y/n)?" cmsg

if [ "$cmsg" = "Y" -o "$cmsg" = "y" ]; then
    echo "- GeniSysAI installing iotJumpWay MQTT library"
    sudo pip3 install JumpWayMQTT
    echo "- GeniSysAI installed iotJumpWay MQTT library";
    exit 0
else
    echo "- GeniSysAI iotJumpWay MQTT library installation terminated";
    exit 1
fi
