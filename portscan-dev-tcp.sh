#!/bin/bash
echo "PortScan com /dev/tcp"
echo
echo "Digite o IP (Ex.: 192.168.0.1)"
read ip
echo "Digite uma porta inicial (Ex: 22)"
read portai
echo "Digite uma porta final (Ex: 80)"
read portaf
for i in $(seq $portai $portaf); do timeout 0.5 echo -n 2>/dev/null < /dev/tcp/$ip/$i && echo "$i Aberta";
done
