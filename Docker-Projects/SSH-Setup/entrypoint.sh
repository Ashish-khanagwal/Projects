#!/bin/bash

mkdir -p /var/run/sshd

# Check if the ROOT_PASSWORD environment variable is set
if [ -z "$ROOT_PASSWORD" ]; then
  echo "Error: ROOT_PASSWORD is not set."
  exit 1
fi

# Set the root password
echo "root:$ROOT_PASSWORD" | chpasswd

# Start the SSH service
exec /usr/sbin/sshd -D