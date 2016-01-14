##Script to check available ssl cyphers thath both a client and a server have
##It takes a list of currently installed cyphers on the client and checks which one is also available on the server

#!/usr/bin/env bash
if [ "$#" -eq  "0" ]
   then
     echo "Usage:./check_cyphers <hostname>:<port>"
 else
##  You can use this script as a single-line command. Please see the commented lines below
##
##  declare -a a=$(openssl ciphers 'ALL:eNULL' | sed -e 's/:/\n /g') && for i in ${a}; do \
##  result=$(echo -n | openssl s_client -cipher "$i" -connect $1 2>&1); \
##  if [[ "$result" =~ ":error:" ]] ; then echo "NO - $i"; else echo "YES - $i"; fi; done;

declare -a a=$(openssl ciphers 'ALL:eNULL' | sed -e 's/:/\n /g') 
for i in ${a}; do 
    result=$(echo -n | openssl s_client -cipher "$i" -connect $1 2>&1); 
    if [[ "$result" =~ ":error:" ]] ; then 
        echo "NO - $i"; 
    else echo "YES - $i"; 
    fi; 
done;
fi
