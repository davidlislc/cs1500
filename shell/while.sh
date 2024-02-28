#!/bin/bash
# contents of awesome_shell_script
n=$1
while [ $n -gt 0 ]
do
  echo $n
  let n=$n-1
done