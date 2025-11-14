%{
#include <stdio.h>

int lineas = 0;
int caracteres = 0;
int palabras = 0;
int ini_con_ni = 0;
int ini_con_num = 0;
int term_con_to = 0;
int term_con_jo = 0;
int digitos = 0;

void imprimir_resultados() {
    printf("Total de lineas: %d\n", lineas);
    printf("Total de palabras: %d\n", palabras);
    printf("Total de caracteres (incluidos espacios): %d\n", caracteres);
    printf("Total de palabras que inician con \"ni\": %d\n", ini_con_ni);
    printf("Total de palabras que inician con \"num\": %d\n", ini_con_num);
    printf("Total de palabras que inician con \"b\" y terminan con \"to\": %d\n", term_con_to);
    printf("Total de palabras que terminan con \"jo\": %d\n", term_con_jo);
    printf("Total de palabras que son digitos: %d\n", digitos);
}
%}

%option noyywrap

%%
\n              { lineas++; caracteres += yyleng; }
[ \t]+          { caracteres += yyleng; }
[0-9]+          { palabras; caracteres += yyleng; digitos++; }
ni[a-zA-Z]*     { palabras; caracteres += yyleng; ini_con_ni++; }
num[a-zA-Z]*    { palabras; caracteres += yyleng; ini_con_num++; }
b[a-zA-Z]*to    { palabras; caracteres += yyleng; term_con_to++; }
[a-zA-Z]*jo     { palabras; caracteres += yyleng; term_con_jo++; }
[a-zA-Z]+       { palabras; caracteres += yyleng; }
.               { caracteres += yyleng; }
%%

int main() {
    FILE *file;
    char name[] = "elbrutodelasmates.txt";
    file = fopen(name, "r");
    if (!file) {
        printf("Ocurrio un error al abrir el archivo.\n");
        return 1;
    }
    yyin = file;
    yylex();
    imprimir_resultados();
    fclose(file);
    return 0;
}
