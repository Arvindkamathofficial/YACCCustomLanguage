%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int yyerror();
extern FILE* yyin;
%}

%token SPACE MAIN LEFT LEFT_PARENTHESIS RIGHT_PARENTHESIS NEWLINE BEGINTOKEN ENDTOKEN INT TAB IDENTIFIER COMMA SEMICOLON IF RELOP FOR NUMBER UNARY_OPERATOR ASSIGNMENT_OPERATOR

%%
function: type SPACE MAIN LEFT_PARENTHESIS RIGHT_PARENTHESIS NEWLINE BEGINTOKEN NEWLINE body NEWLINE ENDTOKEN NEWLINE { printf("Valid\n"); exit(0); };

body: declaration_statement NEWLINE if_statement NEWLINE for_statement;

declaration_statement: tabspace type SPACE IDENTIFIER COMMA SPACE IDENTIFIER COMMA SPACE IDENTIFIER COMMA SPACE IDENTIFIER SEMICOLON;
if_statement: if_condition NEWLINE if_body;

if_condition: tabspace IF LEFT_PARENTHESIS IDENTIFIER SPACE RELOP SPACE IDENTIFIER RIGHT_PARENTHESIS;

if_body: tabspace IDENTIFIER SPACE ASSIGNMENT_OPERATOR SPACE IDENTIFIER SEMICOLON;

for_statement:  for_condition NEWLINE tabspace BEGINTOKEN NEWLINE for_body NEWLINE tabspace ENDTOKEN;

for_condition: tabspace FOR LEFT_PARENTHESIS IDENTIFIER ASSIGNMENT_OPERATOR NUMBER SEMICOLON SPACE IDENTIFIER SPACE RELOP SPACE IDENTIFIER SEMICOLON SPACE UNARY_OPERATOR IDENTIFIER RIGHT_PARENTHESIS;

for_body: tabspace IDENTIFIER ASSIGNMENT_OPERATOR NUMBER SEMICOLON;

tabspace: TAB tabspace|SPACE tabspace|;

type: INT;
%%

int yyerror(char* msg) { printf("Invalid declaration\n"); exit(0); }

void main(int argc, char *argv[])
{
	yyin=fopen(argv[1],"r");
	yyparse();
}