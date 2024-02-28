#!/bin/bash
  for var in "$@"
     do     
        if [ "$var" = "me" ]     
        then       
            continue     
        elif [ "$var" = "mine" ]     
        then       
            continue     
        elif [ "$var" = "myself" ]     
        then       
         continue     
        fi 

        if [ "$var" = "quit" ]     
        then       
         break     
        fi     
        printf "%s\n" $var   
     done 