#!/data/data/com.termux/files/usr/bin/bash

# Cores Dandelion
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
DIM='\033[2m'

# Função para desenhar a barra
draw_bar() {
    local perc=$1
    local size=20
    local filled=$((perc * size / 100))
    local empty=$((size - filled))
    
    # Escolhe a cor da barra
    local color=$GREEN
    [ $perc -gt 50 ] && color=$YELLOW
    [ $perc -gt 85 ] && color=$RED
    
    echo -ne "${color}["
    for ((i=0; i<filled; i++)); do echo -ne "■"; done
    for ((i=0; i<empty; i++)); do echo -ne "${DIM}□"; done
    echo -ne "${color}] ${perc}%${NC}"
}

echo -e "${CYAN}🧠 Dandelion RAM Monitor${NC}\n"

# Extração de dados do free -m
read total used free shared buff cache available < <(free -m | grep "Mem:" | awk '{print $2,$3,$4,$5,$6,$7,$7}')

# Cálculo de porcentagem real (Used / Total)
perc=$((used * 100 / total))

echo -e " ${DIM}Total:     ${NC}${total}MB"
echo -e " ${DIM}Em Uso:    ${NC}${used}MB"
echo -ne " ${DIM}Status:    ${NC}"; draw_bar $perc
echo -e "\n"

# Se o uso for maior que 85%, manda um alerta nerd
if [ $perc -gt 85 ]; then
    echo -e "${RED}${BLINK}⚠️ ALERTA: Swap ou LMK podem entrar em ação!${NC}"
fi

# Módulo Swap (ZRAM no Android)
read s_total s_used s_free < <(free -m | grep "Swap:" | awk '{print $2,$3,$4}')
if [ "$s_total" -gt 0 ]; then
    s_perc=$((s_used * 100 / s_total))
    echo -ne " ${DIM}ZRAM/Swap: ${NC}"; draw_bar $s_perc
    echo -e ""
fi

