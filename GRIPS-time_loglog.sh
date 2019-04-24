#!/bin/bash
# time_loglog.sh
# Author: Alex Voisine
# Date: March 31, 2019
# This logs the time log on the OEM7 once

echo "unlogall" > /dev/ttyUSB0
echo "log time once" > /dev/ttyUSB0
sleep 0.2s
( cat < /dev/ttyUSB0 ) > /home/debian/TimeLog.txt
sleep 0.3s
( cat < /dev/ttyUSB0 ) >> /home/debian/TimeLog.txt
root@beaglebone:/usr/bin# cat time_loglog.sh                                                                                                                                          
#!/bin/bash

/usr/bin/time_log.sh &

VAR=`pgrep -n cat`
if [ -z "$VAR" ]
then
        :
else
        kill "$VAR"

fi
