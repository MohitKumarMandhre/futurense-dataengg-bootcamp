#!/bin/sh

echo "enter names of cities: (type done to exit loop)"

op_file_path="new_city.txt"

> $op_file_path

while true; do
	read city
	if [ "$city" = "" ]; then
		echo "your city name was empty"
		continue
	fi
	if [ "$city" = "done" ]; then
		break
	fi
	echo $city >> $op_file_path
done

echo "successfully inserted city names in $op_file_path"

cat $op_file_path | grep -i new | sed 's/New/Old/gi' > old_city.txt
echo "Filter city name contains 'New', replacing it with 'Old'"
echo "new filtered cities store in 'old_city.txt'"
