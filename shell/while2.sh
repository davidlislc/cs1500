  #!/bin/sh
      FILE=${1}    
      cat ${FILE} |   
      while read value   
      do     
        echo ${value}   
      done 