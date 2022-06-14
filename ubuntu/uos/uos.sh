#para comprobarlo samba-tool ou list
#no se porque no me deja separarlos por ; en la línea 4 donde el while puse al empezar ; y no funcionaba
#!/bin/bash
while IFS=: read -r c1 c2 c3
do
        nombre=$c1
        dc1=$c2
        dc2=$c3
        echo OU=$c1,DC=$c2,DC=$c3
        echo -n "Creando UO $c1..."
        samba-tool ou create OU=$c1,DC=$c2,DC=$c3
        echo "UO $c1 creada correctamente"
        echo "todo se a completado adecuadamente"

done < $1
