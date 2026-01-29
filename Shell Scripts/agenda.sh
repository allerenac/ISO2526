#!/bin/bash
# Entregable 1 - Agenda.sh (Aroa Llerena Canchales) 29/01/2026

clear

while true; do
	echo "--- AGENDA ---"
	echo "a) Añadir una entrada."
	echo "b) Buscar un dni."
	echo "c) Ver la agenda completa."
	echo "d) Eliminar todas las entradas de la agenda."
	echo "e) Finalizar."
	echo
	read opcion

	case $opcion in
		"a")
			read -n 9 -p "Introduce dni: " dni
			dnicomp=$(cat agenda.txt | grep "$dni" | cut -d ":" -f 1)
			echo 

			if [ "$dnicomp" != "$dni" ]; then
				read -p "> Nombre de usuario: " usuario
				read -p "> Apellidos: " apellidos
				read -p "> Localidad: " localidad
				echo "$dni:$usuario:$apellidos:$localidad" >> agenda.txt
				echo "Usuario $usuario creado con éxito. =)"
				echo
			else
				echo "Usuario $(grep "$dni" agenda.txt | cut -d ":" -f 2) ya dado de alta."
				echo
			fi
		;;

		"b")
			read -n 9 -p "Introduce dni: " dni
			dnicomp=$(cat agenda.txt | grep "$dni" | cut -d ":" -f 1)
			echo

			if [ "$dnicomp" -eq "$dni" ]; then
				echo "--- INFORMACIÓN USUARIO ---"
				echo "Nombre de usuario: $(grep "$dni" agenda.txt | cut -d ":" -f 2)"
				echo "Apellidos: $(grep "$dni" agenda.txt | cut -d ":" -f 3)"
				echo "Localidad: $(grep "$dni" agenda.txt | cut -d ":" -f 4)"
				echo
			else
				echo "El usuario no existe."
				echo
			fi
		;;

		"c")
			echo "--- LISTA DE USUARIOS ---"
			cat agenda.txt
			echo
		;;

		"d")
			> agenda.txt
			echo "Agenda borrada con éxito."
			echo
		;;

		"e")
			echo "Saliendo del programa..."
			exit
		;;

		*)
			echo "ERROR: Comando no reconocido."
			echo
		;;
	esac
done
