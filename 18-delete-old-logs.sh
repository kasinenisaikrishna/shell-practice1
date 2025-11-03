#!/bin/bash

source_dir=/home/ec2-user/logs
r="\e[31m"
g="\e[32m]"
y="\e[33m"
n="\e[0m]"

if [ -d $source_dir ]
then
    echo -e "$source_dir $g exists $n"
else
    echo -e "$source_dir $r does not exists $n"
    exit 1
fi

files=$(find $source_dir -name "*.log" -mtime +14)
echo "files: $files"

while IFS= read -r line #IFS, internal field seperator, empty means it will not ignore while spaces. -r is for not to ignore special characters like /
do
    echo "deleting line: $line"
    rm -rf $line
done <<< $files