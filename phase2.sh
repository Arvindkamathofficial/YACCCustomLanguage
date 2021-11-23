cd Phase2/
yacc -d main.y
lex main.l
cc lex.yy.c y.tab.c -ll
./a.out ../valid_code.rx
rm -rf lex.yy.c a.out y.tab.*