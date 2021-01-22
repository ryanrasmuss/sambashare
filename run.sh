#!/bin/bash

service smbd restart

USER=root
PASS=PASSWORD

(echo "$PASS"; echo "$PASS") | smbpasswd -s -a $USER

tcpdump
