%option noyywrap
%{
	#include<stdio.h>
%}
TOKEN_CURP [A-Z]{1}[AEIOU]{1}[A-Z]{1}[A-Z]{1}[0-9]{6}[HMX]{1}

%%
{TOKEN_CURP} {printf("TOKEN_CURP=%s\n", yytext);}
%%
int main()
{
	yylex();
	return 0;
}