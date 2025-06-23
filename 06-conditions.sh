#!/bin/bash

# NUMBER=$1

# if [ $NUMBER -gt 10 ]
# then
#     echo "$NUMBER is greater than 10"
# else
#     echo "$NUMBER is less than 10"
# fi

USER=$(id -u)
if [ $USER -ne 0 ]
then 
    echo "ERROR: You should run with Root User to Execute."
else
    echo "ERROR: Your Running with Root User"
fi