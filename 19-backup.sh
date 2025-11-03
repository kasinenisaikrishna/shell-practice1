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
    exit 1
}
#check the source and destination are provided

if [ $# -lt 2 ]
then
    usage
fi