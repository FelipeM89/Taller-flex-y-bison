# SOLUCION

Este ejercicio consiste en modificar la calculadora básica para que soporte tanto números decimales como números hexadecimales (0x...).
La calculadora realiza operaciones aritméticas básicas y muestra el resultado tanto en decimal como en hexadecimal.

## Cómo lo hicimos

1. Modificación del scanner (ejercicio2.l)
   
Se añadió un patrón para reconocer números hexadecimales:

"0x"[0-9a-fA-F]+

-Se usa strtol(yytext, NULL, 16) para convertir el texto en número entero en base 16.

-Se mantiene el patrón original para números decimales usando atoi.

-Se definieron tokens para operadores + - * / | ( ) y saltos de línea.


2. Modificación del parser (ejercicio2.y)

-Se añadieron las reglas gramaticales para operaciones con la misma lógica que la calculadora original.


-En la regla que imprime el resultado se formatea la salida:

printf("= %d (0x%X)\n", $2, $2);

Mostrando el resultado en decimal y hexadecimal.

3. Compilación y enlace

-Se creó un Makefile que ejecuta:

bison -d ejercicio2.y → genera ejercicio2.tab.c y ejercicio2.tab.h.

flex ejercicio2.l → genera lex.yy.c.

Compila todo con gcc y enlaza con la librería -lfl.

### Cómo compilar
En una terminal, dentro de la carpeta del proyecto,Esto generará el ejecutable ejercicio2.


<img width="401" height="101" alt="Screenshot From 2025-08-11 00-40-26" src="https://github.com/user-attachments/assets/c9158f45-6fed-42e4-8df9-7d694afb667f" />


Ejecuciòn del programa y ejemplo de salida

<img width="404" height="170" alt="Screenshot From 2025-08-11 00-42-36" src="https://github.com/user-attachments/assets/d9c24bfc-a43c-4c1b-9798-c8c6186ce1b5" />

Notas
El prefijo 0x (o 0X) es obligatorio para números hexadecimales.

El operador | actúa como valor absoluto unario.

El parser respeta la precedencia de operadores:

* y / antes que + y -.

Paréntesis para forzar el orden.

