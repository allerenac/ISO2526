#!/bin/bash
# Entregable 4 - USERS.SH
# Fecha: 12/02/2026

clear
ref=$1

# CONTROL DE ERRORES

if [ $# -gt 1 ]; then
	echo "ERROR: Número de parámetros mayor a 1."
	exit
fi

if [ $# -lt 1 ]; then
	ref=1000
fi

# CÓDIGO

lineas=$(cat /etc/passwd)

echo "Informe de usuarios el día $(date +%d-%m-%Y) a las $(date +%H:%M)"
echo

for i in $lineas; do
	nombre=$(echo "$i" | cut -f 1 -d ":")
	uid=$(echo "$i" | cut -f 3 -d ":")

	if [ $uid -ge $ref 2>/dev/null ] && [ $uid -ne 65534 ]; then
		echo "Usuario: $nombre"
		echo "UID: $uid"
		echo
	fi
done

echo "$(date +%d-%m-%Y) - $(date +%H:%M) - El usuario $USER ha solicitado un informe de usuarios" >> /tmp/logeventos
