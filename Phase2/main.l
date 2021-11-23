%{
#include "main.tab.h"
#include <stdio.h>
%}

%%
[=] { return ASSIGNMENT_OPERATOR; }
[ ] { return SPACE; }
"main" { return MAIN; }
"for" { return FOR; }
"if" { return IF; }
[\n] { return NEWLINE; }
"begin" { return BEGINTOKEN; }
"end" { return ENDTOKEN; }
"int" { return INT; }
[;] { return SEMICOLON; }
[a-zA-Z][a-zA-Z0-9_]* { return IDENTIFIER; }
[0-9]+ { return NUMBER; }
"(" { return LEFT_PARENTHESIS; }
")" { return RIGHT_PARENTHESIS; }
"<"|">"|"<="|">="|"!="|"==" { return RELOP; }
"++"|"--" { return UNARY_OPERATOR; }
[\t] { return TAB; }
[,] { return COMMA; }
. { return yytext[0]; }
%%