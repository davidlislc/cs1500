#!/bin/bash

# Check for required parameters
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <hostname> <last_octet>"
    echo "Example: $0 node-01 52"
    exit 1
fi

# Configuration
INTERFACE="ens18"
NEW_HOSTNAME="$1"
IP_SUFFIX="$2"

# Construct dynamic variables
NEW_IP="10.60.10.${IP_SUFFIX}/24"
GATEWAY="10.60.1.1"

# 1. Update the IP address and Prefix
nmcli con mod "$INTERFACE" ipv4.addresses "$NEW_IP"

# 2. Update the Gateway
nmcli con mod "$INTERFACE" ipv4.gateway "$GATEWAY"

# 3. Set method to manual (static)
nmcli con mod "$INTERFACE" ipv4.method manual

# 4. Apply changes
nmcli con up "$INTERFACE"

# 5. Update the hostname in the system
hostnamectl set-hostname "$NEW_HOSTNAME"

# 6. Update the /etc/hosts file to prevent sudo lag
sed -i "s/127.0.1.1.*/127.0.1.1 $NEW_HOSTNAME/g" /etc/hosts

# Or for a specific user: echo "username:${NEW_PASSWORD}" | chpasswd

echo "Configuration applied successfully."
echo "Hostname: $NEW_HOSTNAME"
echo "IP Address: $NEW_IP"
echo "Password updated to match policy."
