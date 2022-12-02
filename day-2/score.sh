#!/bin/bash

rounds="rounds.txt"
opponent=($(cat $rounds |awk '{print $1}'))
player=($(cat $rounds |awk '{print $2}'))

declare -A points

points["X"]="1"
points["Y"]="2" 
points["Z"]="3"

declare	-A result

result["A X"]="3"
result["A Y"]="6"
result["A Z"]="0"
result["B X"]="0"
result["B Y"]="3"
result["B Z"]="6"
result["C X"]="6"
result["C Y"]="0"
result["C Z"]="3"

