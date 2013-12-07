#include <iostream>
#include <stdio.h>
#include "Token.h"

int main(int argc, char *argv[]) {
    
    SSC::Token token(T_LNUMBER, "23", "test", 0);
    printf(
        "type:%d\n"
        "entity:%s\n"
        "moduleName:%s\n"
        "line:%d\n",
        token.getType(), 
        token.getEntity().c_str(), 
        token.getModuleName().c_str(), 
        token.getLine());
    return 0;
}
