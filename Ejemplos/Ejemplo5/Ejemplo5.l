/* Ejemplo5.l - scanner con Flex */
%{
#include "Ejemplo5.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }
"+"         { return ADD; }
"-"         { return SUB; }
"*"         { return MUL; }
"/"         { return DIV; }
"|"         { return ABS; }
\n          { return EOL; }
[ \t]       { /* ignora espacios */ }
.           { /* ignora otros caracteres */ }

%%

int main(int argc, char **argv)
{
  yylex();
  printf("%8d%8d%8d\n", lines, words, chars);
}
int yywrap(void){return 1;}

