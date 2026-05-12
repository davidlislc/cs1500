#!/bin/bash

# Configuration
INTERFACE="ens18"
NEW_IP="10.60.10.56/24"
GATEWAY="10.60.1.1"

NEW_USER="lilyaiuser"
USER_PASS='$2'
if ! id "$NEW_USER" &>/dev/null; then
    useradd -m "$NEW_USER"
fi
usermod -aG wheel "$NEW_USER"
echo "$NEW_USER:$USER_PASS" | chpasswd
# 1. Update the IP address and Prefix
nmcli con mod "$INTERFACE" ipv4.addresses "$NEW_IP"

# 2. Update the Gateway
nmcli con mod "$INTERFACE" ipv4.gateway "$GATEWAY"


# 4. Set method to manual (static) just in case it was on DHCP
nmcli con mod "$INTERFACE" ipv4.method manual

# 5. Apply changes
nmcli con up "$INTERFACE"
# Define the new hostname
NEW_HOSTNAME="S1"

# Update the hostname in the system
hostnamectl set-hostname "$NEW_HOSTNAME"

# Optional: Update the /etc/hosts file to prevent sudo lag
sed -i "s/127.0.1.1.*/127.0.1.1 $NEW_HOSTNAME/g" /etc/hosts

