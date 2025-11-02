#!/bin/bash

logs_folder="/var/log/shell-script"
script_name=$(echo $0 | cut -d "." -f1) #$0 is used to get current running script name
timestamp=$(date +%Y-%m-%d-%H-%M-%S)
log_file="$logs_folder/$script_name-$timestamp.log"
mkdir -p $logs_folder #if file is not there it will create if file is there we won't get an error

userid=$(id -u)
r="\e[31m"
g="\e[32m]"
y="\e[33m"
n="\e[0m]"

check_root(){
    if [ $userid -ne 0 ]
    then
        echo -e "$r please run this script with root access $n" | tee -a $log_file #tee is used to print output on the screen and as well as used to write in log_file
        exit 1 
    fi
}

validate(){ 
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is...$r FAILED $n" | tee -a $log_file
        exit 1
    else
        echo -e "$2 is...$g SUCCESS $n" | tee -a $log_file
    fi 
}

usage(){
    echo -e "$r usage:: $n sudo sh 16-redirectors.sh package1,package2 ..."
    exit 1
}

echo "script started executing at: $(date)" | tee -a $log_file

check_root

if [ $# -eq 0 ]
then
    usage()
fi

#sh 15-loops.sh git mysql postfix nginx
for package in $@ #$@ is a special variables refers to all arguments passed to it
do
    dnf list installed $package &>>$log_file
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install it.." | tee -a $log_file
        dnf install $package -y &>>$log_file
        validate $? "installing $package"
    else
        echo -e "$package is already $y installed.. nothing to do $n" | tee -a $log_file
    fi
done