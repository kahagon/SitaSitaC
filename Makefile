CC=gcc
YACC=bison
RE2C=re2c

CFLAGS=-g -Wall

OBJS=parser.o lexer.o node.o main.o

.c.o:
	$(CC) -c $(CFLAGS) -o $@ $<

ssc: $(OBJS)
	gcc $(CFLAGS) -o $@ $^

parser.c: parser.y
	$(YACC) -d $< -o $@

lexer.c: lexer.l parser.c
	$(RE2C) -F -o $@ $<


clean:
	rm -f ssc parser.c parser.h lexer.c *.o
