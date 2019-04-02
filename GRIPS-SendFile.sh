#!/bin/bash

# John M. Campbell
# Created on: 2019-03-16
# Last edited: 2019-03-31
# Handles any message size

file1=$1

# initialize loop
j=0
message=""

cat $file1 | xxd -g 1 -c 8 -p | sed -e "s/\(..\)\(..\)\(..\)\(..\)\(..\)\(..\)\(..\)/\1.\2.\3.\4.\5.\6.\7./" > /home/debian/temp99.txt

# Handle case of final frame less than 8 nibbles long

len=$( ls -al $file1 | awk '{print $5}')
rmn=$(( $len - (($len /8)*8 ) ))

echo $rmn

if [ $rmn -ne 0 ] && [ $rmn -lt 7 ]; then

        # initialize new last line
        new_last=""

        # get old last line
        last_line=$( cat /home/debian/temp99.txt | tail -n 1 )

        echo $last_line

        # delete old last line
        sed -i '$ d' /home/debian/temp99.txt

        for (( j=1; j<=$rmn; j+=1 ))
        do
                temp=$(( ($j -1)*2 ))
                next=${last_line:${temp}:2}.
                new_last="${new_last}${next}"
        done

        # add new last line
        echo $new_last >> /home/debian/temp99.txt
fi

echo $new_last

# Get and send to target the number of CAN frames to be sent
length=$( wc -l /home/debian/temp99.txt | awk '{print $1}' )
n=$(printf "%.8x" $length)
n1=$(echo $n | cut -c 1-2 )
n2=$(echo $n | cut -c 3-4 )
n3=$(echo $n | cut -c 5-6 )
n4=$(echo $n | cut -c 7-8 )

cansend can1 010#${n1}.${n2}.${n3}.${n4}

temp_arr=( $( cat /home/debian/temp99.txt ))

sleep 0.1s
#echo $length
#date +"%T.%3N"
for ((i=0; i<=$length-1; i+=1))
do
        cansend can1 011#${temp_arr[i]}
done
#echo $i
#date +"%T.%3N"
