#!/bin/bash

iptables -t nat -A POSTROUTING -s 192.168.0.0/16 -o eth0 -j MASQUERADE
/usr/bin/rygel