all:
	bison -d parser.y
	flex lexer.l
	gcc parser.tab.c lex.yy.c main.c -lfl -o json_parser

clean:
	rm -f parser.tab.c
	rm -f parser.tab.h
	rm -f lex.yy.c
	rm -f json_parser
