build: work

run: work
	./work < main.c

clean:
	rm -f *.o lex.yy.c y.tab.c y.tab.h y.output work

work: y.tab.c
	g++ -o work y.tab.c

lex.yy.c: token.l
	flex $<

y.tab.c: grammar.y lex.yy.c
	bison -vdty $<