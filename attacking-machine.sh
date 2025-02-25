#!/bin/bash
echo " █████╗ ████████╗████████╗ █████╗  ██████╗██╗  ██╗██╗███╗   ██╗ ██████╗     ███╗   ███╗ █████╗  ██████╗██╗  ██╗██╗███╗   ██╗███████╗ "
echo " ██╔══██╗╚══██╔══╝╚══██╔══╝██╔══██╗██╔════╝██║ ██╔╝██║████╗  ██║██╔════╝     ████╗ ████║██╔══██╗██╔════╝██║  ██║██║████╗  ██║██╔════╝"
echo " ███████║   ██║      ██║   ███████║██║     █████╔╝ ██║██╔██╗ ██║██║  ███╗    ██╔████╔██║███████║██║     ███████║██║██╔██╗ ██║█████╗  "
echo " ██╔══██║   ██║      ██║   ██╔══██║██║     ██╔═██╗ ██║██║╚██╗██║██║   ██║    ██║╚██╔╝██║██╔══██║██║     ██╔══██║██║██║╚██╗██║██╔══╝  "
echo " ██║  ██║   ██║      ██║   ██║  ██║╚██████╗██║  ██╗██║██║ ╚████║╚██████╔╝    ██║ ╚═╝ ██║██║  ██║╚██████╗██║  ██║██║██║ ╚████║███████╗"
echo " ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝"
echo "											                                                                                                                          by K3y$"
echo ""
echo ""
datahora=$(date +%d/%m/%Y" - "%H:%M:%S)
cidade="Rio de Janeiro - RJ"
echo $cidade $datahora 
echo ""
echo ""
#1. Instalar pacotes completos do Kali Linux
echo "Instalando pacotes completos do Kali Linux..."
apt-get install -y kali-linux-large
echo ""
#2. Instalar dependências essenciais
echo "Instalando dependências essenciais..."
apt-get install -y python3 python2.7 libssl-dev pkg-config golang apache2 selinux-basics hcxtools nmap kolourpaint whois ccrypt cifs-utils pacu routersploit reaver net-tools hping3 tcpdump netcat-traditional mdk4 git freeradius wget maltego keepassxc-full otpclient duplicity torbrowser-launcher netcat-openbsd socat dmitry whatweb python3-venv wget2 cargo 
echo ""
#3. Instalar o Nuclei
echo "Instalando o Nuclei..."
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
sudo cp ~/go/bin/nuclei /usr/bin/
echo ""
#4. Instalar o Docker IO
echo "Instalando o Docker IO..."
apt-get install -y docker.io
systemctl start docker
systemctl enable docker
echo ""
#5. Instalar o WPScan
echo "Instalando o WPScan ..."
gem install wpscan 
echo ""
#6. Atualizar pacotes do sistema
echo "Atualizando pacotes do sistema..."
apt-get update && apt-get upgrade -y
echo ""
#7. Instalar o Kali Win-KeX
echo "Instalando o Kali Win-KeX..."
apt-get install -y kali-win-kex
echo ""
#8. Configurar o Kex
echo "Configurando o Win-KeX..."
kex --esm
echo ""
#9. Instalar Cracken
echo "Instalando Cracken..."
git clone https://github.com/shmuelamar/cracken
cd cracken
cargo build --release
cd target
cd release
cp cracken /usr/bin
echo ""

# Finalização
echo "Configuração concluída! O ambiente está pronto."
