#!/bin/bash
# nmap [tipo de scan] [opções] [alvo ou lista.txt]
#########################Variáveis#########################
#ip = Endereço IP
#site = Endereço de site
#port = Porta específica
#mac =  Endereço MAC
#datahora = Data e hora atual
###########################################################
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
echo "                  NMAP"
echo ""
echo ""
echo "Escolha uma opção:"
echo ""
echo "1. Alvo Específico"
echo "2. Descobrir Host"
echo "3. Ping Scan"
echo "4. Trace Route"
echo "5. Detecção de Serviço e Versão"
echo "6. Detecção de Sistema Operacional"
echo "7. Script Scan (NSE)"
echo "8. Spoof Mac"
echo "9. Whois"
echo "0. Sair"
read opcao

case $opcao in

1)
#alvoespecifico
echo "Alvo Específico"
echo "Digite o IP: (192.168.1.100)"
read ip
echo "Digite a Porta: (80)"
read port
nmap -p$port $ip
;;

2)
#descobrirhost
echo "Descobrir Host"
echo "Digite o IP/24: (192.168.1.0/24)"
read ip
nmap -sL $ip
;;

3)
#pingscan
echo "Ping Scan"
echo "Digite o IP/24: (192.168.1.0/24)"
read ip
nmap -sn $ip
;;

4)
#traceroute
echo "Trace Route"
echo "Digite o IP: (192.168.1.100)"
read ip
nmap --traceroute $ip
;;

5)
#deteccaoservicoeversao
echo "Detecção de Serviço e Versão"
echo "Digite o IP: (192.168.1.100)"
read ip
nmap -sV $ip
;;

6)
#deteccaosistemaoperacional
echo "Detecção de Sistema Operacional"
echo "Digite o IP: (192.168.1.100 ou 192.168.1.100/24)"
read ip
nmap -O $ip
;;

7)
#scriptscan
echo "Script Scan (NSE)"
echo "Digite o IP: (192.168.1.100)"
read ip
nmap -sC $ip
;;

8)
#spoofmac
echo "Spoof Mac"
echo "Digite o MAC (00.00.00.00.00.00)"
read mac
echo "Digite o IP: (192.168.1.100)"
read ip
nmap --spoof-mac $mac $ip
;;

9)
#whois
echo "Whois"
echo "Digite o Site (www.google.com)"
read site
nmap --script whois-domain.nse $site
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



