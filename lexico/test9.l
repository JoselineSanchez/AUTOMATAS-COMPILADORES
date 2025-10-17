%option noyywrap
%{
    #include <stdio.h>
    #include "tokens.h"
%}

%%

(analizar|comparar|examinar|distinguir|identificar|relacionar|diferenciar|clasificar|inferir|categorizar|descomponer|contrastar|investigar|organizar|detectar) { return ANALIZAR_BLOOM; }

(amable|creativo|dedicado|inteligente|generoso|responsable) { return ADJETIVO; }

(y|o|pero|porque|auque) { return CONJUNCION; }

(a|ante|com|de|en|por|para|sobre) { return PREPOSICION; }

(yo|tú|él|ella|nosotros|ustedes|ellos) { return PRONOMBRE; }

%%

int main(void)
{
    int token;
   
    while ((token = yylex())) {
        if (token == ANALIZAR_BLOOM) {
		printf("Taxonomia Bloom: %s\n", yytext);
		break;
	}
	if (token == ADJETIVO) {
		printf("Adjetivo positivo: %s\n", yytext);
	}
	if (token == CONJUNCION) {
		printf("Conjuncion: %s\n", yytext);
	}
	if (token == PREPOSICION) {
		printf("Preposicion: %s\n", yytext);
	}
	if (token == PRONOMBRE) {
		printf("Pronombre: %s\n", yytext);
		break;
	}
	if (token == 0) {
	break;
	}
	}

    return 0;
}
