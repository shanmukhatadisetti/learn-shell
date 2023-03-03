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


## same above in if condition
if [ "${name}" == "DevOPs" ]; then
  echo Welcome to DevOps Training
  echo Timings are 6AM
  elif [ "${name}" == "AWS" ]; then
    echo Welcome to aws Training
    echo Timings are 7AM
    else
      echo No Course Availablr
      fi
