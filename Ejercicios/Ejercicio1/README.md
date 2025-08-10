#La calculadora implementada solo con Flex no puede aceptar una línea que contenga únicamente un comentario, porque Flex actúa únicamente como analizador léxico: detecta patrones y devuelve tokens al parser (o, si no hay parser, directamente ejecuta acciones).
Cuando Flex encuentra un comentario, normalmente lo ignora y no devuelve ningún token. Esto provoca que, si la línea solo contiene un comentario, el analizador no reciba nada y no se procese la línea.#

En cambio, cuando la calculadora trabaja junto con Bison (Flex + Bison), es posible modificar el parser para que acepte líneas vacías como entradas válidas.
Como los comentarios se eliminan en Flex, lo que queda es efectivamente una línea vacía; el parser puede reconocer esto como una entrada permitida y continuar funcionando sin error.

En concluscion solo es posible con ayuda del parser lo que hace que el parser sea el resposable de esta modificacion 
