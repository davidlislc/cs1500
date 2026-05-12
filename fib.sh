#!/bin/bash

# Configuration
INTERFACE="ens18"
NEW_IP="10.60.10.56/24"
GATEWAY="10.60.1.1"

# 1. Update the IP address and Prefix
nmcli con mod "$INTERFACE" ipv4.addresses "$NEW_IP"

# 2. Update the Gateway
nmcli con mod "$INTERFACE" ipv4.gateway "$GATEWAY"


# 4. Set method to manual (static) just in case it was on DHCP
nmcli con mod "$INTERFACE" ipv4.method manual

# 5. Apply changes
nmcli con up "$INTERFACE"
