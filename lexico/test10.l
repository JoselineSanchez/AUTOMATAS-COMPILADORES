%option noyywrap
%{
    #include <stdio.h>
    FILE *yyin;
%}

RESERVADAS (int|float|double|char|void|bool|if|else|for|while|do|switch|case|break|continue|return|class|struct|public|private|protected|virtual|const|static|new|delete|try|catch|throw|using|namespace|include|iostream|std|main)
VARIABLE [a-zA-Z_][a-zA-Z0-9_]*
ENTERO          [0-9]+
FLOTANTE        [0-9]+"."[0-9]+
%%
{RESERVADAS}     { printf("PALABRA RESERVADA: %s\n", yytext); }
{VARIABLE} { printf("VARIABLE: %s\n", yytext); }
{FLOTANTE}      { printf("NUMERO(CONSTANTE) FLOTANTE: %s\n", yytext); }
{ENTERO}        { printf("NUMERO (CONSTANTE) ENTERA: %s\n", yytext); }
[ \t\n]+    ;
.           ;
%%

int main(){
    char name[] = "prueba.cpp";
    FILE *archivo = fopen(name, "r");


    yyin = archivo;
    yylex();

    fclose(archivo);
    return 0;
}
