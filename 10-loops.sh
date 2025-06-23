#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/shell-script.log"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOG_FOLDER

PACKAGES=("mysql" "nginx" "python3")

echo "Script started executed time-$(date)" | tee -a $LOG_FILE

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

for package in ${PACKAGES[@]}
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then 
        echo -e "$Y INSTALLING $package $N" | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package"
    else
        echo -e "$Y $package Already installed no need to do anything $N" | tee -a $LOG_FILE
    fi
done