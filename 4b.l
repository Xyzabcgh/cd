%{
#include "y.tab.h"
%}
%%
"if" return IF;
[a-zA-Z_][a-zA-Z0-9]* return IDEN;
[0-9]+ return NUM;
[ ] ;
[\n] return 0;
. return yytext[0];
%%

