%{
#include<stdio.h>
int k=0,i=0,o=0;
%}
%%
"int"|"float"|"double"|"return"|"exit"|"if"|"else"|"for"|"while" {printf(" Keyword ");k++;}
[a-zA-Z_][a-zA-Z0-9_]* {printf(" identifier ");i++;}
[\+\-\*\/\%\^\&\|] {printf(" operator ");o++;}
%%
int yywrap()
{
return 1;
}
int main()
{
yyin=fopen("inp.txt","r");
yylex();
printf("No of \n keywords= %d \n identifier= %d \n operator= %d",k,i,o);
return 0;
}
