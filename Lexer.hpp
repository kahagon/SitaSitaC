#include <string>
#include <cstdlib>
#include "Node.hpp"

#ifndef SSC_LEXER_HPP
#define SSC_LEXER_HPP

#define YYCTYPE unsigned char
#define YYCURSOR yycursor
#define YYLIMIT yylimit
#define YYMARKER yymarker
#define YYFILL(n) 


namespace SSC {

class Lexer {
    public:
        /* use default constructor */
        /* use default destructor */
        void prepare(unsigned char* source, unsigned int length);
        int scan(Node* node);
        unsigned char* tokenDuplicate(const unsigned char* start, const unsigned char* end);
    private:
        unsigned char* yycursor;
        unsigned char* yylimit;
        unsigned char* yymarker;
};

}; /* namespace SSC */

int SSClex(SSC::Node* node, SSC::Lexer* lexer);

#endif /* SSC_LEXER_HPP */
