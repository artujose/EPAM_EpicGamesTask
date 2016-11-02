Script name "copy_logs_remotetly.sh"

Arguments
- Remote host, the host to send the log files.
- Destination direectory, the folder where the log files will be copied.
- User name, in order to make a secure copy, we'll use "scp" so, user and password are required. (See NOTES)
- User password

Example:
./copy_logs_remotely.sh 192.168.11.141 /home/arturod myUserId myPassword

In order to schedule our script to run daily ( daily at 23 hrs), I add an entry to the crontab list:
 $ crontab -e
 $ 0 23 * * * /home/arturod/copy_logs_remotetly.sh


NOTE:
Instead of using "sshpass" tool, it's better to have a key-based authentication.

- get public and private keys without passphrase, using "ssh-keygen" tool.
- copy  the public key to the host, by using "scp", grant the needed permission chmod 700 in the host
- in the host, create an "authorized_keys" file, and copy the key, from the copied id_rsa.pub, to this
	cat id_rsa.pub >> authorized_keys
- now, we're able to use "scp" without password input required. 
	scp -r $apache_log_dir/$log_folder $user_name@$remote_host:/$dest_dir

Estimated time to solve this:
2 hr