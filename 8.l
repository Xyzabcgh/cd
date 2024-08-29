%{
#include<string.h>
#include "y.tab.h"
%}
%%
[a-zA-Z_][a-zA-Z0-9_]* {yylval.exp=strdup(yytext);return IDEN;}
[0-9]+ {yylval.exp=strdup(yytext);return NUM;}
[ \n\t] ;
. return yytext[0];
%%

