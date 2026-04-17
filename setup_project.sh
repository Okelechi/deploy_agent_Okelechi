#!/usr/bin/env bash

#Taking user input and saving the input as a variable(directory)
read -p "Enter the name of your desired directory: " directory

#Creating a parent directory using the user input stored in the variable(directory)
mkdir -p attendance_tracker_$directory

#Creating sub-directories in the newly created directory
mkdir -p attendance_tracker_$directory/Helpers
mkdir -p attendance_tracker_$directory/reports

#moving the source code files from the current directory to their proper location
mv attendance_checker.py attendance_tracker_$directory
mv assets.csv attendance_tracker_$directory/Helpers
mv config.json attendance_tracker_$directory/Helpers
mv reports.log attendance_tracker_$directory/reports

#Prompting the user to decide for a change in the attendance treshhold and saving their response in a variable (answer)
read -p "Do you want to change the attendance threshhold? write YES or NO " answer

#creating a function that takes new treshhold value from user and replaces the old value with the new one
if [ $answer="YES" ]; then
    read -p "Enter new failure value: " failure
    read -p "Enter new waring value: " warning

    sed -i "s/50/$failure/g" attendance_tracker_$directory/Helpers/config.json
    sed -i "s/75/$warning/g" attendance_tracker_$directory/Helpers/config.json
fi

#Trapping the SIGINT signal, archiving the unfinished directory and deleting the incomplete directory
trap ' echo "exiting the process and creating an archive file..."; tar -cf attendance_tracker_$directory_archive attendance_tracker_$directory; rm -r attendance_tracker_$directory; exit 1 ' SIGINT

#Creating a function that checks if python3 is installed on the local sysytem
if python3 --version &>/dev/null; then
    echo "Python3 is installed"
else
    echo "Warning: Python3 is not installed. Please install it before continuing."
    exit 1
fi
