#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USER=$(id -u)
if [ $USER -ne 0 ]
then 
    echo -e "$R ERROR: You should run with Root User to Execute. $N"
    exit 1
else
    echo -e "$G ERROR: Your Running with Root User $N"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "$G $2 is SUCCESSFULLY Installed $N"
    else
        echo -e "$R $2 is not SUCCESSFULLY Installed $N"
        exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo -e "$Y INSTALLING MYSQL $N"
    dnf install mysql -y
    VALIDATE $? "MySql"
else
    echo -e "$Y MYSQL Already installed no need to anything $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then 
    echo -e "$Y INSTALLING Nginx $N"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "$Y Nginx Already installed no need to anything $N"
fi

dnf list installed python3
if [ $? -ne 0 ]
then 
    echo -e "$Y INSTALLING python3 $N"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "$Y python3 Already installed no need to anything $N"
fi