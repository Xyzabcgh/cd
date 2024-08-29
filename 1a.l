%{
#include<stdio.h>
int l=0,s=0,w=0,c=0;
%}
%%
[ ] s++;
[\t] s+=4;
[\n] l++;
[^ \t\n#]+ {w++;c+=yyleng;}
# {return 0;}
%%
int yywrap()
{
return 1;
}
int main()
{
printf("Enter the string ");
yylex();
printf("\nNo of words=%d lines=%d characters=%d spaces=%d\n",w,l,c,s);
return 0;
}

 
