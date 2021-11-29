# Bash-Apache-Logger
Bash Apache Logger is a Bash script which can be used for listening and fetching IP entries from Apache access.log file and find the geolocation information of the retrived IP's.
## How It Works? ##
Apache Logger is a listening script to listen Apache access.log file.
The default path to apache log file is <br />`/var/logs/apache2/access.log` <br />
The log file records all IP addresses that are connected to the apache server. <br />
<br />
The script reads the access.log file and fetch all the IP addresses. It also removes all the duplicate entries.
<br />
Then the geolocation information of every IP is retreived using free IP API service [ipapi.co](https://ipapi.co) <br />
Following script is used to fetch the geolocation informaton <br />
`curl -s "https://ipapi.co/$ip/json/"`<br />
Then the output is written into a new file. And the script executes every 30 minutes autmatically the fetch information from the log file<br />
## How to Run the script? ##
On the terminal give execute permission to the file using `chmod +x apache-logger.sh`<br />
Then run the script by `./apache-logger.sh`

<br /><br />
A sample apache log file access.log is also attached to the repository.<br />

## Additional Work Needed ##
*Currently, Each geolocation information is appended to the end of the output file, but new entries should be appended to the beginning of the output file.*
