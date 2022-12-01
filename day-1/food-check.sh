#!/bin/bash

file="elf-food.txt"

array=( $(cat $file| sed -e 's/^$/-/') )
count=0
sum=0
elf=0
kal=0
for i in "${array[@]}"
do
	if [[ "$i" == "-" ]]
	then
		if (( $kal < $sum ))
		then
			kal=$sum
			elf=$count
		fi
		# echo "Elf $count calories: $sum"
		let count+=1
		sum=0
	else
		let sum+=$i
	fi

done
echo "Elf $elf calories: $kal"
