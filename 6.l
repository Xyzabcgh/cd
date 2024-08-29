%{
#include "y.tab.h"
#include<string.h>

%}
%%
[a-zA-Z_][a-zA-Z0-9_]* {yylval.exp=strdup(yytext);return IDEN;}
[0-9]+ {yylval.exp=strdup(yytext);return NUM;}
[ \t]+ ;
[\n] {return '\n';}
. return yytext[0];
%%

