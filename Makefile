CC=gcc
CXX=g++
YACC=bison
RE2C=re2c

CFLAGS=-g -Wall
CXXFLAGS=-g -Wall

OBJS=parser.o lexer.o node.o main.o

.c.o:
	$(CC) -c $(CFLAGS) -o $@ $<

.cpp.o:
	$(CXX) -c $(CXXFLAGS) -o $@ $<

ssc: $(OBJS)
	gcc $(CFLAGS) -o $@ $^

parser.c: parser.y
	$(YACC) -d $< -o $@

Parser.cpp: Parser.ypp
	$(YACC) -d $,  -o $@ --skeleton=lalr1.cc

lexer.c: lexer.l parser.c
	$(RE2C) -F -o $@ $<


clean:
	rm -f ssc \
        parser.c parser.h \
        Parser.cpp Parser.hpp stack.hh position.hh location.hh \
        lexer.c *.o
