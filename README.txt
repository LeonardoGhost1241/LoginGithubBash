# LoginGithubBash
Script de bash que configura la terminal para acceder a github 

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
