#!/bin/bash

# Alex Voisine
# Created: 2019-04-02
# Last edited: 2019-04-02


# get BESTPOS log from GRIPS
./misdev -t G -c 6

echo ""

sleep 1s

# take photo from Imager
./misdev -t I -c 1

# put photo into dat file
cat ./photo.dat > ./Alex_value_added.dat

# decode logs and put them into text file
cat bestpos.log > ./Alex_value_added.txt

# also put date into text file
date >> ./Alex_value_added.txt