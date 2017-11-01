#!/bin/bash
set -e

read -p "SSID: " ssid
read -p "Password: " -s password
echo ""
read -p "hidden [y/n]: " hidden

while [ $hidden != "y" -a $hidden != "n" ];do
	echo "Invalid answer."
	read -p "hidden [y/n]: " hidden
done

if [ $hidden = "y" ]; then
	hidden="yes"
else
	hidden="no"
fi

ssh root@resin.local -p22222 "/usr/bin/nmcli dev wifi connect \"$ssid\" password $password hidden $hidden"
