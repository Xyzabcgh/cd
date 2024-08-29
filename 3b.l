%{
#include "y.tab.h"
%}
%%
"for" return FOR;
[a-zA-Z][a-zA-Z0-9]* return IDEN;
[0-9]+ return NUM;
[ ] ;
[\n] return 0;
. return yytext[0];
%%


