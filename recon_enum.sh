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

# Verifica se um IP foi passado
if [ -z "$1" ]; then
    echo "Uso: $0 <IP-alvo>"
    exit 1
fi

TARGET=$1
OUTPUT_DIR="recon_$TARGET"
mkdir -p $OUTPUT_DIR

echo "[*] Iniciando reconhecimento em $TARGET"
echo "[*] Salvando resultados em $OUTPUT_DIR"

# Verifica se o host está online
ping -c 1 $TARGET > /dev/null
if [ $? -ne 0 ]; then
    echo "[!] Host $TARGET não responde ao ping."
else
    echo "[*] Host ativo."
fi

# Nmap - Fast Scan
echo "[*] Nmap - Scan rápido"
nmap -T4 -F -oN $OUTPUT_DIR/nmap_fast.txt $TARGET

# Nmap - Scan detalhado
echo "[*] Nmap - Scan detalhado de portas abertas"
nmap -sC -sV -p- -T4 -oN $OUTPUT_DIR/nmap_full.txt $TARGET

# Análise de serviços
if grep -q "80/tcp open" $OUTPUT_DIR/nmap_full.txt || grep -q "443/tcp open" $OUTPUT_DIR/nmap_full.txt; then
    echo "[*] Detectado serviço web. Rodando whatweb e gobuster..."
    whatweb $TARGET > $OUTPUT_DIR/whatweb.txt
    gobuster dir -u http://$TARGET -w /usr/share/wordlists/dirb/common.txt -o $OUTPUT_DIR/gobuster.txt
    nikto -h http://$TARGET > $OUTPUT_DIR/nikto.txt
fi

if grep -q "21/tcp open" $OUTPUT_DIR/nmap_full.txt; then
    echo "[*] Detectado FTP. Tentando conexão anônima..."
    echo -e "open $TARGET\nuser anonymous\npass anonymous\nls\nbye" | ftp -n > $OUTPUT_DIR/ftp_enum.txt
fi

if grep -q "139/tcp open" $OUTPUT_DIR/nmap_full.txt || grep -q "445/tcp open" $OUTPUT_DIR/nmap_full.txt; then
    echo "[*] Detectado SMB. Rodando enum4linux..."
    enum4linux -a $TARGET > $OUTPUT_DIR/enum4linux.txt
fi

echo "[*] Reconhecimento e enumeração concluídos. Resultados em: $OUTPUT_DIR"
