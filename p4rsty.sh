#!/bin/bash

# __author__
# str4vinsk

if [ "$EUID" -ne 0 ];then
	echo "[!!] Run p4rsty as root! [!!]"
  	exit
fi

if [ $# -lt 1 ];then
echo " "
echo "                          [!!] ERROR [!!]                                          "
echo "          Use: p4rsty (site_url)                  "
echo " "
exit
fi

echo " "
echo "                          [??] PARSING [??]                                       "
echo " "

echo "          [!!] Checking for p4rsty directory... [!!]"
if [ -e /usr/share/p4rsty/ ];then
echo "          [++] The directory exist."
echo " "
else
echo "          [--] The directory does not exist, creating /usr/share/p4rsty"
mkdir /usr/share/p4rsty
echo " "
fi
# Aqui pegamos o código fonte atravéz do wget.
# -O-    ---->    Informamos que não queremos salvar o index em lugar nenhum.
# -q     ---->    Modo quieto (silencioso)
wget -q -O- $1 | grep 'href' | grep '\.' | cut -d '"' -f2 | egrep 'http://|https://' | cut -d '/' -f3 | sort -u > /usr/share/p4rsty/result_list
for n in $(cat /usr/share/p4rsty/result_list);do host $n;done | grep 'has address' | sed 's/has address/--------->/'
echo " "
