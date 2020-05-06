#!/bin/bash

# __author__
# str4vinsk

if [ $# -lt 1 ];then
echo " "
echo "                          [!!] ERRO [!!]                                          "
echo "          Use: p4rsty (Endereço_do_site)                  "
echo " "
exit
fi

echo " "
echo "                          [??] PARSING [??]                                       "
echo " "

echo "          [!!] Checking for p4rsty directory... [!!]"
if [ -e /home/p4rsty/ ];then
echo "          [++] The directory exist."
echo " "
else
echo "          [--] The directory does not exist, creating /home/p4rsty"
mkdir /home/p4rsty
echo " "
fi
# Aqui pegamos o código fonte atravéz do wget.
# -O-    ---->    Informamos que não queremos salvar o index em lugar nenhum.
# -q     ---->    Modo quieto (silencioso)
wget -q -O- $1 | grep 'href' | grep '\.' | cut -d '"' -f2 | egrep 'http://|https://' | cut -d '/' -f3 | sort -u > /home/p4rsty/result_list
for n in $(cat /home/p4rsty/result_list);do host $n;done | grep 'has address' | sed 's/has address/--------->/'
echo " "
