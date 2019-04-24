#!/bin/bash
# besposition.sh

#VAR1=$(grep -n -m 1 BESTPOS /var/lib/cloud9/bigtest.txt | sed 's/\([0-9]*\).*/\1/')
#cat /var/lib/cloud9/bigtest.txt | awk -v "BestPos=$VAR1" 'NR >= BestPos && NR <= (BestPos+3)'

rm /home/debian/PositionData.txt
touch /home/debian/PositionData.txt
# this command goes backwards through the file
grep -B0 -A1 'BESTPOS' /home/debian/log_OEM7.txt | tail -1 >> /home/debian/PositionData.txt #| tail -4
 awk '{print $4, $5, $6}' /home/debian/PositionData.txt > /home/debian/BestPos.txt

