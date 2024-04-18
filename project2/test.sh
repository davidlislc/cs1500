#!/bin/sh
userfile=class 
username=$(cat class | tr 'A-Z'  'a-z')
echo $username
