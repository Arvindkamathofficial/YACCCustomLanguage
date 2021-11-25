%{
#include <stdio.h>
#include <stdlib.h>
#include<string.h>
int yylex();
int yyerror();
extern FILE* yyin;
char symbol[100][100];
%}

%token SPACE MAIN LEFT LEFT_PARENTHESIS RIGHT_PARENTHESIS NEWLINE BEGINTOKEN ENDTOKEN INT TAB IDENTIFIER COMMA SEMICOLON IF RELOP FOR NUMBER UNARY_OPERATOR ASSIGNMENT_OPERATOR

%%
function: type SPACE MAIN LEFT_PARENTHESIS RIGHT_PARENTHESIS NEWLINE BEGINTOKEN body ENDTOKEN NEWLINE { printf("Valid grammar\n"); exit(0); };

body: NEWLINE declaration_statement body|NEWLINE if_statement body|NEWLINE for_statement body|NEWLINE;

declaration_statement: tabspace type SPACE identifier_list SEMICOLON;

identifier_list: IDENTIFIER|identifier_list COMMA SPACE IDENTIFIER;

if_statement: if_condition NEWLINE if_body;

if_condition: tabspace IF LEFT_PARENTHESIS IDENTIFIER SPACE RELOP SPACE IDENTIFIER RIGHT_PARENTHESIS;

if_body: tabspace IDENTIFIER SPACE ASSIGNMENT_OPERATOR SPACE IDENTIFIER SEMICOLON;

for_statement: for_condition NEWLINE tabspace BEGINTOKEN NEWLINE for_body NEWLINE tabspace ENDTOKEN;

for_condition: tabspace FOR LEFT_PARENTHESIS IDENTIFIER ASSIGNMENT_OPERATOR NUMBER SEMICOLON SPACE IDENTIFIER SPACE RELOP SPACE IDENTIFIER SEMICOLON SPACE UNARY_OPERATOR IDENTIFIER RIGHT_PARENTHESIS;

for_body: tabspace IDENTIFIER ASSIGNMENT_OPERATOR NUMBER SEMICOLON;

tabspace: TAB tabspace|SPACE tabspace|;

type: INT;
%%

int yyerror(char* msg) { printf("Invalid language\n"); exit(0); }

void main(int argc, char *argv[])
{
	yydebug=1;
	yyin=fopen(argv[1],"r");
	yyparse();
}