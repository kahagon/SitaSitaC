#include <stdio.h>
#include "parser.h"
#include "node.h"

#ifndef COMPILE_H
#define COMPILE_H

#define YYCTYPE unsigned char
#define YYCURSOR yycursor
#define YYLIMIT yylimit
#define YYMARKER yymarker
#define YYFILL(n) 

void prepare_scanner(YYCTYPE* str, unsigned int len);
int yylex(node* e);
int yyparse();
void yyerror(char* message);

#endif /* COMPILE_H */
