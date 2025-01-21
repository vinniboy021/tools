#!/bin/bash
echo "PingSweep com hping3"
echo
echo "Digite o IP da rede (Ex.: 192.168.0)"
read ip
for i in $(seq 1 254);do
	if [ -n "$(sudo hping3 -1 -c 1 $ip.$i 2>/dev/null | grep 'ttl')" ]; then echo "$ip.$i"; fi
done
