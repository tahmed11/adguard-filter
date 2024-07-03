#!/bin/bash
rm adguard_hosts.txt
wget https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt -O filter.txt
cat filter.txt | grep '^||' | sed 's/\^//' | sed 's/|//g' | grep -v '*'> hosts.txt
while read line; do echo "0.0.0.0" $line >> adguard_hosts.txt; done <hosts.txt
