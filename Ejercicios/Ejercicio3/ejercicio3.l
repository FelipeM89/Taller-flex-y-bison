%{
#include "ejercicio3.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%

"0x"[0-9a-fA-F]+ {
    yylval = strtol(yytext, NULL, 16);
    return NUMBER;
}

[0-9]+ {
    yylval = atoi(yytext);
    return NUMBER;
}

"&&"   { return AND; }
"|"    { return PIPE; }   /* Usamos un solo token para los dos usos */
"+"    { return ADD; }
"-"    { return SUB; }
"*"    { return MUL; }
"/"    { return DIV; }
"("    { return OP; }
")"    { return CP; }
\n     { return EOL; }
[ \t]  { }
.      { printf("Carácter desconocido: %s\n", yytext); }

%%

int yywrap(void){return 1;}
