%option noyywrap
%{
	#include<stdio.h>
%}
TOKEN_VARIABLE [a-z]+([a-zA-Z]|[0-9]|_)*

%%
{TOKEN_VARIABLE} {printf("TOKEN_VARIABLE=%s\n", yytext);}
%%
int main()
{
	yylex();
	return 0;
}