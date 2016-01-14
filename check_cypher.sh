##Script to check installed ssl cyphers on a server
##Usage:./check_cyphers -e <server>:<port> -f </path/to/file> 
##     Example: ./check_cyphers -e example.com:443 -f /tmp/cyphers.txt

##     If file parameter is not specified it will use the client list of cyphers
##     If no parameter is specified it will list local cyphers 
##     !!When using -f option please enter every cypher on a new line!! "

##Run the following linei in terminal if you want to check server cyphers against client cyphers
#declare -a a=$(openssl ciphers 'ALL:eNULL' | sed -e 's/:/\n /g') && for i in ${a}; do \
#result=$(echo -n | openssl s_client -cipher "$i" -connect www.example.com:443 2>&1); \
#if [[ "$result" =~ ":error:" ]] ; then echo "NO - $i"; else echo "YES - $i"; fi; done; 

##Run the following linei in terminal if you want to check server cyphers against cyphers in file.txt
#declare -a a=$(cat file.txt) && for i in ${a}; do \
#result=$(echo -n | openssl s_client -cipher "$i" -connect www.example.com:443 2>&1); \
#if [[ "$result" =~ ":error:" ]] ; then echo "NO - $i"; else echo "YES - $i"; fi; done; 

#!/usr/bin/env bash
while [[ $# > 1 ]]
do
key="$1"

case $key in
    -e|--endpoint)
    ENDPOINT="$2"
    shift # past argument
    ;;
    -f|--fileath)
    FILEPATH="$2"
    shift # past argument
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done
#echo endpoint = "${ENDPOINT}"
#echo file     = "${FILEPATH}"
echo $1
if [[ -n $1 ]]; then
    echo -e " Usage:./check_cyphers -e <server>:<port> -f </path/to/file> \n Example: ./check_cyphers -e example.com:443 -f /tmp/cyphers.txt\
    \n If file parameter is not specified it will use the client list of cyphers 
    \n If no parameter is specified it will list local cyphers 
    \n When using -f option please enter every cypher on a new line! "
fi

if [[ -z ${FILEPATH} ]] ; then
    declare -a a=$(openssl ciphers 'ALL:eNULL' | sed -e 's/:/\n /g')
    for i in ${a}; do
        result=$(echo -n | openssl s_client -cipher "$i" -connect ${ENDPOINT} 2>&1);
        if [[ "$result" =~ ":error:" ]] ; then
            echo "NO - $i";
            else echo "YES - $i";
        fi;
    done;
    #echo "empty filepath0"
else
    declare -a a=$(cat ${FILEPATH})
    for i in ${a}; do
        result=$(echo -n | openssl s_client -cipher "$i" -connect ${ENDPOINT} 2>&1);
        if [[ "$result" =~ ":error:" ]] ; then
            echo "NO - $i";
            else echo "YES - $i";
        fi;
    done;
#echo filepath=${FILEPATH}
fi
