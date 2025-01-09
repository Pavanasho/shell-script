#!/bin/bash


VALIDATE () {

    if [ $1 -ne 0 ]
    then
        echo "$2 ... Failure"
    else
        echo "$2 ... Success"
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
    echo "Mysql is already installed"
fi       

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing git"
else 
    echo "Git is already installed"
fi        