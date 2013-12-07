CXX=g++
RE2C=re2c
CXXFLAGS=-g -Wall

OBJS=main.o Token.o

ssc: $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJS)

.cpp.o:
	$(CXX) $(CXXFLAGS) -c -o $@ $<

clean:
	rm -f *.o ssc
