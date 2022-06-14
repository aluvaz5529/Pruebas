#version definitiva
#para comprobar samba-tool group listmembers Servicios_U-GG
#!/bin/bash
while IFS=: read -r c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13
do
        # Extraemos los campos de los usuarios
        nombre=$c1
        apellido1=$c2
        apellido2=$c3
        cuenta=$c4
        DNI=$c5
        delegacion=$c6
        email=$c7
        contraseña=$c8
        enabled=$c9
        change=$c10
        global=$c11
        UO=$c12
        ordenador=$c13
        # Añadimos el usuario con samba-tool y lo añadimos a la Unidad Organizativa grupo que le corresponde
        echo -n "Añadiendo usuario $c4 ..."
        #Añade el usuario en la UO correspondiente
        samba-tool user create $c4 $c8 --must-change-at-next-login --userou=OU=$c12 --given-name=$c1 --surname="$c2 $c3" --home-directory=/home/$c4 --mail=$c4,@omen.upv.es --department=$c11 --login-shell=/bin/bash
        #Se hace miembro del grupo correspondiente al usuario
        samba-tool group addmembers $c11 $c4
        echo "[Usuario $c4 creado correctamente]"
done <  $1
