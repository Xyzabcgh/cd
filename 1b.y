%{
#include<stdio.h>
#include<stdlib.h>
%}
%%
S:A B
;
A:'a'A'b'
|
;
B:'b'B'c'
|
;
%%
int main()
{
printf("Enter the string to check");
yyparse();
printf("Follows the grammar");
return 0;
}
int yyerror()
{
printf("Invalid input\n");
exit(0);
}
