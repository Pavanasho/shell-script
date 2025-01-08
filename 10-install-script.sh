#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR :: you must have sudo access to execute this script"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
    dnf install mysql -y
    if [ $? -ne 0 ]
    then 
        echo "Installing mysql...failure"
        exit 1
    else
        echo "Installing mysql...success"
    fi 
else
    echo "mysql is already installed"    
fi           

dnf list installed git
if [ $? -ne 0 ]
then 
    dnf install git -y
    if [ $? -ne 0 ]
    then 
        echo "Installing git...failure"
        exit 1
    else
        echo "Installing git...success"
    fi 
else
    echo "git is already installed"    
fi           