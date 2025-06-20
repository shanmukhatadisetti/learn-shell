#!/bin/bash
echo "all variables passed to the script-$@"
echo "number of variables passed to the script-$#"
echo "script name is $0"
echo "current user directory is $PWD"
echo "current user running the script is $USER"
echo "home directory of the user is $HOME"
echo "PID of the script is $$"
sleep 10 &
echo "PID of last command in background is $!"