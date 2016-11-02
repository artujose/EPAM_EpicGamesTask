#!/bin/bash
remote_host=$1
dest_dir=$2
user_name=$3
user_password=$4

log_date=$(date +"%Y_%m_%d")
log_folder="logs_folder_"$log_date
today=$(date +"%d")

#we could certainly use $APACHE_LOG_DIR var is this exist on ENV
apache_log_dir=/var/log/apache2

#make a local folder to copy all log files matching the condition
mkdir -p $apache_log_dir/$log_folder

#pick up all TODAY's log files from 18 to 21 hrs
for file in $apache_log_dir/*"$today"_18.log *"$today"_19.log *"$today"_20.log *"$today"_21.log
do
        #check if the file exists, it could be the file was not created for a certain time
        if [ -e "$file" ]
        then
                cp $file $apache_log_dir/$log_folder
        fi
done

#see README.txt, for 'key-based authentication' approach instead of sshpass
sshpass -p "$user_password" scp -r $apache_log_dir/$log_folder $user_name@$remote_host:/$dest_dir
