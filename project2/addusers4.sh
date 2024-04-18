#!/bin/sh
userfile=class 
username=$(cat class | tr 'A-Z'  'a-z')
echo $username
password=Summer2024
for user in $username 
do
	echo $user
        sudo useradd $user
	sudo userdel -r $user
	echo "User $user deleted."
	sudo rm -rf /home/$user
done
