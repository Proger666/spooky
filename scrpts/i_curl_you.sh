#!/bin/bash
i=0

for ip in $(curl --compressed https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt 2>/dev/null | grep -v "#" | grep -v -E "\s[1-2]$" | cut -f 1);
 do
   if [[ "$i" -gt 5 ]]; then
    break
   fi
   curl http://$ip --max-time 1
   ((i++))

 done
