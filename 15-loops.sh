#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE (){
    if [ $1 -ne 0 ]
    then    
        echo "$2 ... $R FAILURE $N"
    else 
        echo "$2 ... $G SUCCESS $N"
    fi    
}

echo "Executing starting at: $TIMESTAMP " &>> $LOG_FILE_NAME

CHECK_ROOT (){
    if [ $USERID -ne 0 ]
    then
        echo "ERROR:: you must have the sudo access to execute this script"
        exit 1
    fi    
}

CHECK_ROOT


for package in $@
do
    dnf list installed $package

    if [ $? -ne 0 ]
    then
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else
        echo "$package is already installed"
    fi        
done


