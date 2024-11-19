#!/bin/bash
  for var in "$@"
     do     
        if [ "$var" = "quit" ]
        then      
            break     
        fi     
        printf "%s\n" $var   
    done 