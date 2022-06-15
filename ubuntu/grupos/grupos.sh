while IFS=: read -r c1 c2
do
        # Extraemos los campos de los usuarios
        nombre=$c1
        UO=$c2
        #Añadimos el usuario con samba-tool y lo añadimos a la Unidad Organizativa grupo que le corresponde
        echo -n "Añadiendo grupo $c1..."
        #Añade el usuario en la UO correspondiente
        samba-tool group add $c1 --groupou=ou=$c2 --group-type=Security --group-scope=Global
done <  $1
#para ver dentro de la uo que hay samba-tool ou listobjects ou=Rectorado
