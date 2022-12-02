#!/bin/bash

file="elf-food.txt"
rm "elf_list.txt"
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

for i in "${elfs[@]}"
do
	# echo $i
	echo $i >> "elf_list.txt"
done
sorted=($(sort -nr "elf_list.txt"))
let total=${sorted[0]}+${sorted[1]}+${sorted[2]}
echo "Total calories of the first elf: $kal"
echo "Total calories of the first 3 elves: $total"
rm "elf_list.txt"
