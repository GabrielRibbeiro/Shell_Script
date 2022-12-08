<<coment
Autor: Gabriel Matos
Script para realizar  brute force e encontrar subdomínios e  arquivos 
coment
#!/usr/bin/env bash
#Realizando verificações 

#Verificando se esta conectado a internet
if ! wget -q --spider "google.com";then
	echo "Para executar  o  script é necessário acesso a internet";
	exit;
fi
# Vericando se passou a  primeira varivael posicional
[[ -z "$1" ]] && { echo "Use -h para  ver o modo de  uso"; exit 1; }
###-----------------------------------------------------------------
function _help (){
		echo \
		"
				Modo de uso: 

$0 -i|--iniciar domínio.com.br extensão  - Realiza  um brute force  procurando por diretórios e arquivo com a wordlist padrão

$0 -l|--local domínio.com.br arquivo - Realiza  um brute force  procurando por diretórios e arquivo com a wordlist local 
		" 
}

echo \
"
##################### MATOS SECURITY #######################
Versão:1.0
############################################################
"

case "$1" in
	-h|--help) 
		_help;;
	-i|--inicar) 
#Prcourando por diretórios

	echo "Iniciando...."; sleep 5s; clear
#Verificando a tecnologia 
	servidor=$(curl -s --head $2 | grep "Server:")
	echo "Tecnologia do dominio: $servidor"
	for list in $(cat subdomains.txt); do
	busca=$(curl -H "User-Agent:Mozilla/5.0 (Macintosh; Intel Mac OS X x.y; rv:42.0" -s -o /dev/null -w "%{http_code}" $2/$list/)
		if [[ "$busca" = "200" ]];then
			echo "Diretório encontrado: $2/$list";
		fi
	done
#Procurando por arquivos
	for arquivo in $(cat subdomains.txt); do
		arq=$(curl -H "User-Agent:Mozilla/5.0 (Macintosh; Intel Mac OS X x.y; rv:42.0" -s -o /dev/null -w "%{http_code} $2/arquivo.$3")
		if [[ "$arq" = "200" ]];then
			echo "Arquivo encontrado: $2/list.$3"
		fi
	done;;

	-l|--local)
#Prcourando por diretórios
	echo "Iniciando...."; sleep 5s; clear
#Verificando a tecnologia
	servidor=$(curl -s --head $2 | grep "Server:")
	echo "Tecnologia do dominio: $servidor"
	for list in $(cat "$4"); do
	busca=$(curl -H "User-Agent:Mozilla/5.0 (Macintosh; Intel Mac OS X x.y; rv:42.0" -s -o /dev/null -w "%{http_code}" $2/$list/)
		if [[ "$busca" = "200" ]];then
			echo "Diretório encontrado: $2/$list";
		fi
	done
#Procurando por arquivos
	for arquivo in $(cat "$4"); do
		arq=$(curl -H "User-Agent:Mozilla/5.0 (Macintosh; Intel Mac OS X x.y; rv:42.0" -s -o /dev/null -w "%{http_code}" $2/arquivo.$3)
		if [[ "$arq" = "200" ]];then
			echo "Arquivo encontrado: $2/list.$3"
		fi
	done;;
esac 
