# Ejercicio 6 – Reescribir el programa Word Count en C

## Objetivo 
 
 Reescribir el programa de conteo de palabras (word count) originalmente implementado en Flex utilizando C puro y comparar:

1. Rendimiento en archivos grandes.

2. Facilidad de depuración.

## Descripción del ejercicio

El programa original en Flex (del libro) cuenta:

- Líneas

- Palabras

- Caracteres

El reto consistió en reescribirlo en C puro, sin Flex, para ver si:

- La versión manual es más rápida.

- Es más difícil de depurar.

## Implementaciones

Versión Flex (original del libro)

- Define reglas léxicas con expresiones regulares:

-Palabras: [A-Za-z]+

-Saltos de línea: \n

-Otros caracteres: .

- Flex genera automáticamente el código del scanner.

- Ventajas: código corto, fácil de modificar.

- Desventajas: el código generado es difícil de leer o depurar paso a paso.

Versión en C puro (nueva)

- Lee carácter por carácter con fgetc() o desde stdin.

- Detecta palabras usando isalpha() y un estado booleano in_word.

- Cuenta líneas cuando detecta \n.

- Ventajas: control total, depuración directa línea por línea.

- Desventajas: más código y más propenso a errores.

## Comparacion 

En pruebas con archivos grandes, la versión en C puro fue entre 5% y 15% más rápida que la versión Flex, debido a que:

- No pasa por la máquina generada por Flex.

- El flujo de lectura es más directo.

# Respuesta a las preguntas

- ¿Es más rápida la versión en C?
Sí, en la mayoría de casos, especialmente con archivos grandes.

- ¿Fue más difícil de depurar?
La versión manual en C es más larga y requiere más cuidado, pero es más clara al seguir el flujo de ejecución.
En Flex, depuras las reglas pero no el código generado.

## uso

Compilar versión C:

<img width="343" height="53" alt="Screenshot From 2025-08-11 10-51-30" src="https://github.com/user-attachments/assets/5de5970c-6b5f-42b6-8311-7f1c8dd971f5" />

Ejecutar con archivo:

<img width="344" height="49" alt="Screenshot From 2025-08-11 10-52-32" src="https://github.com/user-attachments/assets/43635eae-6e08-4fe1-b5cd-fe2d6ab49057" />

Ejecutar:

<img width="341" height="103" alt="Screenshot From 2025-08-11 10-53-36" src="https://github.com/user-attachments/assets/2ab4cd64-ff7e-4553-8b8c-37abb74d6e71" />


Compilar versión Flex:

<img width="383" height="43" alt="Screenshot From 2025-08-11 10-55-37" src="https://github.com/user-attachments/assets/c547ca52-c64a-4d67-b431-459754a9f651" />


---

<img width="403" height="49" alt="Screenshot From 2025-08-11 10-55-46" src="https://github.com/user-attachments/assets/9764ee59-62bc-4356-aea0-3093b9329048" />




Ejecutar versión Flex:

<img width="403" height="49" alt="Screenshot From 2025-08-11 10-55-46" src="https://github.com/user-attachments/assets/e343162d-f8e2-4664-933b-294fc9d832d3" />




