#!/bin/bash
echo -n "Enter an animal: "
read animal

case $animal in 
   "dog") echo "woof";;
   "cat") echo "meow";;
   *) echo $animal " is not on the farm";;
 esac