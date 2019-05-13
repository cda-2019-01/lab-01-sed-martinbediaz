#Cambiar orden y formato a la fecha
sed 's/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)\;/20\3-\2-\1;/g' data.csv > out.1

#agregar \ a las N solas, y agregar nulos faltantes
sed -e 's/;N/;\\N/;' -e 's/;;/;\\N;/' out.1 > out.2

#indicar decimales , -> . y cambiar ; a ,
sed -e 's/,/./g' -e 's/;/,/g' out.2 > out.3

#Ajustes decimal
sed 's/,\([0-9]\)/.\1/3g' out.3 > out.4

#ajustes de minusculas a mayusculas
sed 's/a/A/; s/c/C/' out.4 > out.5

#agregar valor nulo despues de ultima coma sola
sed 's/\,\r/\,\\N\r/g' out.5 > out.6

# Mostrar lineas que no contienen campos nulos
sed '/N/d' out.6 > out.7

cat out.7
rm out.*

