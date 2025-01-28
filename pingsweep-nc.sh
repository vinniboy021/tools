#!/bin/bash
echo "██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗    ████████╗ ██████╗  ██████╗ ██╗     ███████╗"
echo "██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝    ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝"
echo "██║ █╗ ██║██║   ██║██████╔╝█████╔╝        ██║   ██║   ██║██║   ██║██║     ███████╗"
echo "██║███╗██║██║   ██║██╔══██╗██╔═██╗        ██║   ██║   ██║██║   ██║██║     ╚════██║"
echo "╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗       ██║   ╚██████╔╝╚██████╔╝███████╗███████║"
echo " ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝"
echo "											by K3y$"
echo ""
echo ""
datahora=$(date +%d/%m/%Y" - "%H:%M:%S)
cidade="Rio de Janeiro - RJ"
echo $cidade $datahora
echo ""
echo "PingSweep com netcat"
echo ""
echo "Digite o IP da rede /24 (Ex.: 192.168.0)"
read ip
echo "Digite uma porta (Ex.: 80)"
read porta
for i in $(seq 1 254);do
	nc -zvw 1 $ip.$i $porta 2>/dev/null && echo "Host $ip.$i - $porta Up"
done
