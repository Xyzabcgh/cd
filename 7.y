%{
#include<stdio.h>
#include<stdlib.h>
%}
%token IDEN NUM TYPE RET
%%
S:I  {printf("Sucessfully working");exit(0);}
I:TYPE IDEN '('PARAMS')''{'B'}'
;
PARAMS:PARAMS','PARAMS
|TYPE IDEN
|
;
B:B B
|E';'
|RET E';'
|
;
E:IDEN '=' NUM
|E'+'E
|E'-'E
|E'*'E
|E'/'E
|NUM
|IDEN
|TYPE IDEN
;
%%
int main()
{
printf("Input please");
yyparse();
return 0;
}
int yyerror()
{
printf("Invalid function ");
exit(0);
}
