#!/usr/bin/env bash
_user="$USER"

echo \ 
"
################## MATOS SECURITY #######################
------------------ SISTEMA DE  BACKUP ----------------
Versão 1.0	
"
#Verificando se usuário é root
[[ "$UID" -eq "0" ]] && { echo "Usuário root não pode executar esse  programa"; exit 1; }

function backup(){
	[[ $(cd "$HOME"; mkdir backup) ]]
	echo "Inciando backup, aguarde..."
	sleep 2s
	[[ $(tar -cvf backup.tar /home/$_user) ]] && $(mv backup.tar backup)
	clear && echo \ 
	" 		
	########### Backup Finalizado ######### 
	- O diretório com o backup está em $HOME/backup
	"
}


case $1 in
	-b|--backup)
		backup;
esac 