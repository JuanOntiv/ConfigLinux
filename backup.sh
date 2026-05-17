#!/bin/bash

home="/home/jp"
repo="$home/Scripts/System-Config"
destino="$repo/backup"

backup() {
    local origen="$1"
    local destino_local="$2"
    cambios=$(rsync -ai --dry-run "$origen" "$destino_local")

    if [[ -n "$cambios" ]]; then
        echo "Actualizando: $origen"
        rsync -av "$origen" "$destino_local"

	cd "$repo" || exit 1
	pwd

        git add .
        git commit -m "Changes on $origen"
        git push
    else
        echo "Sin cambios: $origen"
	pwd
    fi
}


while read -r ruta; do
    if [[ "$ruta" != /* ]]; then
        ruta="$home/$ruta"
    fi
    backup "$ruta" "$destino"
done < "$repo/paths.conf"

echo '\n-----------------------------------------\n'
