#include <string.h>
#include <cstdio>
#include "Lexer.hpp"
#include "Parser.hpp"

int main(int argc, char* argv[]) {
    if (argc < 2) {
        printf("input source string\n");
        return 1;
    }
    char* source = argv[1];

    SSC::Lexer lexer;
    SSC::Parser parser(&lexer);
    lexer.prepare((unsigned char*)source, strlen(source));

    int res = parser.parse();
    printf("res: %d\n", res);

    return 0;
}
