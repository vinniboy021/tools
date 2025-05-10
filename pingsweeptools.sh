#!/bin/bash
echo "██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗    ████████╗ ██████╗  ██████╗ ██╗     ███████╗"
echo "██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝    ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝"
echo "██║ █╗ ██║██║   ██║██████╔╝█████╔╝        ██║   ██║   ██║██║   ██║██║     ███████╗"
echo "██║███╗██║██║   ██║██╔══██╗██╔═██╗        ██║   ██║   ██║██║   ██║██║     ╚════██║"
echo "╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗       ██║   ╚██████╔╝╚██████╔╝███████╗███████║"
echo " ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝"
echo "											by Kr4v3n"
echo ""
echo ""
datahora=$(date +%d/%m/%Y" - "%H:%M:%S)
cidade="Rio de Janeiro - RJ"
echo $cidade $datahora

while true; do
echo ""
echo ""
echo "                  PINGSWEEP"
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
echo "PingSweep com /dev/tcp"
echo ""
echo "Digite o IP da rede (Ex.: 192.168.0)"
read rede
echo "Digite uma porta (Ex: 80)"
read port
for ip in $(seq 1 254); do
	timeout 0.5 echo -n 2>/dev/null < /dev/tcp/$rede.$ip/$port && echo "Host $rede.$ip Ativo Porta $port Open"
done
;;

2)
#hping3
echo "PingSweep com hping3"
echo ""
echo "Digite o IP da rede (Ex.: 192.168.0)"
read ip
for i in $(seq 1 254);do
	if [ -n "$(sudo hping3 -1 -c 1 $ip.$i 2>/dev/null | grep 'ttl')" ]; then echo "$ip.$i"; fi
done
;;

3)
#netcat
echo "PingSweep com netcat"
echo ""
echo "Digite o IP da rede /24 (Ex.: 192.168.0)"
read ip
echo "Digite uma porta (Ex.: 80)"
read porta
for i in $(seq 1 254);do
	nc -zvw 1 $ip.$i $porta 2>/dev/null && echo "Host $ip.$i - $porta Up"
done
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
