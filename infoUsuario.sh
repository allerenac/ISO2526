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

for users in $*; do
	if grep $usuarios /etc/passwd >/dev/null; then
		case $opcion in
			"backup")

			;;

			"info")
				echo "--- Información de [$usuarios] ---"
				echo "Nombre de usuario: $(grep "$usuarios" /etc/passwd | cut -d ":" -f 1)"
				echo "Carpeta personal: $(grep "$usuarios" /etc/passwd | cut -d ":" -f 6)"
				echo "PID (Procesos en ejecución): $$"
				if who | grep "^$usuarios"; then
					echo "Usuario conectado: SÍ"
				else
					echo "Usuario conectado: NO"
				fi
			;;

			"size")
				echo "--- Tamaño de $usuarios ---"
				tamaño=$(grep $usuarios /etc/passwd | cut -d ":" -f 6 | du -sh)
			;;
		esac
	else
		echo "$usuarios no existe/n."
	fi
done
