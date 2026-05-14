#!/bin/bash

backup() {
    local origen="$1"
    local destino="$2"
    cambios=$(rsync -ai --dry-run "$origen" "$destino")

    if [[ -n "$cambios" ]]; then
        echo "Acutalizando: $origen"
        rsync -av "$origen" "$destino"
        git add .
        git commit -m "Changes on $origen"
        git push
    else
        echo "Sin cambios: $origen"
    fi
}


destino="$HOME/Scripts/System-Config/backup"

while read -r ruta; do
    if [[ "$ruta" != /* ]]; then
        ruta="$HOME/$ruta"
    fi
    backup "$ruta" "$destino"
done < paths.conf
