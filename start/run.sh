#!/bin/bash

#MIT License

#Copyright (c) 2017 R3D#@X0R_2H1N

#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.

while true; do

clear

siyah='\033[0;30m'
kirmizi='\033[0;31m'
yesil='\033[0;32m'
sari='\033[0;33m'
mavi='\033[0;34m'
mor='\033[0;35m'
turkuaz='\033[0;36m'
beyaz='\033[0;37m'
reset='\033[0m'


cat ~/start/ascii_3.txt

echo ""

echo -e "      ${kirmizi}[${sari}01${kirmizi}]${reset} Brute-Force"
echo -e "      ${kirmizi}[${sari}02${kirmizi}]${reset} İP to PORT"
echo -e "      ${kirmizi}[${sari}03${kirmizi}]${reset} RDDoS Tool"
echo -e "      ${kirmizi}[${sari}04${kirmizi}]${reset} Red Hawk"
echo -e "      ${kirmizi}[${sari}05${kirmizi}]${reset} Tor Browser"
echo -e "      ${kirmizi}[${sari}06${kirmizi}]${reset} İp Changer"
echo -e "      ${kirmizi}[${sari}07${kirmizi}]${reset} İwctl"	

read -p "> " cevap

case "$cevap" in
    
    1)
        clear && xterm -geometry 100x24 -e 'python3 ~/start/brute-force.py'
        read -p "Devam etmek için enter tuşuna bas..."
        ;;
    2)
        
        clear && xterm -geometry 100x24 -e 'python3 ~/start/port-searcher.py'
        read -p "Devam etmek için enter tuşuna bas..."
        ;;
    3)
        clear && xterm -geometry 100x24 -e 'python3 ~/start/RDDoS_Tool/RDDoS_Tool.py'
        read -p "Devam etmek için enter tuşuna bas... "
        ;;

    4)
        clear && xterm -geometry 100x24 -e 'php ~/start/RED_HAWK/rhawk.php' 
        read -p "Devam etmek için enter tuşuna bas..."
        ;;
    5)
        clear && sudo apt install torbrowser-launcher && torbrowser-launcher
        read -p "Devam etmek için enter tuşuna bas... "
        ;;
    6)
        clear && xterm -geometry 100x24 -e 'python3 ~/start/ip_changer/ip_changer.py'
        read -p "Devam etmek için enter tuşuna bas... "
        ;;

    7)
        clear && systemctl start iwd && xterm -geometry 100x24 -e iwctl
        read -p "Devam etmek için enter tuşuna bas... "
        ;;

    esac

done
