%option noyywrap
%{
    #include <stdio.h>
    FILE *yyin;
%}

COMENT1 "//".*
COMENT2 "/\\*([^*]|\\*+[^*/])*\\*+/"

%%
{COMENT1}   { printf("%s\n", yytext); }
{COMENT2}   { printf("%s\n", yytext); }
[ \t\n]+    ;
.           ;
%%

int main(){
    char texto[] = "prueba.cpp";
    FILE *archivo = fopen(texto, "r");

    yyin = archivo;
    yylex();

    fclose(archivo);
    return 0;
}
