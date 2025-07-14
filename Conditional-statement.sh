#!/bin/bash

read -p "Enter the number :" num
read -p "Enter the Country :" Con
if [[ $num == 10 ]];
then
	echo "Its Messi"
elif [[ $Con == Argentina ]]
then
	echo "Yes its Messi"
else
	echo "Its not Messi"
fi
