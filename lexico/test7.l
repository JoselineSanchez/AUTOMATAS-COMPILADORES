%option noyywrap
%{
    #include <stdio.h>
    FILE *yyin;
%}

%%

[A-Z]  {  printf("%c", yytext[0] + 'a' - 'A'); }
.	{  printf("%s", yytext); }

%%

int main() {
    FILE *file_7;
    char texto[] = "archivo_test7a11.txt";
    file_7 = fopen(texto, "r");
     

	yyin = file_7;
	yylex();

	fclose(file_7);
	return 0;
}
