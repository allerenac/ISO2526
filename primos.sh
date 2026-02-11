#!/bin/bash
# Ejercicio Extra - Primos
# Fecha: 11/02/2026

clear

function primos {
	echo "--- Lista de primos [$1,$2] ---"
	for ((num=$1; num<=$2; num++)); do
		for ((div=1; div<=$2; div++)); do
			if [ $(($num%($div+1))) -eq 0 ]; then
				echo "$num"
			fi
		done
	done
}

primos $1 $2
