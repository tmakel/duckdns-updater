# duckdns-updater
Simple BASH shell script for updating the IPv4 IP of a DuckDNS domain

# Usage
- Clone this repo: `git clone https://github.com/tmakel/duckdns-updater.git`
- Go to the folder repo: `cd duckdns-updater`
- Create the token file, containing your DuckDNS token: `echo '<your-duck-dns-token>' > token`
- Add this to your crontab: `*/5 * * * * /home/pi/duckdns-updater/update.sh >/dev/null 2>&1`
- Keep an eye on your syslog: `tail -f /var/log/syslog`, you should see lines like `pi: duckdns-updater: OK xxx.xxx.xxx.xxx NOCHANGE` every 5 minutes.
- That's all!