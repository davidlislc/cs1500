#!/bin/bash

# Configuration
INTERFACE="ens18"
NEW_HOSTNAME="$1"
NEW_IP="10.60.10.199"
NETMASK="24"            # Change to your specific subnet bits if not /24
DNS="8.8.8.8"           # Change to your preferred DNS
GATEWAY="10.60.1.1"

# 1. Set the IPv4 method to manual (static)
nmcli con mod "$INTERFACE" ipv4.method manual

# 2. Assign the IP address and subnet
nmcli con mod "$INTERFACE" ipv4.addresses "$NEW_IP/$NETMASK"

# 3. Assign the gateway
nmcli con mod "$INTERFACE" ipv4.gateway "$GATEWAY"

# 4. Assign the DNS server
nmcli con mod "$INTERFACE" ipv4.dns "$DNS"

# 5. Update the hostname in the system
hostnamectl set-hostname "$NEW_HOSTNAME"

# 6. Update the /etc/hosts file to prevent sudo lag
sed -i "s/127.0.1.1.*/127.0.1.1 $NEW_HOSTNAME/g" /etc/hosts

# Or for a specific user: echo "username:${NEW_PASSWORD}" | chpasswd

echo "Configuration applied successfully."
echo "Hostname: $NEW_HOSTNAME"
echo "IP Address: $NEW_IP"
echo "Password updated to match policy."
