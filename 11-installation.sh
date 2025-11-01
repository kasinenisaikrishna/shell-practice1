#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then
    echo "please run this script with root access" #this script should exit after this line but this will not hence we should place exit status
    exit 1 #placing this to break from script
fi
dnf list installed git #commnd to know whether git is installed or not?
if [ $? -ne 0 ] #$? will give us exit status
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
if [ $? -ne 0 ] #$? will give us exit status
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
    

