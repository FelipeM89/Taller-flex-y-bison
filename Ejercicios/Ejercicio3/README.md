# Ejercicio 3 – Calculadora con Operadores de Bits y Valor Absoluto

## Objetivo

El ejercicio pide añadir operadores de bits AND y OR a la calculadora, con el reto de que el operador | ya se usa como valor absoluto.

Se debe permitir que | funcione en dos modos:

|x| → valor absoluto (unario).

a | b → OR binario (binario).


- Además, la calculadora debe seguir aceptando números decimales y hexadecimales del ejercicio anterior.

## Cómo funciona

1.Scanner (ejercicio3.l)

-Reconoce números decimales y hexadecimales (0x...).

-Reconoce && para AND binario.

-Reconoce | como un único token (PIPE), que luego el parser decide si es ABS o OR.

2.Parser (ejercicio3.y)

Reglas para:

-Suma, resta, multiplicación, división.

-AND binario (a && b).

-OR binario (a | b).

-Valor absoluto (| expr |).

Se añadió soporte a operadores unarios + y - para permitir expresiones como | -10 |.

Precedencia configurada para que ABS unario tenga prioridad sobre operaciones binarias.


Siempre imprime el resultado en decimal y hexadecimal

### Cómo responde a la pregunta del ejercicio

El problema planteado era que | ya estaba en uso como valor absoluto, pero se quería añadirlo también como OR binario.

### Nuestra solución:

-Usa un solo token PIPE para |.

-El parser analiza el contexto:

 --Si | rodea una expresión → valor absoluto.

 --Si | está entre dos expresiones → OR binario.

-Así se cumple el requisito sin cambiar la sintaxis original y añadiendo la nueva funcionalidad.

✅ Soporta AND y OR binarios.
✅ Mantiene | como valor absoluto.
✅ Compatible con decimal y hexadecimal.

## Compilación y ejecución

<img width="411" height="146" alt="Screenshot From 2025-08-11 08-16-46" src="https://github.com/user-attachments/assets/6619a34a-eb79-479d-8ddc-2d9d53a1bcc9" />

## Ejemplo de uso

<img width="376" height="222" alt="image" src="https://github.com/user-attachments/assets/c837c0a8-d315-41ad-bb93-4afcd45117f1" />
