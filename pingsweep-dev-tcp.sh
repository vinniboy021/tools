#!/bin/bash
echo "PingSweep com /dev/tcp"
echo
echo "Digite o IP da rede (Ex.: 192.168.0)"
read rede
echo "Digite uma porta (Ex: 80)"
read port
for ip in $(seq 1 254); do
	timeout 0.5 echo -n 2>/dev/null < /dev/tcp/$rede.$ip/$port && echo "Host $rede.$ip Ativo Porta $port Open"
done
