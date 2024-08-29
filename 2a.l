%{
#include<stdio.h>
int pn=0,nn=0,pf=0,nf=0;
%}
num [0-9]+
psnum \+?{num}
nnnum -{num}
pfnum \+?{num}\/\+?{num}|-{num}\/-{num}
nfnum -{num}\/\+?{num}|\+?{num}\/-{num}
%%
{psnum} pn++;
{nnnum} nn++;
{pfnum} pf++;
{nfnum} nf++;
[ \t]
[\n] return 0;
%%
int yywrap()
{
return 1;
}

int main()
{
printf("Positive and -ve numbers input");
yylex();
printf("+ve numbers= %d \n-ve numbers=%d \n+ve fractions= %d\n-ve fractions= %d\n",pn,nn,pf,nf);
return 0;
}

