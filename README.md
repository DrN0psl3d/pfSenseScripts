# pfSenseScripts
Here are some random scripts regarding pfSense stuff..

Most of these scripts are uploaded directly to the pfSense machine.

* Note: Store them in the /root/ directory or something, or else they'll be gone after a reboot...
* Note2: Use the 'CRON' package to edit the crontab, otherwise your changes are gone after a reboot...
* Note3: if you get an error: 'Illegal option -t' when trying to SCP your files onto the pfSense... try using root@<ip> instead of <admin_username>@<ip>...
  
# vpn
VPN related scripts such as:
* vpnchecker.sh - check current available VPNs and restarts them if they are down
