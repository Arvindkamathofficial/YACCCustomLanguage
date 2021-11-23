cd Phase2/
bison -d main.y
flex main.l
gcc lex.yy.c y.tab.c -ll
./a.out ../valid_code.rx
rm -rf lex.yy.c a.out y.tab.*