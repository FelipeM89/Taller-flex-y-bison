# SOLUCION

## ¿La calculadora aceptará una línea que contenga solo un comentario? ¿Por qué sí o por qué no? ¿Es más fácil corregirlo en el scanner o en el parser?      

La calculadora implementada solo con Flex no puede aceptar una línea que contenga únicamente un comentario, porque Flex actúa únicamente como analizador léxico: detecta patrones y devuelve tokens al parser (o, si no hay parser, directamente ejecuta acciones).
Cuando Flex encuentra un comentario, normalmente lo ignora y no devuelve ningún token. Esto provoca que, si la línea solo contiene un comentario, el analizador no reciba nada y no se procese la línea.

En cambio, cuando la calculadora trabaja junto con Bison (Flex + Bison), es posible modificar el parser para que acepte líneas vacías como entradas válidas.
Como los comentarios se eliminan en Flex, lo que queda es efectivamente una línea vacía; el parser puede reconocer esto como una entrada permitida y continuar funcionando sin error.

En concluscion solo es posible con ayuda del parser lo que hace que el parser sea el resposable de esta modificacion 

### RESUMEN DEL EJERCICIO

Objetivo:
Hacer una calculadora sencilla con Flex + Bison que acepte líneas que solo contengan un comentario sin que se produzca un error.
Lo que hace el programa
-Permite introducir operaciones con + y -.
-Calcula y muestra el resultado.
-Si el usuario escribe solo un comentario (// algo), no muestra error y pasa a la siguiente línea.
-Ignora espacios y saltos de línea vacíos.

Cómo lo logramos

1.En Flex (calc.l):

-Creamos una regla para detectar comentarios:
flex
"//".*   { /* ignorar */ }

Esto hace que cualquier comentario sea ignorado por el analizador léxico.
-Creamos una regla para saltos de línea (\n) que devuelve el token EOL al parser.

2.En Bison (calc.y):

-Añadimos una regla para aceptar líneas vacías:

line: EOL  { /* línea vacía o solo comentario */ }
Esto permite que, si Flex ignora un comentario y lo único que queda es el salto de línea, el parser lo acepte como válido.
Definimos las reglas para las operaciones (expr) con suma y resta.

3.En el Makefile:
Configuramos la compilación automática con:

-bison -d calc.y → genera el parser.
-flex calc.l → genera el scanner.
-gcc → compila todo en un ejecutable calc.

🔹 Resultado final

Ejemplo de ejecución:



<img width="545" height="163" alt="Screenshot From 2025-08-10 19-13-35" src="https://github.com/user-attachments/assets/3ee76bf9-577d-4ae0-a284-180900568496" />






