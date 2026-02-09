#!/bin/bash
# Fecha: 05/02/2026

# $1 --> Operación a realizar 

clear

# CONTROL DE ERRORES

if [ "$USER" != "root" ]; then
	echo "ERROR: No eres root."
	exit
fi

# OPERACIONES

opcion=$1
shift

for usuarios in $*; do
	if grep $usuarios /etc/passwd >/dev/null; then
		case $opcion in
			"backup")
				if [ ! -d backup ]; then
					mkdir backup
					echo "Carpeta backup no existe. Carpeta creada =D"
				else
					tar -czf "backup/$usuarios.tar.gz" "$(grep $usuarios /etc/passwd | cut -d ":" -f 6)"
					echo
					echo "--- Copia de seguridad [$usuarios] ---"
					echo "Realizada en backup/$usuarios.tar.gz"
					echo
				fi 
			;;
			"info")
				echo "--- Información de [$usuarios] ---"
				echo "Nombre de usuario: $(grep "$usuarios" /etc/passwd | cut -d ":" -f 1)"
				echo "Carpeta personal: $(grep "$usuarios" /etc/passwd | cut -d ":" -f 6)"
				echo "PID (Procesos en ejecución): $$"
				if who | grep "^$usuarios" >/dev/null; then
					echo "Usuario conectado: SÍ"
				else
					echo "Usuario conectado: NO"
				fi
				echo
			;;

			"size")
				echo "--- Tamaño de $usuarios ---"
				echo "$(grep $usuarios /etc/passwd | cut -d ":" -f 6 | du -sh | cut -f 1)"
			;;
		esac
	else
		echo "$usuarios no existe/n."
	fi
done
