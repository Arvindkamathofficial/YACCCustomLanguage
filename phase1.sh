cd Phase1/
lex main.l
cc lex.yy.c
./a.out ../code.rx
rm -rf lex.yy.c a.out