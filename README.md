# duckdns-updater
Simple BASH shell script for updating the IPv4 IP of a DuckDNS domain

# Usage
- Clone this repo: `git clone https://github.com/tmakel/duckdns-updater.git`
- Go to the folder repo: `cd duckdns-updater`
- Create a config file: `cp config.dist.cfg config.cfg`
- Edit the `config.cfg` file and update the `TOKEN` and `DOMAINS` variables with your DuckDNS API token and domain(s)
- Perform a test run by invoking `./update.sh`, the response should look like `OK <your-IPv4-address> UPDATED` or `OK <your-IPv4-address> NOCHANGE`
- Add this to your crontab: `*/5 * * * * /home/pi/duckdns-updater/update.sh >/dev/null 2>&1`
- Keep an eye on your syslog: `tail -f /var/log/syslog`, you should see lines like `pi: duckdns-updater: OK <your-IPv4-address> NOCHANGE` every 5 minutes.
- Done!