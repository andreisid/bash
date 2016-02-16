#some bash scripts

###check_cipher.sh 
Checks openssl ciphers installed on remote server</br>
Usage:./check_ciphers -e <server>:<port> -f </path/to/file> </br>
Example: ./check_ciphers -e example.com:443 -f /tmp/ciphers.txt</br>
</br>
If file parameter is not specified it will use the client list of ciphers</br>
If no parameter is specified it will list local ciphers </br>
!!When using -f option please enter every cipher on a new line!! "</br>

###killswitch.sh
Allows internet traffic only on OpenVPN interface.</br>
Usage: ./killswitch.sh</br>
</br>
"ATTENTION! Please run the script after connecting to the VPN\n"</br>
You will be propted for your vpn gateway ip.</br>
If the VPN fails all trafficis restricted until vpn reconnects.</br>

