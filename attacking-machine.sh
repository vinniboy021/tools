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

# 1. Instalar pacotes completos do Kali Linux
print_message "Instalando pacotes completos do Kali Linux..."
sudo apt install -y kali-linux-large

# 2. Instalar dependências essenciais
print_message "Instalando dependências essenciais..."
sudo apt install -y python3 python2.7 golang apache2

# 3. Instalar o Nuclei
print_message "Instalando o Nuclei..."
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
sudo cp ~/go/bin/nuclei /usr/bin/

# 4. Instalar o Docker IO
print_message "Instalando o Docker IO..."
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

# 5. Atualizar pacotes do sistema
print_message "Atualizando pacotes do sistema..."
sudo apt update && sudo apt upgrade -y

# 6. Instalar o Kali Win-KeX (última etapa)
print_message "Instalando o Kali Win-KeX..."
sudo apt install -y kali-win-kex

# 7. Configurar o Kex
print_message "Configurando o Win-KeX..."
kex --esm

# Finalização
print_message "Configuração concluída! O ambiente está pronto."
