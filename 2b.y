%{
#include<stdio.h>
#include<stdlib.h>
%}
%token NUM
%left '+' '-'
%left '/' '*'
%%
S:I {printf("Result is %d",$$);}
;
I:I'+'I {$$=$1+$3;}
|I'-'I  {$$=$1-$3;}
|I'*'I  {$$=$1*$3;}
|I'/'I  {if($3==0){return yyerror();}else $$=$1/$3;}
|'('I')'{$$=$2;}
|NUM    {$$=$1;}
|'-'NUM   {$$=-$2;}
;
%%
int main()
{
printf("enter expression");
yyparse();
printf("valid");
return 0;
}
int yyerror()
{
printf("Invalid input \n");
exit(0);
}


