%{
#include<stdio.h>
#include<stdlib.h>
typedef char *string;
struct {
string op1,op2,res;
char op;
}code[100];
int idx=0;
string add(string,string,char);
void t();
void q();
%}
%union{
char *exp;
}
%token <exp> IDEN NUM 
%type <exp> EXP
%left '+' '-'
%left '*' '/'

%%
STATS:STATS STAT
|
;
STAT: EXP '\n'
|
;
EXP:IDEN '=' NUM {$$=add($1,$3,'=');}
|EXP '+' EXP {$$=add($1,$3,'+');}
|EXP '-' EXP {$$=add($1,$3,'-');}
|EXP '*' EXP {$$=add($1,$3,'*');}
|EXP '/' EXP {$$=add($1,$3,'/');}
|IDEN { $$ = $1; }
|NUM { $$ = $1; }
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

string res=malloc(5);
sprintf(res, "@%c", idx + 'A');
code[idx].op1=op1;
code[idx].op2=op2;
code[idx].op=op;
code[idx].res=res;
return res;
}
void t() {
	for(int i = 0; i < idx; i++) {
		printf("%s = %s %c %s\n", code[i].res, code[i].op1, code[i].op, code[i].op2);
	}
}


void q() {
	for(int i = 0; i < idx; i++) {
		printf("%d:\t%s\t%s\t%s\t%c\n", i, code[i].res, code[i].op1, code[i].op2, code[i].op);
	}
}
int yyerror()
{
printf("Invalid input");
exit(0);
}

int main()
{
yyparse();
printf("3 address");
t();
printf("4 address");
q();
return 0;
}


