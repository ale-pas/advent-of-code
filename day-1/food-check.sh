#!/bin/bash

file="elf-food.txt"

array=( $(cat $file| sed -e 's/^$/-/') )
count=0
sum=0
elfs=()
kal=0
for i in "${array[@]}"
do
	if [[ "$i" == "-" ]]
	then
		if (( $kal < $sum ))
		then
			kal=$sum
		fi
		# echo "Elf $count calories: $sum"
		let count+=1
		elfs+=("${sum}")
		sum=0
	else
		let sum+=$i
	fi

done
echo "${elfs[@]}"
sorted=($(sort "${elfs[*]}"))
echo "${sorted[@]}"
echo "Elf $elf calories: $kal"
