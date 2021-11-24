cd Phase1/
flex main.l
gcc lex.yy.c
./a.out ../valid_code.lang
rm -rf lex.yy.c a.out