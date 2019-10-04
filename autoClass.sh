#!/bin/bash
semestreActual="s8"
newClassNote(){
    workDir="$HOME/Documentos/unal/$semestreActual/$1/notas"
    #conseguir la ultima clase
    ultimaClase=$( ls $workDir/ -C --sort=t | awk '{print $1}'| sed "s/clase//g" | sed "s/\.rmd//g" | sed "s/\.pdf//g" )
    nuevaClase=$(($ultimaClase+1))
    nvim "$workDir/clase$nuevaClase.rmd"
}
if [ $# == 0 ]; then
    echo "Faltan argumentos"
elif [ $# == 1 ]; then 
    newClassNote $1
fi
