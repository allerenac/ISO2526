#!/bin/bash
# Fecha: 12/02/2026

clear

# CONTROL DE ERRORES

if [ -f $1 ]; then
	echo "ERROR: El fichero $1 existe."
	exit
fi

if [ $# -ne 2 ]; then
	echo "ERROR: Número de parámetros distinto de 2."
	exit
fi

if [ ! -d $2 ]; then
	echo "El directorio $2 no existe."
	exit
fi

subs=$(ls $2 | wc -l)
if [ $subs -eq 0 ]; then
	echo "ERROR: La carpeta $2 está vacía."
	exit
fi

# SCRIPT

echo "| Hecho por Aroa Llerena Canchales |"

for i in $2; do
	
done
