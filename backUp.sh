#!/bin/bash

nombreUsuario="david"

prefijoIp="192.168.1."
sufijoIpUsual="200"

rutaOrigen="$HOME/Documentos/unal/"
rutaDestinoNet="$HOME/Documentos/unal/"
rutaBackUp="/media/david/Backup/Documentos/unal"

backUp(){ #original, destino
    rsync -avP $1 $2
}
netBackUp(){
    argumento="$rutaOrigen $nombreUsuario@$prefijoIp$sufijoIpUsual:$rutaDestinoNet"
    rsync -avp $argumento
}

if [ $# == 0 ]; then
    backUp $rutaOrigen $rutaBackUp
elif [ $1 == "-n" ]; then
    netBackUp 
fi 
