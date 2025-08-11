%{
int chars = 0;
int words = 0;
int lines = 0;
%}

%%
[A-Za-z]+   { words++; chars += yyleng; }
\n          { lines++; chars++; }
.           { chars++; }
%%

int main(void) {
    yylex();
    printf("%8d %8d %8d\n", lines, words, chars);
    return 0;
}
