%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMBER
%token ADD SUB MUL DIV ABS
%token OP CP
%token EOL

%left ADD SUB
%left MUL DIV
%right ABS

%start calclist

%%

calclist:
      /* vacío */
    | calclist exp EOL  { printf("= %d (0x%X)\n", $2, $2); }
    ;

exp:
      factor
    | exp ADD factor { $$ = $1 + $3; }
    | exp SUB factor { $$ = $1 - $3; }
    ;

factor:
      term
    | factor MUL term { $$ = $1 * $3; }
    | factor DIV term { $$ = $1 / $3; }
    ;

term:
      NUMBER
    | ABS term { $$ = $2 >= 0 ? $2 : -$2; }
    | OP exp CP { $$ = $2; }
    ;

%%

int main(void) {
    return yyparse();
}

int yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}
