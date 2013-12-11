CXX=g++
YACC=bison
RE2C=re2c

CXXFLAGS=-g -Wall

OBJS=Parser.o Lexer.o Node.o Main.o

.cpp.o:
	$(CXX) -c $(CXXFLAGS) -o $@ $<

ssc: $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

Parser.cpp: Parser.ypp
	$(YACC) -d $< -o $@ --skeleton=lalr1.cc

Lexer.cpp: Lexer.lpp Parser.cpp
	$(RE2C) -F -o $@ $<


clean:
	rm -f ssc \
        Parser.cpp Parser.hpp stack.hh position.hh location.hh \
        Lexer.cpp \
        *.o 
