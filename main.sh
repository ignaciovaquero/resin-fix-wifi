#!/bin/bash
set -e

read -p "SSID: " ssid
read -p "Wifi Password: " -s password
echo ""
read -p "network hidden [y/n]: " hidden
while [ $hidden != "y" -a $hidden != "n" ];do
	echo "Invalid answer."
	read -p "hidden [y/n]: " hidden
done

read -p "resin hostname [default: resin]: " resin_hostname
read -p "resin port [default: 22222]: " resin_port
resin_hostname=${resin_hostname:-resin}
resin_port=${resin_port:-22222}

if [ $hidden = "y" ]; then
	hidden="yes"
else
	hidden="no"
fi

ssh root@${resin_hostname}.local -p${resin_port} "/usr/bin/nmcli dev wifi connect \"$ssid\" password $password hidden $hidden"
