all: ejemplo5

ejemplo5: Ejemplo5.y Ejemplo5.l
	bison -d Ejemplo5.y
	flex Ejemplo5.l
	gcc Ejemplo5.tab.c lex.yy.c -o ejemplo5 -lfl

clean:
	rm -f ejemplo5 Ejemplo5.tab.c Ejemplo5.tab.h lex.yy.c
