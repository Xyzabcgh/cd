%{
#include<stdio.h>
#include<stdlib.h>

typedef char  *string;
struct {
string op1,op2,res;
char op;
}code[100];
int idx=-1;
string add(string,string,char);
void t();
%}
%union {
char *exp;
}
%token <exp> IDEN NUM 
%type <exp> EXP
%left '+' '-'
%left '*' '/'
%%
STMTS:STMTS STMT
|
;
STMT:EXP 
;
EXP:IDEN '=' EXP {add($1,$3,'=');}
|EXP '+' EXP {add($1,$3,'+');}
|EXP '-' EXP {add($1,$3,'-');}
|EXP '*' EXP {add($1,$3,'*');}
|EXP '/' EXP {add($1,$3,'*');}
|IDEN 
|NUM
;
%%
string add(string op1,string op2,char op)
{
if(op=='=')
{
code[idx].res=op1;
return op1;
}
idx++;
string res=malloc(3);
code[idx].op1=op1;
code[idx].op2=op2;
code[idx].res=res;
return res;
}
void t()
{
for(int i=0;i<=idx;i++)
{
string instr="";
if(code[idx].op=='+')instr="ADD";
else if(code[idx].op=='-')instr="SUB";
else if(code[idx].op=='*')instr="MULT";
printf("LOAD\t R1, %s\n", code[i].op1);
printf("LOAD\t R2, %s\n", code[i].op2);
printf("%s\t R3, R1, R2\n", instr);
printf("STORE\t %s, R3\n", code[i].res);
}
}
int yyerror()
{
printf("error");
exit(0);
}
int main()
{
printf("Enter");
yyparse();
t();
return 0;
}


