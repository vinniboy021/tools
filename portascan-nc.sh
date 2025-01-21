#!/bin/bash
echo "PortScan com netcat"
echo
echo "Digite o IP (Ex.: 192.168.0.1)"
read ip
echo "Digite a porta inicial (Ex.: 22)"
read portai
echo "Digite a porta final (Ex.: 80)"
read portaf
sudo nc -v -n -z $ip $portai-$portaf
