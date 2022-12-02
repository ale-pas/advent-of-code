#!/bin/bash

rounds="input.txt"
opponent=($(cat $rounds |awk '{print $1}'))
out=($(cat $rounds |awk '{print $2}'))

declare -A points

points["A"]="1"
points["B"]="2" 
points["C"]="3"

declare	-A result

result["A X"]="C"
result["A Y"]="A"
result["A Z"]="B"
result["B X"]="A"
result["B Y"]="B"
result["B Z"]="C"
result["C X"]="B"
result["C Y"]="C"
result["C Z"]="A"

declare -A outcome

outcome["X"]="0"
outcome["Y"]="3" 
outcome["Z"]="6"


score=0
len=${#out[@]}
for (( i=1; i<=${len}; i++ ))
do
	hand=${result["${opponent[$i]} ${out[$i]}"]}
	score=$((score+${outcome["${out[$i]}"]}+${points["${hand}"]}))
	echo "score: $score"

done


echo "Final score: $score"
