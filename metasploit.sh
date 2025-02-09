#!/bin/bash

echo "[+]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++[+]"
echo "[+]++++++++++++++ Removendo o PostgreSQL: ++++++++++++++++++++++++[+]"
sudo apt remove --purge postgresql-15 -y 2>/dev/nul
sudo apt remove --purge postgresql-16 -y 2>/dev/nul
sudo apt remove --purge postgresql-17 -y 2>/dev/nul
sudo apt remove --purge postgresql-client-15 -y 2>/dev/nul
sudo apt remove --purge postgresql-client-16 -y 2>/dev/nul
sudo apt remove --purge postgresql-client-17 -y 2>/dev/nul

echo "[+]+++++++++++++ Atualizando a lista dos repositório: ++++++++++++[+]"
sudo apt update -y 2>/dev/nul

echo "[+]++ Instalando novamente o PostgreSQL: +++++++++++++++++++++++++[+]"
sudo apt install postgresql -y 2>/dev/nul

echo "[+]++ Instalando novamente o Metasploit Framework: +++++++++++++++[+]"
sudo apt install metasploit-framework -y 2>/dev/nul

echo "[+]++++++++++++ Iniciando o serviço do PostgreSQL: +++++++++++++++[+]"
sudo systemctl start postgresql

echo "[+] Habilitando o serviço do PostgreSQL na inicialização do kali: [+]"
sudo systemctl enable postgresql

echo "[+} +++++++ Reinicializando o banco de dados do msfconsole: ++++++[+]"
sudo msfdb reinit

echo "[+]++++ Verificando o status do banco de dados do msfconsole: ++++[+]"
sudo msfdb status

echo "[+]++++++++++++++++ Executa o Metasploit Framework: ++++++++++++++[+]"
msfconsole
