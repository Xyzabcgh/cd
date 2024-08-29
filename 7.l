%{
#include "y.tab.h"
%}
%%
[ \n\t] ;
"int"|"float"|"double"|"char" {return TYPE;}
[a-zA-Z_][a-zA-Z0-9_]* return IDEN;
[0-9]+ return NUM;
. return yytext[0];
%%

