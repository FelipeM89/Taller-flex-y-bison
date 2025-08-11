# Ejercicio 4 – Comparación entre el scanner manual y el scanner de Flex

## Objetivo 

Responder a la pregunta:

Does the handwritten version of the scanner from Example 1-4 recognize exactly the same tokens as the flex version?
(¿La versión escrita a mano del analizador léxico del Ejemplo 1-4 reconoce exactamente los mismos tokens que la versión hecha con Flex?)

## Análisis

En el Ejemplo 1-4, el scanner manual y el scanner de Flex buscan reconocer tokens como:

-Números (decimales, posiblemente hexadecimales en versiones extendidas).

-Operadores (+, -, *, /, etc.).

-Paréntesis y otros símbolos.

-Saltos de línea para indicar fin de expresión.

-Espacios y tabulaciones (normalmente ignorados).

#### Diferencias clave
1. Método de reconocimiento

-Manual:

-Implementado en C puro, leyendo carácter por carácter.

-Depende del orden de las sentencias if/else y bucles.

-Mayor riesgo de omitir casos o de variar en el momento en que se detecta un token.

-Flex:

- Usa expresiones regulares para definir patrones.

- Siempre aplica la regla del maximal munch (toma el lexema más largo posible).

- Garantiza consistencia en el orden y prioridad de las reglas.

2. Espacios y caracteres especiales

- En Flex, si se define una regla para ignorar espacios ([ \t]+), todos serán tratados igual.

- En el scanner manual, hay que programar explícitamente cada caso; si se omite alguno, podría generar tokens diferentes.

3. Manejo de errores

- Flex puede definir una regla genérica para caracteres desconocidos.

- El manual requiere manejo explícito; si no se implementa, puede producir resultados distintos.

Flex puede definir una regla genérica para caracteres desconocidos.

El manual requiere manejo explícito; si no se implementa, puede producir resultados distintos.
