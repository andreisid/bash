#some bash scripts

###check_cipher.sh 
Checks openssl ciphers installed on remote server
Usage:./check_ciphers -e <server>:<port> -f </path/to/file> 
Example: ./check_ciphers -e example.com:443 -f /tmp/ciphers.txt

If file parameter is not specified it will use the client list of ciphers
If no parameter is specified it will list local ciphers 
!!When using -f option please enter every cipher on a new line!! "

###killswitch.sh
Allows internet traffic only on OpenVPN interface.
Usage: ./killswitch.sh

"ATTENTION! Please run the script after connecting to the VPN\n"
You will be propted for your vpn gateway ip.
If the VPN fails all trafficis restricted until vpn reconnects.

