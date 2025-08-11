ejercicio2: ejercicio2.l ejercicio2.y
	bison -d ejercicio2.y
	flex ejercicio2.l
	cc -o ejercicio2 ejercicio2.tab.c lex.yy.c -lfl

clean:
	rm -f ejercicio2 ejercicio2.tab.c ejercicio2.tab.h lex.yy.c
