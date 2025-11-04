#!/bin/bash

source_dir=$1
dest_dir=$2
days=${3:-14} #if $3 is empty, default is 14 days.
timestamp=$(date +%Y-%m-%d-%H-%M-%S)

r="\e[31m"
g="\e[32m]"
y="\e[33m"
n="\e[0m]"

usage(){
    echo -e "$r usage:: $n sh 19-backup.sh <source> <destination> <days(otional)>"  
}
#check the source and destination are provided

if [ $# -lt 2 ]
then
    usage
fi

if [ ! -d $source_dir ]
then
    echo "$source_dir does not exists...please check"
fi

if [ ! -d $dest_dir ]
then
    echo "$dest_dir does not exists...please check"
fi

files=$(find ${source_dir} -name "*.log" -mtime +14)

echo "files: $files"

if [ ! -z $files ] #true if files are empty, ! makes it expression false
then
    echo "files are found"
    zip_file="$dest_dir/app-logs-$timestamp.zip"
    find ${source_dir} -name "*.log" -mtime +14 | zip "$zip_file" -@

    #check if zip file is successfully created or not
    if [ -f $zip_file ] #-f for file and -d for directory
    then
        echo "successfully zipped files older than $days"
        #remove the files after zipping
        while IFS= read -r file #IFS, internal field seperator, empty means it will not ignore while spaces. -r is for not to ignore special characters like /
        do
            echo "deleting file: $file"
            rm -rf $file
        done <<< $files
    else
        echo "Zipping the files is failed"
        exit 1
    fi
else
    echo "no files older than $days"
fi