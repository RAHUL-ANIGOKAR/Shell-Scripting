#!/bin/bash

read -p "Enter the Number :" num
while (( $num % 2 == 0 && $num > 15 ))
do 
	echo "OLLA AMIGO"
	num=$((num++))
done
