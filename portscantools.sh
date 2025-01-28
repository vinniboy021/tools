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

while true; do
echo ""
echo ""
echo "                  PORTSCAN"
echo ""
echo ""
echo "Escolha uma opção:"
echo ""
echo "1. Dev/TCP"
echo "2. Hping3"
echo "3. Netcat"
echo "0. Sair"
read opcao

case $opcao in

1)
#dev/tcp
echo "PortScan com /dev/tcp"
echo ""
echo "Digite o IP (Ex.: 192.168.0.1)"
read ip
echo "Digite uma porta inicial (Ex: 22)"
read portai
echo "Digite uma porta final (Ex: 80)"
read portaf
for i in $(seq $portai $portaf); do timeout 0.5 echo -n 2>/dev/null < /dev/tcp/$ip/$i && echo "$i Aberta";
done
;;

2)
#hping3
echo "PortScan com hpin3"
echo ""
echo "Digite o IP (Ex.: 192.168.0.1)"
read ip
echo "Digite a porta inicial (Ex.: 22)"
read portai
echo "Digite a porta final (Ex.: 80)"
read portaf
sudo hping3 $ip -S --scan $portai-$portaf
;;

3)
#netcat
echo "PortScan com netcat"
echo ""
echo "Digite o IP (Ex.: 192.168.0.1)"
read ip
echo "Digite a porta inicial (Ex.: 22)"
read portai
echo "Digite a porta final (Ex.: 80)"
read portaf
sudo nc -v -n -z $ip $portai-$portaf
;;

0)
#sair
echo "Saindo..."
break 
;;

*)
#opção inválida
echo "Opção inválida. Tente novamente."
;;

esac
echo ""
echo "Pressione qualquer tecla para voltar ao menu..."
read -n 1 -s
done 
