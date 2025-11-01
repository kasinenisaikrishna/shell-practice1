#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then
    echo "please run this script with root access" #this script should exit after this line but this will not hence we should place exit status
    exit 1
fi
dnf list installed git
if [ $? -ne 0 ]
then
    echo "git is not installed, going to install it.."
    dnf install git -y
else
    echo "git is already installed, nothing to do.."
fi
    

