#!/bin/sh
userfile=class 
username=$(cat class | tr 'A-Z'  'a-z')
echo $username
for user in $username
do
	echo adding  $user
	useradd $user
	echo 2024Summer | passwd --stdin $user
done
