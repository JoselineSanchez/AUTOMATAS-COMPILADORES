%option noyywrap
%{
	#include<stdio.h>
%}
TOKEN_VARIABLE [0-9]+\.[0-9]+

%%
{TOKEN_VARIABLE} {printf("TOKEN_DECIMAL=%s\n", yytext);}
%%
int main()
{
	yylex();
	return 0;
}