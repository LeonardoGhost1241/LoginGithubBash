#!/bin/bash


#Si hay algun erro de permisos(git@github.com: Permission denied (publickey).), el error que lo soluciono fue este:
#
#eval "$(ssh-add -s)"
#ssh-add ~/.ssh/nombre_de_tu_clave
#ssh git@github.com
#
#
#
#Otros comandos de ssh
#ssh-keygen	Genera un nuevo par de claves SSH (clave pública y privada).
#ssh-add	Agrega una clave privada al agente SSH para que esté disponible para la autenticación.
#ssh-agent	Inicia el agente SSH, que gestiona las claves privadas en memoria.
#ssh-add -l	Lista las claves actualmente cargadas en el agente SSH.
#ssh-add -d ~/.ssh/nombre_de_tu_clave	Elimina una clave específica del agente SSH.
#ssh-add -D	Elimina todas las claves del agente SSH.
#ssh -T git@github.com	Prueba la conexión SSH a GitHub y verifica que la autenticación funcione correctamente.
#ssh -vT git@github.com	Proporciona un registro detallado de la conexión SSH, útil para la depuración de problemas.
#ssh-copy-id user@host	Copia tu clave pública SSH a un servidor remoto para permitir la autenticación sin contraseña.



echo "Conexión a cuenta Git"
read -p "Ingrese su nombre: " name
echo
read -p "Ingrese su correo electrónico: " email

# Validación del correo electrónico
if ! [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
    echo "Correo electrónico no válido. Saliendo..."
    exit 1
fi

git config --global user.name "$name"
git config --global user.email "$email"
git config --global color.ui true

echo "Configuraciones: "
echo "-------------------------------"
git config --list
echo "-------------------------------"

read -p "Nombre de la clave SSH: " keySSH

# Generar la clave SSH
if ssh-keygen -t rsa -C "$email" -f ~/.ssh/"$keySSH" -N ""; then
    echo "Clave SSH generada con éxito."
else
    echo "Error al generar la clave SSH. Saliendo..."
    exit 1
fi

echo "-------------------------------"
echo "Agrega la siguiente clave en GitHub:"
cat ~/.ssh/"$keySSH.pub"
echo "-------------------------------"
echo "Para finalizar la conexión, ejecuta ssh -T git@github.com o ssh -T git@gitlab.com si es el caso."
