#!/bin/bash
userid=$(id -u)
validate(){ #validate function body
    if [ $1 -ne 0 ]
    then
        echo "$2 is...FAILED"
        exit 1
    else
        echo "$2 is...SUCCESS"
    fi 
}

if [ $userid -ne 0 ]
then
    echo "please run this script with root access" 
    exit 1 
fi

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