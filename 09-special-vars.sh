#!/bin/bash
echo "all variables passed to the script: $@"
echo "no.of vars/args passed to the script: $#"
echo "script name: $0"
#while running sh 09-special-vars.sh sai 23 97
echo "cwd: $PWD"
echo "home dir of current user: $HOME"
echo "pid of current script: $$"
sleep 1000 &
echo "pid of last background command: $!"