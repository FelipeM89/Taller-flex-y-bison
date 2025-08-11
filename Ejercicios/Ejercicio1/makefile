all: calc

calc: calc.l calc.y
	bison -d calc.y
	flex calc.l
	gcc calc.tab.c lex.yy.c -o calc 

clean:
	rm -f calc lex.yy.c calc.tab.c calc.tab.h
