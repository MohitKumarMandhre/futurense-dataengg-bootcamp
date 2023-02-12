#!/bin/bash

cd /home/mkm/
mkdir assignments
cd assignments

echo "enter city1:"
read c1
echo "enter city2:"
read c2
echo "enter city3:"
read c3
echo "enter city4:"
read c4

string="$c1\n$c2\n$c3\n$c4"
echo $string > new-cities.txt
cat new-cities.txt | grep -i new | sed 's/new/Old/gi' > old-cities.txt

echo "task completed"
