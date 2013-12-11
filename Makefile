CC=gcc
CXX=g++
YACC=bison
RE2C=re2c

CFLAGS=-g -Wall
CXXFLAGS=-g -Wall

#OBJS=parser.o lexer.o node.o main.o
OBJS=Parser.o Lexer.o Node.o Main.o

.cpp.o:
	$(CXX) -c $(CXXFLAGS) -o $@ $<

ssc: $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

parser.c: parser.y
	$(YACC) -d $< -o $@

Parser.cpp: Parser.ypp
	$(YACC) -d $< -o $@ --skeleton=lalr1.cc

lexer.c: lexer.l parser.c
	$(RE2C) -F -o $@ $<

Lexer.cpp: Lexer.lpp Parser.cpp
	$(RE2C) -F -o $@ $<


clean:
	rm -f ssc \
        parser.c parser.h \
        Parser.cpp Parser.hpp stack.hh position.hh location.hh \
        lexer.c \
        Lexer.cpp \
        *.o 
