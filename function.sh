#!/bin/bash

check_condition(){
	read -p "ENTER THE NUMBER " num
	if [[ $num == 7 ]];
	then 
		echo "SUIIII"
	else
		echo "NAAA"
	fi
}
$1
