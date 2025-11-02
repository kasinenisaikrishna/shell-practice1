#!/bin/bash
userid=$(id -u)
r="\e[31m"
g="\e[32m]"
y="\e[33m"
n="\e[0m]"

check_root(){
    if [ $userid -ne 0 ]
    then
        echo "please run this script with root access" 
        exit 1 
    fi
}

validate(){ #validate function body
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is...$r FAILED $n"
        exit 1
    else
        echo -e "$2 is...$g SUCCESS $n"
    fi 
}

check_root

dnf list installed git 

if [ $? -ne 0 ] 
then
    echo "git is not installed, going to install it.."
    dnf install git -y
    validate $? "installing git" #calling the validate function
else
    echo "git is already installed, nothing to do.."
fi

dnf list installed mysql

if [ $? -ne 0 ] 
then
    echo "mysql is not installed... going to install"
    dnf install mysql -y
    validate $? "installing mysql"
else
    echo "mysql is already installed... nothing to do"
fi