#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/shell-script.log"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOG_FOLDER

echo "Script started executed time-$(date)"

USER=$(id -u)
if [ $USER -ne 0 ]
then 
    echo -e "$R ERROR: You should run with Root User to Execute. $N" | tee -a $LOG_FILE
    exit 1
else
    echo -e "$G ERROR: Your Running with Root User $N" | tee -a $LOG_FILE
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "$G $2 is SUCCESSFULLY Installed $N" | tee -a $LOG_FILE
    else
        echo -e "$R $2 is not SUCCESSFULLY Installed $N" | tee -a $LOG_FILE
        exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo -e "$Y INSTALLING MYSQL $N" | tee -a $LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MySql"
else
    echo -e "$Y MYSQL Already installed no need to do anything $N" | tee -a $LOG_FILE
fi

dnf list installed nginx
if [ $? -ne 0 ]
then 
    echo -e "$Y INSTALLING Nginx $N" | tee -a $LOG_FILE
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"
else
    echo -e "$Y Nginx Already installed no need to do anything $N" | tee -a $LOG_FILE
fi

dnf list installed python3
if [ $? -ne 0 ]
then 
    echo -e "$Y INSTALLING python3 $N" | tee -a $LOG_FILE
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
else
    echo -e "$Y python3 Already installed no need to do anything $N" | tee -a $LOG_FILE
fi