#!/bin/bash

#list ip address in ip.list file
#then geo location look up them
#summerize them in a simple format (one ips+geo per line).
#
#this line gets all ip addresses connected to system
CMD=`netstat -tn 2>/dev/null | awk '{print $5}' | awk '{if(NR>2)print}' | cut -d: -f1 > /tmp/ip.list`

#this line creates a file as below
FILE="/tmp/ip.list"

#creates an array called ips
ips=()

#some trim about our array
while IFS= read -r line; do ips+=("$line"); done < /tmp/ip.list
echo -n "" > /tmp/geo.list

#this part converts ip add to geo location
for i in "${ips[@]}"; 
do 
    geolo=`geoiplookup $i | awk '{print $4}' | head -n1 | cut -c1-2`

    #appends geo location to ip address
    echo $i "$geolo" >> /tmp/geo.list;
done

#last part is to display it in a proper format
#cat or bat (i prefer bat it's better)
bat "/tmp/geo.list"
