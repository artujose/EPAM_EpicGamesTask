Script name "get_500ErrorCodes_requests.sh"

Arguments
- None.

Example:
./get_500ErrorCodes_requests.sh

NOTES:
- I am considering our default Apache log directory: /var/log/apache2
- The script reads all log files having 500 error code entries.
- I'm printing the full line logged into the log file, as a "request".

Estimated time to solve this:
2 hrs 30 min