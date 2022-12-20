#!/usr/bin/env bash
#
# metadados.sh - Realiza a leitura de  metadados de arquivos
# E-mail para contato =  gabriel.mmatos@proton.me
# Manutenção = Gabriel  Matos
# 
#-------------------------------------------------
			########  Descrição ###########
# Este programa irá ler metadados dos arquivos  que  o usuário selecionar \
# o programa  utiliza  a  ferramenta  lynx para realizar  busca  em  modo texto usando dorcs do google \
#  em seguida  o script irá utilizar  a ferramenta exiftool para  ler os metadados

# ----------------------------------------------
# Histórico: 
	# v1.0 15/12/2022 
#
#-------------------------------------------
# Testado em:
#	bash 

echo -e \
$'\033[33;1m
################## MATOS SECURITY #######################
------------------ SISTEMA DE  METADADOS ----------------
Versão 1.0 \033[m'	

alvo="$1"
ext="$2"
# Script para ler metadados de arquivos

function dados(){
	if [[ -z "$alvo" ]] || [[ -z "$ext" ]];then
	echo -e "Você precisa informar  o alvo e a  extensão\n use $0 -h para ver o manual "; exit;
	fi
	lynx --dump "https://google.com/search?&q=site$alvo+ext:$ext" | grep ".pdf" | cut -d "=" -f2 | egrep -v "site|google" | sed 's/...$//' > metadados
	for url in $(cat metadados); do 
		wget -q $url
	done
	#lendo metadados dos arquivos
	echo "Lendo metadados dos arquivos baixados"
	sleep 2s
	exiftool *.pdf
}


case "$1" in
	-h|--help) 
	echo \ 
	"
	################ MANUAL DE UTILIZAÇÃO ###############

	Para  usar o script informe use o exemplo abaixo:
	$0 site + extensão do arquivos
	Ex: $0 google.com pdf

	"
	;;

	*) dados
		
esac
