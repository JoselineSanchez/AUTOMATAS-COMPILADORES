%option noyywrap
%{
	#include<stdio.h>
%}
TOKEN_MAIL [a-z0-9]+@uaeh\.edu\.mx

%%
{TOKEN_MAIL} {printf("TOKEN_MAIL=%s\n", yytext);}
%%
int main()
{
	yylex();
	return 0;
}