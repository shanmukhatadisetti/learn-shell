# case $var in
# string1) command ;;
# sttring2) commands ;;
# *) commands ;;
# esac

read -p 'Enter Course Nmae: ' name

case $name in
  DevOPs)
    echo Welcome to DevOps Training
    echo Timings are 6AM
    ;;
  ASW)
    echo Welcome to AWS Training
    echo Timings are 7AM
    ;;
  *) echo No Course Available
    ;;
  esac