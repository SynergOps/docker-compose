#!/bin/bash

SUDO=''
if (($EUID != 0)); then SUDO='sudo'; fi

echo "Basic auth for traefik >= v1.7"
read -p "User: " USER
read -p "Password: " PW

# Checks if htpasswd is available on Ubuntu/Debian or install it otherwise
which htpasswd >/dev/null || ($SUDO apt update && $SUDO apt install apache2-utils)

# Generate strings
echo ""
echo "------- Your string for .env --------"
string=$(htpasswd -nbB $USER $PW)
echo $string
echo ""
echo "------- Your string for docker-compose.yml --------"
# Escape string
echo "$string" | sed -e 's/\$/\$\$/g'
echo ""
