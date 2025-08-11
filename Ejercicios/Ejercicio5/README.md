# Ejercicio 5 – Limitaciones de Flex para ciertos lenguajes

## Objetico 

Responder a la pregunta:

Can you think of languages for which flex wouldn’t be a good tool to write a scanner?
(¿Puedes pensar en lenguajes para los que Flex no sería una buena herramienta para escribir un analizador léxico?)

 ## Análisis

Flex es una herramienta excelente para generar analizadores léxicos (scanners) cuando los tokens de un lenguaje se pueden describir usando expresiones regulares y no dependen fuertemente del contexto.

Sin embargo, hay lenguajes donde:

- El reconocimiento de tokens depende de información contextual o estructura física del texto.

- La separación de tokens no se puede definir de manera simple con patrones regulares.

- Se necesitan cambios frecuentes en las reglas léxicas dependiendo del estado del análisis.

## Casos donde Flex no es ideal

1. Lenguajes sensibles a la sangría (indentation-sensitive)

- Ejemplos: Python, YAML.
- El significado de un bloque depende del nivel de sangría (número de espacios al inicio de cada línea).
- Flex no maneja fácilmente este conteo y comparación de indentaciones, por lo que es más práctico hacerlo con un scanner manual.

2. Lenguajes con tokens dependientes del contexto

Ejemplos:

- C++ (el símbolo >> puede significar dos cierres de plantilla o un operador shift dependiendo del contexto).

- SQL (ciertas palabras pueden ser reservadas o identificadores según la posición en la sentencia).

- Flex puede usar estados léxicos, pero el manejo de contexto profundo es más natural con un analizador manual o integrado con el parser.

3. Lenguajes con sublenguajes anidados

- Ejemplos: HTML que contiene CSS y JavaScript embebido.

- El lexer debe “cambiar de modo” según el tipo de contenido, lo que puede ser posible en Flex pero se vuelve complicado y difícil de mantener.

4. Lenguajes no regulares o minimalistas

- Ejemplos: Brainfuck, Whitespace.

- Aunque Flex puede procesarlos, la simplicidad de sus reglas hace que un scanner manual sea más rápido y directo.

#Respuesta

- Flex no es la mejor herramienta para:

- Lenguajes sensibles a sangría (Python, YAML).

- Lenguajes con tokens dependientes del contexto (C++, SQL).

- Lenguajes con varios sublenguajes anidados (HTML + JS + CSS).

- Lenguajes no regulares o extremadamente simples (Brainfuck, Whitespace).

En estos casos, un scanner manual o una herramienta con control léxico más flexible sería más apropiada.
