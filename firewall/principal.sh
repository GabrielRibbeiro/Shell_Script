#!/usr/bin/env bash
## Script criado para criar regras de firewall 

source funcao.sh
echo -e \
$'\033[33;1m
################## MATOS SECURITY #######################
------------------ SISTEMA DE  CONFIGURAÇÃO ----------------
Versão 1.0 \033[m'			

# Usuário tem que fazer  o login como usuário root 
[[ "$UID" -ne "0" ]] && { echo -e $'\033[31;1m##### Tem que logar como usuário root ########\033[m'; exit 1; }

echo -e $'\033[31;1m \tUse -f para configurar  firewall ou -i para configurar IDS\033[m'
read -p "Deseja configurar Firewall ou IDS? " configurar

case "$configurar" in 
    -f|--firewall)
        regras && echo "Finalizado ";;
esac