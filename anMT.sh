#!/bin/bash 

################################################################################
# Titulo    :  WORST - coleta de metadados de arquivos -                                    #
#                                                                              #
# Versao    : 1.2                                                              #
# Data      : 29/02/2024                                                       #
# AUTOR     : FRANCÊS                                                          #
# Tested on : Linux                                                            #
# -----------------------------------------------------------------------------#
# Descrição:                                                                   #
#   coleta de arquivos por google dorks e analise de metadados com exiftool    #
#                                                                              #
#                                                                              #
################################################################################

# Tabela de Cores
GREEN='\e[32;1m'
YELLOW='\e[33;1m'
END='\e[m'

# Apresentação inicial
echo -e "${GREEN}
          _____                       
         /\    \                    
        /::\____\                    
       /:::/    /                   
      /:::/   _/___                  
     /:::/   /\    \             
    /:::/   /::\____\            
   /:::/   /:::/    /           
  /:::/   /:::/   _/___           
 /:::/___/:::/   /\    \        
|:::|   /:::/   /::\____\       
|:::|__/:::/   /:::/    /         
 \:::\/:::/   /:::/    /          
  \::::::/   /:::/    /            
   \::::/___/:::/    /              
    \:::\__/:::/    /              
     \::::::::/    /            
      \::::::/    /           
       \::::/    /                       
        \::/____/           
                        pdf, doc, docx, xls, slsx, ppt, pptx${END}
"

# Solicitar ao usuário o site a ser consultado
echo -e "${GREEN}Digite o site que deseja consultar (ex: desecsecurity.com): ${END}"
read -r site

# Solicitar ao usuário a extensão dos arquivos
echo -e "${GREEN}Escolha a extensão dos arquivos que deseja buscar:${END}"
echo -e "${YELLOW}1. PDF\n2. DOCX\n3. XLSX\n4. PPTX\n5. JPG\n6. PNG\n7. MP3\n8. MP4\n9. ZIP\n10. CSN\n11. TXT${END}"
read -p "Opção: " opcao

case $opcao in
    1) extensao="pdf" ;;
    2) extensao="docx" ;;
    3) extensao="xlsx" ;;
    4) extensao="pptx" ;;
    5) extensao="jpg" ;;
    6) extensao="png" ;;
    7) extensao="mp3" ;;
    8) extensao="mp4" ;;
    9) extensao="zip" ;;
    10) extensao="csv" ;;
    11) extensao="txt" ;;
    *) echo "Opção inválida. Saindo." >&2; exit 1 ;;
esac

# Construir a consulta do Google Dorks
query="site:$site+ext:$extensao"

# Baixar os arquivos encontrados
lynx_output=$(lynx --dump "https://google.com/search?q=$query")
if [[ $? -ne 0 ]]; then
    echo "Erro ao acessar o Google. Saindo." >&2
    exit 1
fi

download_links=$(echo "$lynx_output" | grep -E ".$extensao" | cut -d "=" -f2 | egrep -v "site|google" | sed 's/...$//' ) 2> /dev/null

# Verifica se foram encontrados resultados
if [[ -z "$download_links" ]]; then
    echo "Nenhum resultado encontrado para a busca especificada. Saindo." >&2
    exit 1
fi

# Baixar os arquivos encontrados
for url in $download_links; do
    wget -q "$url"
done

# Extrair metadados dos arquivos baixados
exiftool *.$extensao

# Remover arquivos temporários
rm -rf *.$extensao
rm -rf *.html

