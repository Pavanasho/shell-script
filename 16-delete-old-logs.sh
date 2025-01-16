#!/bin/bash

SOURCE_DIR="/home/ec2-user/app-logs"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

#mkdir -p /var/log/shellscript-logs

echo "script started executing at: $TIMESTAMP " &>> $LOG_FILE_NAME

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)

echo "Files to be deleted: $FILES_TO_DELETE"

while read -r filepath
do
    echo "Deleting file: $filepath" &>> $LOG_FILE_NAME
    

done <<< $FILES_TO_DELETE
