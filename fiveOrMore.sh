#!/bin/bash
# Entregable 3 - FIVEORMORE.SH
# Fecha 10/02/2026

clear

# CONTROL DE ERRORES

if [ $# -ne 2 ]; then
	echo "ERROR: Número de parámetros distinto de 2."
	exit
fi

if [ -f $1 ]; then
	echo "ERROR: $1 ya existe."
	exit
fi

if [ ! -d $2 ]; then
	echo "ERROR: $2 no existe / no es un directorio."
	exit
fi

if [ $(ls $2 | wc -l) -eq 0 ]; then
	echo "ERROR: El directorio $2 esta vacío."
	exit
fi

# FUNCIONES

function identify {
	for archivos in $2/*.txt; do
		if [ $(cat $archivos | wc -l) -ge 5 ]; then
			echo
			echo "--- Archivos .txt [$2] ---"
			echo "$(echo $archivos | cut -f 2 -d "/")"
			echo "$(echo $archivos | cut -f 2 -d "/")" >> $1
			echo cat $archivos > "$archivos.q."
		else
			echo  "ERROR: $archivos no tiene contenido >= 15 líneas."
		fi
	done
}

# SCRIPT

echo "| Hecho por Aroa Llerena Canchales |"

identify $1 $2
