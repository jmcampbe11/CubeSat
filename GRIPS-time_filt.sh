#!/bin/bash
# time_filt.sh

grep -B0 -A2 'TIME' /home/debian/TimeLog.txt | tail -1 > /home/debian/TimeLog2.txt #| tail -4
