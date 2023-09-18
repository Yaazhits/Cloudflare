#!/bin/bash

echo " Choose your domain: "
cat pool-details | grep -A 2 minimum | grep name | awk -F":" '{print $2}' | awk -F"," '{print $1}' | sed 's/"//g'

read -p "Enter your domain: " name
cat pool-details | grep -B 4 $name | grep id | sed 's/"//g' | awk -F"," '{print $1}'
cat pool-details | grep -A 20 $name | grep -B 3 weight | sed 's/,/./g'
read -p "Do you want to change your origin weight? (yes/no):" i
if [ $i = yes ];then
	echo "your pool ID is:"
	cat pool-details | grep -B 4 $name | grep id | sed 's/"//g' | awk -F"," '{print $1}' | awk -F":" '{ print $2}'
	echo "done"
else
	exit
fi

