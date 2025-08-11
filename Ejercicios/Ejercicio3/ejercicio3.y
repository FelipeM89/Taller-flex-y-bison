%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
int yyerror(char *s);
%}

%token NUMBER
%token ADD SUB MUL DIV
%token AND PIPE
%token OP CP
%token EOL

%left PIPE    /* OR binario */
%left AND
%left ADD SUB
%left MUL DIV
%right UABS   /* valor absoluto unario, precedencia alta */

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
    | exp MUL factor { $$ = $1 * $3; }
    | exp DIV factor { $$ = $1 / $3; }
    | exp AND factor { $$ = $1 & $3; }
    | exp PIPE factor { $$ = $1 | $3; }   /* OR binario */
    | PIPE exp PIPE   { $$ = $2 >= 0 ? $2 : -$2; } /* valor absoluto */
    ;

factor:
      NUMBER
    | OP exp CP { $$ = $2; }
    | ADD factor { $$ = $2; }   /* + unario */
    | SUB factor { $$ = -$2; }  /* - unario */
    ;


%%

int main(void) {
    return yyparse();
}

int yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}
