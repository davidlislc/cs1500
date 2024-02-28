#!/bin/bash
file="peom"
#IFS=$'\n'
for var in $(cat $file)
do
    echo " $var"
done