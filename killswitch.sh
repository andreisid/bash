#!/bin/bash
### this only works with OpenVPN
### please make sure you have ufw and iptables installed
printf "############################################################\n"
printf "ATTENTION! Please run the script after connecting to the VPN\n"
printf "To undo modifications run:\n"
printf "ufw --force reset\n"
printf "############################################################\n"
#read vpn address
printf "what is your VPN server ip? "
read vpn_input

#check if input is an ip
cond=$(echo $vpn_input | grep -E -o '(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)')
if [ ! -z "$cond" ]; then vpn_ip=$vpn_input; else printf "Please enter a propper ip address\nQuitting..\n"; exit 1; fi

#get the name of the OpenVPN interface
vpn_if=$(ifconfig |grep tun|cut -f 1 -d :)

echo $vpn_ip
#add firewall rules
ufw --force reset
ufw enable
ufw default deny outgoing
ufw default deny incoming
ufw allow out to 192.168.0.0/16
ufw allow in to 192.168.0.0/16
ufw allow out to $vpn_ip  
ufw allow out on $vpn_if

