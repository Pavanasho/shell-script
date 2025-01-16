#!/bin/bash

while read -r line
do
    ehco $line
done < 16-delete-old-logs.sh
