#!/bin/bash
# Install code server
# Ref: https://www.how2shout.com/linux/install-code-server-for-vs-code-on-ubuntu-22-04-or-20-04-lts/

sudo apt update

curl -fsSL https://code-server.dev/install.sh | sh

sudo systemctl start code-server@$USER	

sudo systemctl enable --now code-server@$USER
