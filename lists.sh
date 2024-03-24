#!/bin/bash

adlist="/etc/pihole/adlist.txt"
whitelist="/etc/pihole/whitelist.txt"
blacklist="/etc/pihole/blacklist.txt"

cat $adlist | while read -r line; do

  # Insert line into adlist table
  echo "adding $line to gravity"
  sudo sqlite3 /etc/pihole/gravity.db "INSERT INTO adlist (address, enabled, comment) VALUES ('$line', 1, 'automated');"
done

cat $whitelist | while read -r whitelist; do

  echo "adding $whitelist to whitelist"
    pihole -w --comment "automated" $whitelist
done

cat $blacklist | while read -r blacklist; do

  echo "adding $blacklist to blacklist"
    pihole -b --comment "automated" $blacklist
done

# Reload Pi-hole gravity database to reflect changes
pihole -g
