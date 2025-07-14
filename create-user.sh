#!/bin/bash

read -p "ENTER THE USER-NAME :" username

echo "you entered $username"

sudo useradd -m $username

echo "$username Added successfully"
