#!/bin/bash
# bestpos.sh
# Author: Alex Voisine
# Date: March 31, 2019
# This logs the Bestposition log on the OEM7 at 10 Hz for 1 second

echo "log bestpos ontime 0.1" > /dev/ttyUSB0
( cat < /dev/ttyUSB0 ) >> /home/debian/log_OEM7.txt
