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
    echo $1
    if [ -z $1 ]; then
        argumento="$rutaOrigen $nombreUsuario@$prefijoIp$sufijoIpUsual:$rutaDestinoNet"
    else
        argumento="$rutaOrigen $nombreUsuario@$prefijoIp$1:$rutaDestinoNet"
    fi
    rsync -avp $argumento
}
if [ $# == 0 ]; then
    backUp $rutaOrigen $rutaBackUp
elif [ $1 == "-n" ]; then
    if [ -z $2 ]; then
        netBackUp 
    else
        netBackUp $2
    fi
fi 
