# Entrega 2 - dirFile.py
# Autor: Aroa Llerena Canchales
# Fecha: 25/03/2026

import shutil as shu
import os

list_dir = []
list_file = []

archivo_rutas = open("rutas.txt", "r")
rutas = archivo_rutas.readlines()

for i in rutas:
    ruta = i.strip()
    if os.path.isfile(ruta):
       list_file.append(ruta)
    elif os.path.isdir(ruta):
        list_dir.append(ruta)

while True:
    print()
    print("---- Lista de opciones ----")
    print("a) Eliminar fichero.")
    print("b) Información fichero.")
    print("c) Copiar fichero a destino.")
    print("d) Mostrar lista seleccionada.")
    print("e) Salir.")
    print()

    valor = input()

    match valor:
        case "a":
            nombreFile1 = input("Nombre del archivo: ")
            if nombreFile1 in list_file:
                os.remove(nombreFile1)
                list_file.remove(nombreFile1)
                print("[archivo borrado]")
            elif nombreFile1 in list_dir:
                print("ERROR: El archivo es un directorio.")
            else:
                print("ERROR: El archivo no existe.")

        case "b":
            nombreFile2 = input("Nombre del archivo: ")
            if nombreFile2 in list_file:
                os.system("ls -l " + nombreFile2)
            elif nombreFile2 in list_dir:
                print("ERROR: El archivo es un directorio.")
            else:
                print("ERROR: El archivo no existe.")

        case "c":
            nombreFile3 = input("Nombre del archivo: ")
            nombreDir3 = input("Nombre del directorio: ")
            if os.path.isfile(nombreFile3) and os.path.isdir(nombreDir3):
                shu.copy(nombreFile3, nombreDir3)
                print("[Archivo movido con éxito (",nombreFile3,"-->",nombreDir3,")]")
            else:
                print("ERROR: Valores no válidos.")

        case "d":
            num = 0
            while num == 0:
                print()
                print("--> Listas disponibles <--")
                print("1) Lista de directorios.")
                print("2) Lista de archivos.")
                print("0) Volver al menú.")
                print()
                valor2 = input()
                match valor2:
                    case "1":
                        print(list_dir)
                    case "2":
                        print(list_file)
                    case "0":
                        num = 1

        case "e":
            exit()

        case _:
            print("ERROR: Opción no válida.")