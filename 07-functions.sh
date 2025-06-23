#!/bin/bash
USER=$(id -u)
if [ $USER -ne 0 ]
then 
    echo "ERROR: You should run with Root User to Execute."
    exit 1
else
    echo "ERROR: Your Running with Root User"
fi

VALIDATE(){
    if [ $? -eq 0 ]
    then
        echo "MYSQL is SUCCESSFULLY Installed"
    else
        echo "MYSQL is not SUCCESSFULLY Installed"
        exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "INSTALLING MYSQL"
    dnf install mysql -y
    VALIDATE $? "MySql"
else
    echo "MYSQL Already installed no need to anything"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then 
    echo "INSTALLING Nginx"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "Nginx Already installed no need to anything"
fi

dnf list installed python3
if [ $? -ne 0 ]
then 
    echo "INSTALLING python3"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo "python3 Already installed no need to anything"
fi