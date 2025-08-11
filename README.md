# Taller-flex-y-bison

Este repositorio contiene el material y las soluciones de un taller de Flex y Bison.
En él encontrarás ejemplos básicos y ejercicios resueltos del libro, organizados en carpetas separadas.

### Consideraciones para macOS
En macOS, el comportamiento de Flex presenta dos diferencias importantes con respecto a Linux:

1.Falta de la librería -lfl

- En Linux normalmente se compila con:


cc -o programa lex.yy.c -lfl

- En macOS, la librería libfl no viene instalada por defecto, por lo que el enlace con -lfl falla.

- Solución: no usar -lfl y en su lugar proveer manualmente la función yywrap.
  
2. Necesidad de implementar yywrap()

- yywrap() es llamada por Flex al final de la entrada para determinar si debe continuar leyendo otro archivo.

- En Linux, esta función suele estar incluida en -lfl, pero en macOS no, lo que produce un error de enlace:

Undefined symbols for architecture x86_64:
  "_yywrap", referenced from:
  
- Solución: definir la función en el archivo .l:

int yywrap(void) {

  return 1;

}
Esto indica a Flex que no hay más datos que procesar y evita el error de compilación en Mac.


## Compilación y ejecución en macOS

Ejemplo para un archivo programa.l:

flex programa.l

cc -o programa lex.yy.c

./programa

- Ejemplo para un proyecto con Makefile:

make

./ejecutable


### Notas

Todos los ejercicios han sido adaptados para que funcionen en macOS agregando la función yywrap().

En Linux también funcionan sin problemas, ya sea usando -lfl o dejando la definición de yywrap().








  





Esto indica a Flex que no hay más datos que procesar y evita el error de compilación en Mac.
