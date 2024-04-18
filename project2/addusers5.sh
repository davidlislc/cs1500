#!/bin/sh
userfile=class 
username=$(cat class | tr 'A-Z'  'a-z')
echo $username
password=Summer2024
for user in $username 
do
	echo $user
        useradd $user
	echo $password | passwd --stdin $user
#	userdel -r $user
#	echo "User $user deleted."
#	rm -rf /home/$user
done
