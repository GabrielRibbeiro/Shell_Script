#!/usr/bin/env bash

function regras(){
    read -p "Deseja configurar: [INPUT,OUTPUT,FORWARD]" entrada
    read -p "Informe  o protocolo que deseja configurar: [tcp,udp,icmp]" protocolo
    read -p "Informe a porta do protocolo: [ex:22,80,53..]" porta
    read -p "Qual ação deseja realizar: [REJECT,DROP, ACCEPT]" acao
    echo -e '\t Realizando configuração...';sleep 2s; clear
    $(iptables -A "$entrada" -p "$protocolo" --dport "$porta" -j "$acao")
    echo "Firewall configuado"
}