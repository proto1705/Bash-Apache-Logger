#!/bin/bash
# sudo bash for original apache log file

# Apache Logger
# Author : Jomon Joseph
# Version : 1.0

printf "\033c" # Clear Screen

printf $'\e[1;36m'"\n######################## Apache Logger ##############################\n\n"$'\e[0m'
printf $'\e[1;36m'"Apache Logger\n"'\e[0m'
printf $'\e[1;36m'"Author: Jomon Joseph\n"'\e[0m'
printf $'\e[1;36m'"Version: 1.0\n\n"'\e[0m'
printf $'\e[1;36m'"##################################################################\n\n"$'\e[0m'

# Assign Access.log file to a variable
file="access.log"
# file="/var/log/apache2/access.log" --> Actual file

while true # Conditional Statement to run the script continously - Or we can use Cron Job for Scheduled Running
do
    for ip in $(cut -d' ' -f1 $file | sort | uniq) ; # Fetching the unique IP Addresses from access.log file
        do
            if [ $(grep -c $ip log-listener.log) -eq 0 ] ; # Checking the current IP in the Listener Log File
                then
                    echo $'\e[0;36m'"New IP is found, Writing to file. IP" $'\e[0;36m'": $ip"
                    curl -s "https://ipapi.co/$ip/json/" >> log-listener.log
                    
                    
            fi
            


    done
    
    echo $'\e[0;36m'"Listening to the Log FIle......................................"
    echo "Update in 30 Minutes.................."$'\e[0;36m'
    echo "Press Ctrl+C or Ctrl+Z to Exit the Program"

sleep 1800 # Run the script every 30 minutes interval. To exit Press Ctrl+C or Ctrl+Z

done

