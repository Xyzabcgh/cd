%{
#include<stdio.h>
#include<stdlib.h>
int ct=0;
%}
%token IF IDEN NUM
%%
S:I
;
I:IF A B {ct++;}
;
A:'('E')'
;
E:IDEN Z IDEN
|IDEN Z NUM
|IDEN U
|IDEN 
;
B:B B
|'{'B'}'
|I
|E';'
|
;
Z:'=''='|'<''='|'>''='|'<'|'>'
;
U:'+''+'|'-''-'
;
%%
int yyerror()
{
printf("invalid input");
exit(0);
}
int main()
{
printf("enter if loops");
yyparse();
printf("valid and count= %d ",ct);
return 0;
}
