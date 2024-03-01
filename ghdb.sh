#!/bin/bash


################################################################################
# Titulo    : GHDB -seach google dork-                                    #
#                                                                              #
# Versao    : 1.1                                                              #
# Data      : 28/02/2024                                                       #
# AUTOR     : FRANCÊS                                                          #
# Tested on : Linux                                                            #
# -----------------------------------------------------------------------------#
# Descrição:                                                                   #
#   Este faz buscas no google por metodo de sintaxe de google dorks            #
#                                                                              #
#                                                                              #
################################################################################




# Tabela de Cores
GREEN='\e[32;1m'
GREEN_BLINK='\e[32;5;1m'
YELLOW='\e[33;1m'
YELLOW_BLINK='\e[33;5;1m'
RED='\e[31;1m'
RED_BLINK='\e[31;5;1m'
END='\e[m'

if [ -z "$1" ]
then    
        echo -e "


${YELLOW_BLINK}

    /|    / /     //   ) )       //   ) )     / /        //   / /     //   ) )     //   ) )
   //|   / /     //   / /       //___/ /     / /        //____       ((           ((
  // |  / /     //   / /       / __  (      / /        / ____          \\           \\
 //  | / /     //   / /       //    ) )    / /        //                 ) )          ) )
//   |/ /     ((___/ /       //____/ /    / /____/ / //____/ /    ((___ / /    ((___ / /
${END}${RED}

“⠄⠄⣿⣿⣿⣿⠘⡿⢛⣿⣿⣿⣿⣿⣧⢻⣿⣿⠃⠸⣿⣿⣿⠄⠄⠄⠄
⠄⠄⣿⣿⣿⣿⢀⠼⣛⣛⣭⢭⣟⣛⣛⣛⠿⠿⢆⡠⢿⣿⣿⠄⠄⠄⠄⠄
⠄⠄⠸⣿⣿⢣⢶⣟⣿⣖⣿⣷⣻⣮⡿⣽⣿⣻⣖⣶⣤⣭⡉⠄⠄⠄⠄⠄
⠄⠄⠄⢹⠣⣛⣣⣭⣭⣭⣁⡛⠻⢽⣿⣿⣿⣿⢻⣿⣿⣿⣽⡧⡄⠄⠄⠄
⠄⠄⠄⠄⣼⣿⣿⣿⣿⣿⣿⣿⣿⣶⣌⡛⢿⣽⢘⣿⣷⣿⡻⠏⣛⣀⠄⠄
⠄⠄⠄⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠙⡅⣿⠚⣡⣴⣿⣿⣿⡆⠄
⠄⠄⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠄⣱⣾⣿⣿⣿⣿⣿⣿⠄
⠄⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿GOSTOSAA⣿⣿⣿⣿⠄
⠄⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠣⣿⣿⣿⣿⣿⣿⣿⣿⣿⠄
⠄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠑⣿⣮⣝⣛⠿⠿⣿⣿⣿⣿⠄
⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⠄⠄⠄⠄⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠄” ${END}

        Usage   : ${RED}${0}${END} [URL]
        Example : ${RED}${0}${END} www.site.com
 


"
else
    
SEARCH="firefox"
ALVO="$1"
echo -e " ${RED_BLINK}
======================================================================================
PESQUISA $ALVO NO PASTE BIN :
${END}"
$SEARCH "http://google.com/search?q=site:pastebin.com+$ALVO" 2> /dev/null

echo -e "${YELLOW} Finishid !!${END}"

echo -e "${RED_BLINK} 
=======================================================================================
PESQUISA $ALVO NO TRELLO
${END}"

echo -e "${YELLOW} Finishid !!${END}"

$SEARCH "https://google.com/search?q=site:trello.com+$ALVO" 2> /dev/null

echo -e "${RED_BLINK}
======================================================================================
PESQUISA $ALVO POR ARQUIVOS
${END}"
$SEARCH "https://google.com/search?q=site:$ALVO+ext:php+OR:ext:asp+OR+ext:txt" 2> /dev/null

echo -e " ${YELLOW} Finishid!! ${ENDS}"
fi