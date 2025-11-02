#!/bin/bash
userid=$(id -u)
validate(){
    if [ $1 -ne 0 ]
    then
        echo "Command is...FAILED"
        exit 1
    else
        echo "Command is...SUCCESS"
    fi 
}
if [ $userid -ne 0 ]
then
    echo "please run this script with root access" 
    exit 1 
fi
dnf list installed git 
validate $?
if [ $? -ne 0 ] 
then
    echo "git is not installed, going to install it.."
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "git installation is not success...check it"
        exit 1
    else
        echo "git installation is successful"
    fi
else
    echo "git is already installed, nothing to do.."
fi

dnf list installed mysql
if [ $? -ne 0 ] 
then
    echo "mysql is not installed... going to install"
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "mysql installation is not success...check it"
        exit 1
    else
        echo "mysql installation is successful"
    fi
else
    echo "mysql is already installed... nothing to do"
fi