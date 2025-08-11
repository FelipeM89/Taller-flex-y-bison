%{
#include "ejercicio2.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%

"0x"[0-9a-fA-F]+ {
    yylval = strtol(yytext, NULL, 16); /* convierte hex a decimal */
    return NUMBER;
}

[0-9]+ {
    yylval = atoi(yytext); /* decimal normal */
    return NUMBER;
}

"+"    { return ADD; }
"-"    { return SUB; }
"*"    { return MUL; }
"/"    { return DIV; }
"|"    { return ABS; }
"("    { return OP; }
")"    { return CP; }
\n     { return EOL; }
[ \t]  { /* ignorar espacios */ }
.      { printf("Carácter desconocido: %s\n", yytext); }

%%
