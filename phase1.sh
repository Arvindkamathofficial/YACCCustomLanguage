cd Phase1/
flex main.l
gcc lex.yy.c
./a.out ../valid_code.rx
rm -rf lex.yy.c a.out