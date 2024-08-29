%{
#include<stdio.h>
#include<stdlib.h>
int sl=0,ml=0,nl=0;
%}
%%
"//"[^\n]* sl++;
"/*"[^*#]*"*/" {ml++;for(int i=0;i<yyleng;i++){if(yytext[i]=='\n')nl++;}}
# return 0;
%%
int yywrap()
{
return 1;
}
int main()
{
yyin=fopen("inp.txt","r");
yyout=fopen("out.txt","w");
yylex();
printf("Single line=%d\n multiline=%d\n multiple=%d\n",sl,ml,nl);
return 0;
}
