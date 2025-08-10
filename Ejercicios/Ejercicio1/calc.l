%{
#include "calc.tab.h"  /* Tokens generados por Bison */
%}

%%

[0-9]+          { yylval = atoi(yytext); return NUMBER; }
"+"             { return PLUS; }
"-"             { return MINUS; }
"//".*          { /* Ignorar comentarios */ }
[ \t\r]+        { /* Ignorar espacios */ }
\n              { return EOL; }

.               { /* Ignorar cualquier otro caracter */ }

%%

int yywrap(void) { return 1; }
