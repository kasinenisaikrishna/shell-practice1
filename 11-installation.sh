#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then
    echo "please run this script with root access" #this script should exit after this line but this will not hence we should place exit status
    exit 1
fi
dnf install git -y

