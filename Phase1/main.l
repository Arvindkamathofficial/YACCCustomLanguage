%{
    #include <stdio.h>
%}

KEYWORDS [iI][nN][tT]|[vV][oO][iI][dD]|[fF][oO][rR]|[iI][fF]|[bB][eE][gG][iI][nN]|[eE][nN][dD]
SPECIAL_SYMBOLS [,;()\[\]{}]
IDENTIFIERS [a-zA-Z][a-zA-Z0-9_]*
OPERATORS [+-/\*!=]|[++]|[--]|[=!][=]|[<>][=]?|[&][&]?|[|][|]?
VALUES [+]?[0-9][0-9]*|[-][0-9][0-9]*|[+]?[0-9][0-9]*\.[0-9]*|[-][0-9][0-9]*\.[0-9]*|['"][a-zA-Z0-9]*['"]
WHITESPACES [ \n\t]

%%
{KEYWORDS} { printf("%s :Keyword\n", yytext); }
{SPECIAL_SYMBOLS} { printf("%s :Special Symbol\n", yytext); }
{IDENTIFIERS} { printf("%s :Identifier\n", yytext); }
{OPERATORS} { printf("%s :Operator\n", yytext); }
{VALUES} { printf("%s :Value\n", yytext); }
{WHITESPACES} {;}
%%

int yywrap() { return 1; }

void main(int argc, char* argv[]) {
    if (argc!=2) { printf("Invalid argument: Input file missing.\n"); exit(0); }
    yyin = fopen(argv[1], "r");
    yylex();
}