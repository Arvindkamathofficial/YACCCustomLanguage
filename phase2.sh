cd Phase2/
bison -d --report=all -t --graph main.y
flex main.l
gcc lex.yy.c main.tab.c -ll
./a.out ../valid_code.lang
dot -T png main.dot -o main.png