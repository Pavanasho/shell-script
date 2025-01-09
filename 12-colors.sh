#!/bin/bash

R=\e[31m
G=\e[32m
Y=\e[33m
N=\e[0m


VALIDATE () {

    if [ $1 -ne 0 ]
    then
        echo -e "$2 ... $R Failure"
    else
        echo -e "$2 ... $G Success"
    fi        

}

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: you must have the sudo access to execute this script"
    exit 1
fi    

dnf list installed mysql

if [ $? -ne 0 ]
then 
    dnf install mysql -y
    VALIDATE $? "Installing mysql"

else
    echo -e "Mysql is already $Y installed"
fi       

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing git"
else 
    echo -e "Git is already $Y installed"
fi        