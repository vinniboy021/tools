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
apt-get install -y python3 python2.7 golang apache2
echo ""
#3. Instalar o Nuclei
echo "Instalando o Nuclei..."
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
sudo cp ~/go/bin/nuclei /usr/bin/
#4. Instalar o Docker IO
echo "Instalando o Docker IO..."
apt-get install -y docker.io
systemctl start docker
systemctl enable docker
#5. Atualizar pacotes do sistema
echo "Atualizando pacotes do sistema..."
apt-get update && apt-get upgrade -y

# 6. Instalar o Kali Win-KeX (última etapa)
echo "Instalando o Kali Win-KeX..."
apt-get install -y kali-win-kex

# 7. Configurar o Kex
echo "Configurando o Win-KeX..."
kex --esm

# Finalização
echo "Configuração concluída! O ambiente está pronto."
