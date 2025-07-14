#!/bin/bash 

#while and for loop

read -p "Enter the Number :" Num
if [[ $Num > 0 ]]
	then
for (( num=$Num; num<=5; num++ ))
do
	echo "$num"
done
else
	echo "Invalid Number"
fi
