%option noyywrap
%{
    #include <stdio.h>
    #include "tokens.h"
%}

%%
(aplicar|clasificar|completar|construir|demostrar|dibujar|ejecutar|emplear|esbozar|examinar|experimentar|ilustrar|interpretar|mostrar|operar|planear|practicar|programar|trazar|usar|utilizar) { return TAXONOMIA_BLOOM; }
%%

int main(void)
{
    int token;
    while ((token = yylex())) {
        if (token == TAXONOMIA_BLOOM)
            printf("Es verbo de la taxonomia de Bloom en la categoria de aplicacion = %s\n", yytext);
    }
    return 0;
}
