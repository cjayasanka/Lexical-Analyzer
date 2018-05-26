/*
Implement a parser for a sample language using YACC (FOR loop/SWITCH/IF statements)
EXECUTION:
yacc -d sample.y   (# create y.tab.h, y.tab.c)
lex sample.l (# create lex.yy.c)
gcc -o sample y.tab.c
./sample

*/

%{
#include<stdio.h>
#include<stdlib.h>
// To avoid warning, we include below definitions:
int yylex();
void yyerror(const char *s);
%}

%token FOR NUM OPBR CLBR INC DEC ID SEMIC GE NE LT GT LE EQ EQU 
// Operator precedence and associativity:
%right '=' 
%left GE NE LT GT LE EQ  
%left '+' '-'  
%left '*' '/'  
%right '^'   

%%
// RULES SECTION: 

S : ST { printf("\nACCEPTED\n"); exit(0); }

ST : FOR OPBR Expr1 SEMIC Expr2 SEMIC Expr3 CLBR 
| FOR OPBR SEMIC SEMIC CLBR	// for( ; ; )

Expr1 : ID EQU ID
| ID EQU NUM

Expr2 : ID RELOP ID
| ID RELOP NUM

Expr3 : ID INC
| ID DEC

RELOP : LT  
| GT  
| EQ  
| LE  
| GE  
| NE 
;

%%

#include"lex.yy.c"  
int main() {   
	yyparse();  
	return yylex();  
}  

void yyerror(const char *s){ printf("\nERROR\n"); }
int yywrap(){ return 1; }
