while IFS=: read -r c1
do
        nombre=$c1
        echo -n "Añadiendo equipo $c1..."
        samba-tool computer create $c1
        echo "[El equipo $c1 se creó correctamente]"
done <  $1
