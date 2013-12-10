#include <stdlib.h>
#include <string.h>
#include "compile.h"



YYCTYPE* yycursor;
YYCTYPE* yylimit;
YYCTYPE* yymarker;

YYCTYPE* token_duplicate(const YYCTYPE* start_point, const YYCTYPE* end_point) {
    size_t buffer_size = end_point - start_point + 1;
    YYCTYPE* buffer = (YYCTYPE*)malloc(buffer_size);
    memmove(buffer, start_point, buffer_size-1);
    buffer[buffer_size] = '\0';
    return buffer;
}

void prepare_scanner(YYCTYPE* str, unsigned int len) {
    yycursor = str;
    yylimit = str+len;
}

void yyerror(char* message) {
    printf("bison error occurred.\n%s\n", message);
}


int scan(node* e) {

    YYCTYPE* start_point = yycursor;
/*!re2c
    re2c:indent:top = 2;
    re2c:indent:string = "    ";
    
    DIGIT = [0-9];
    LNUM = [0-9]+;
    INT = "0" | ( [1-9] DIGIT* );
    LABEL = [a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*;
    WHITESPACE = [ \n\r\t]+;
    TOKENS = [;:,.\[\]()|^&+-/*=%!~$<>?@];

    "$"{LABEL} {
        printf("VARIABLE\n");
        YYCTYPE* token_string = token_duplicate(start_point, yycursor);
        e->entity = token_string;
        printf("T_VARIABLE(%s)\n", e->entity);
        return T_VARIABLE;
    }

    {LNUM} {
        printf("INT\n");
        YYCTYPE* token_string = token_duplicate(start_point, yycursor);
        e->entity = token_string;
        printf("T_LNUMBER(%s)\n", e->entity);
        return T_LNUMBER;
    }

    {TOKENS} {
        return start_point[0];
    }

    {WHITESPACE} {
        printf("WHITESPACE\n");
        YYCTYPE* token_string = token_duplicate(start_point, yycursor);
        e->entity = token_string;
        printf("T_WHITESPACE(%s)\n", e->entity);
        return T_WHITESPACE;
    }

    "\000"      { printf("EOF\n");  return END; }
    [^]         { printf("ERR\n");  return 1; }

*/

}


int yylex(node* e) {
    int result;
    do {
         result = scan(e);
    }while (T_WHITESPACE==result);

    return result;
}




