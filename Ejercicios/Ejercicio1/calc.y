%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%token NUMBER PLUS MINUS EOL
%left PLUS MINUS

%%

input:
      /* vacío */
    | input line
    ;

line:
      EOL                      { /* Línea vacía o solo comentario */ }
    | expr EOL                 { printf("= %d\n", $1); }
    ;

expr:
      NUMBER
    | expr PLUS expr            { $$ = $1 + $3; }
    | expr MINUS expr           { $$ = $1 - $3; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Calculadora (Ctrl+D para salir)\n");
    yyparse();
    return 0;
}
