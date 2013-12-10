%{
#include "compile.h"
#include "node.h"

#define YYSTYPE node
%}

%pure_parser
 
%token END 0 "end of file"
%token T_LNUMBER   "integer number (T_LNUMBER)"
%token T_VARIABLE "variable (T_VARIABLE)"
%token T_CONSTANT_ENCAPSED_STRING "quoted-string (T_CONSTANT_ENCAPSED_STRING)"
%token T_WHITESPACE      "whitespace (T_WHITESPACE)"

/* Rule */
%%

expr:
        variable '=' expr { node_do_assign(&$$, &$1, &$3); /* do assign */ }
    |   scalar { $$ = $1; }
    |   variable { $$ = $1; }
;

variable:
        T_VARIABLE { $$ = $1; printf("variable:T_VARIABLE\n"); }
;

scalar:
        common_scalar { $$ = $1; }
;

common_scalar:
        T_LNUMBER { $$ = $1; }
    |   T_CONSTANT_ENCAPSED_STRING { $$ = $1; }
;

%%
