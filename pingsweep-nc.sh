#!/bin/bash
echo "PingSweep com netcat"
echo
echo "Digite o IP da rede /24 (Ex.: 192.168.0)"
read ip
echo "Digite uma porta (Ex.: 80)"
read porta
for i in $(seq 1 254);do
	nc -zvw 1 $ip.$i $porta 2>/dev/null && echo "Host $ip.$i - $porta Up"
done
