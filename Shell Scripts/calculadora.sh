#!/bin/bash
# Entregable 2 - Calculadora
# Nombre: Aroa Llerena Canchales
# Fecha: 04/02/2026

# $1 --> Fichero de salida.
# $2 --> Número máximo de veces que pide una operación.

clear
echo "| Código de Aroa Llerena Canchales |"

# CONTROL DE ERRORES

if [ ! $# -eq 2 ]; then
	echo "ERROR: Pon 2 parámetros:"
	exit
fi

if [ -f $1 ]; then
	echo "El fichero $1 ya existe."
	exit
fi

# MENÚ CALCULADORA

while true; do

	echo
	echo "CALCULADORA: (Repeticiones = 2) | 0 - Salir"
	echo "S - Suma | R - Resta | M - Multiplicación | D - División"
	echo
	read opcion

	for ((valor=1;valor<=$2;valor++)); do
		case $opcion in

			"S")
				echo
				echo "(Suma) FORMATO: <num1> <num2>"
				read num1 num2
				echo "$num1 + $num2 = $((num1+num2))"
				echo "$opcion $num1 $num2" >> "$1"
			;;

			"R")
				echo
				echo "(Resta) FORMATO: <num1> <num2>"
				read num1 num2
				echo "$num1 - $num2 = $((num1-num2))"
				echo "$opcion $num1 $num2" >> "$1"
			;;

			"M")
				echo
				echo "(Multiplicación) FORMATO: <num1> <num2>"
				read num1 num2
				echo "$num1 x $num2 = $((num1*num2))"
				echo "$opcion $num1 $num2" >> "$1"
			;;

			"D")
				echo
				echo "(División) FORMATO: <num1> <num2>"
				read num1 num2
				echo "$num1 / $num2 = $((num1/num2))"
				echo "$opcion $num1 $num2" >> "$1"
			;;

			0)
				echo "Saliendo..."
				exit
			;;

			*)
				echo "ERROR: Operación no reconocida."
				valor=2
			;;
		esac
	done
done
