ejercicio3: ejercicio3.l ejercicio3.y
	bison -d ejercicio3.y
	flex ejercicio3.l
	cc -o ejercicio3 ejercicio3.tab.c lex.yy.c 

clean:
	rm -f ejercicio3 ejercicio3.tab.c ejercicio3.tab.h lex.yy.c
