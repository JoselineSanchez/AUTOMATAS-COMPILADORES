%option noyywrap
%{
	#include<stdio.h>
	FILE *yyin;
	int c = 0;

%}
PALABRAS_RESER continue|while|if|else|float|switch|case|default|for|do|break|return|goto|bool|char|short|int|long|double|void|wchar_t|class|struct|union|enum|typename|main|template|noexcept|explicit|private|protected|include|public|operator|new|delete|using|namespace|try|catch|try|throw|false|export|import|module|virtual|this|friend
COMENTARIO [//][a-zA-Z]*
CONSTANTES [0-9]+[.][0-9]*
VARIABLES [a-zA-Z]+ [0-9]*_
OPE_ARIT "+"|"-"|""|"%"|"+="|"=="|"="|"/="|"%="|"-="|"++"|"--"
OPE_LOGICOS [&|^|~|<<|>>]+
SIMBOLOS [;|,|:|#|<|>|?|.|$|"]|(["][a-zA-Z0-9]["])]+
%%
{PALABRAS_RESER} {printf("Es una palabra reservada:%s\n", yytext);}
{COMENTARIO} {printf("Es un comentario: %s\n"); c++;}
{CONSTANTES} {printf("Es una variable: %s\n", yytext);}
{OPE_ARIT} {printf("Es un operador aritmetico:%s\n", yytext);}
{OPE_LOGICOS} {printf("Es un operador logico: %s\n", yytext);}
{SIMBOLOS} {printf("Es un simbolo: %s\n", yytext);}
%%
int main() {
    yyin = fopen("prueba.cpp", "r");
    if (!yyin) {
        printf("No se pudo abrir el archivo\n");
        return 1;
    }
    yylex();
    fclose(yyin);
    printf("Total de comentarios encontrados: %d\n", c);
    return 0;
}