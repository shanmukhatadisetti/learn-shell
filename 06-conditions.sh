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
    exit 1
else
    echo "ERROR: Your Running with Root User"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "INSTALLING MYSQL"
    dnf install mysqlll -y
    if [ $? -eq 0 ]
    then
        echo "MYSQL is SUCCESSFULLY Installed"
    else
        echo "MYSQL is not SUCCESSFULLY Installed"
        exit 1
    fi

else
    echo "MYSQL Already installed no need to anything"
fi

# dnf install mysql -y
# if [ $? -eq 0 ]
# then
#     echo "MYSQL is SUCCESSFULLY Installed"
# else
#     echo "MYSQL is not SUCCESSFULLY Installed"
#     exit 1
# fi