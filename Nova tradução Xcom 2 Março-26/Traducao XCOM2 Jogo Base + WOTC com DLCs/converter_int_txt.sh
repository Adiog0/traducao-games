#!/bin/bash

# Caminho do diretório (entre aspas devido aos espaços)
DIR="/home/adriano/Documentos/GitHubRepo/traducao-games/Nova tradução Xcom 2 Março-26/Traducao XCOM2 Jogo Base + WOTC com DLCs/XCom2-WarOfTheChosen/"

echo "Iniciando a conversão de .int para .txt (UTF-8)..."

# Busca recursiva por arquivos .int ou .INT
find "$DIR" -type f -iname "*.int" | while read -r arquivo_int; do

    # Define o nome do novo arquivo trocando a extensão para .txt
    arquivo_txt="${arquivo_int%.*}.txt"

    # Converte para UTF-8.
    # Se o arquivo original já for UTF-8, ele apenas copia.
    # Se for Windows-1252 ou UTF-16, o iconv tenta ajustar.
    iconv -f UTF-8 -t UTF-8 "$arquivo_int" -o "$arquivo_txt" 2>/dev/null || cp "$arquivo_int" "$arquivo_txt"

    echo "Gerado: $(basename "$arquivo_txt")"
done

echo "---"
echo "Processo concluído!"
