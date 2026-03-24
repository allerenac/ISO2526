# Entrega 1 - infoUsers.py
# Autor: Aroa Llerena Canchales
# Fecha: 24/03/2026

import os
import cpuinfo

num = 0

while True:
    print()
    print("---- Menú de opciones ----")
    print("1) Información SO y CPU.")
    print("2) Información usuario.")
    print("3) Comprobar directorio.")
    print("4) Salir")
    print()
    valor = int(input())

    match valor:
        case 1:
            print("SO:",os.uname().sysname)
            print("Info CPU:",cpuinfo.get_cpu_info()["brand_raw"])
        case 2:
            usuario = input("Introduce usuario: ")
            archivo = open("/etc/passwd", "r")
            lineas = archivo.readlines()
            for i in lineas:
                if usuario in i:
                    print("El usuario",usuario,"existe.")
                    print(i)
                    num = 1

            if num != 1:
                print("El usuario",usuario,"no existe. Creando usuario...")
                os.system("useradd -m " + usuario)
                # Ejecutar programa como root.
                print("[usuario creado]")
        case 3:
            dir = input("Introduce directorio: ")
            if os.path.isdir(dir):
                print("El directorio",dir,"existe.")
            else:
                print("El directorio",dir,"no existe. Creando directorio...")
                os.mkdir(dir)
                print("[directorio creado]")
        case 4:
            exit()
