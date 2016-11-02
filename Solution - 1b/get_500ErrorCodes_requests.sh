#!/bin/bash
#we could change this value to check any other Code error, or it could also be sent via argument $1
error_code="HTTP/1.1\" 500"
apache_log_dir=/var/log/apache2
currentTime=$(date +"%H:%M:%S")

for file in $apache_log_dir/*.log
do
        while read -r line
        do
                #Check if the logging line contains the 500 error code
                if echo $line | grep -q "$error_code"
                then
                        #extract logging time from line, 4th value,based on  Log format
                        #LogFormat "%v:%p %h %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\""
                        lineArray=($line)
                        timeFormat=${lineArray[4]}
                        loggingTime=$(echo ${timeFormat#*:})
						
                        #converting times in seconds
                        currentTime_secs=$(date +%s -d ${currentTime})
                        loggingTime_secs=$(date +%s -d ${loggingTime})
                        
						#Run diff to identify if this request happened in last 10 min(600 secs)
                        if [ $(expr $currentTime_secs - $loggingTime_secs ) -le "600" ]
                        then
                                echo $line
                        fi
                fi
        done < $file
done
