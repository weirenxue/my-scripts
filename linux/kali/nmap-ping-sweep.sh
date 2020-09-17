#!/bin/bash

nmap -sP 192.168.35.0/24 -oA ping-sweep > /dev/null
grep "Status: Up" ping-sweep.gnmap | awk '{print $2}' > active-ip.txt
cat active-ip.txt
