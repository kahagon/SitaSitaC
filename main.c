#include <string.h>
#include "compile.h"

int main(int argc, char* argv[]) {
    if (argc < 2) {
        printf("input source string\n");
        return 1;
    }
    char* source = argv[1];
    prepare_scanner((unsigned char*)source, strlen(source));

    int res = yyparse();
    printf("res: %d\n", res);

    return 0;
}
