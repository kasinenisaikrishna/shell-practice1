#!/bin/bash

source_dir=$1
dest_dir=$2
days=${3:-14} #if $3 is empty, default is 14 days

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