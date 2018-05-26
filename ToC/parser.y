%{
    #include <stdarg.h>
    #include <stdio.h>
    #include "shared_values.h"
    #define YYSTYPE char *

    extern int yylineno;
    int yylex();
    void yyerror(const char *s);
    int yydebug = 1;
    int indent = 0;
    char *iden_dum;
%}


// Tokens Declaration

%token IF
%token ELSE
%token INT
%token RETURN
%token VOID
%token WHILE
%token PLUS
%token MINUS
%token MULTIPLY
%token DIVIDE
%token LESS_THAN
%token LESS_OR_EQUAL
%token GREATER_THAN
%token GREATER_OR_EQUAL
%token EQUALS
%token ASSIGN
%token NOT_EQUALS
%token EOL
%token COMMA
%token OPN_CURL_BRACKT
%token CLS_CURL_BRACKT
%token OPN_BRACKT
%token CLS_BRACKT
%token OPN_SQR_BRACKT
%token CLS_SQR_BRACKT
%token ID
%token NUM

// Grammar Rules for CFG
%%
program: declaration-list;
declaration-list: declaration-list declaration | declaration;
declaration: var-declaration | fun-declaration;
var-declaration: type-specifier ID EOL | type-specifier ID OPN_SQR_BRACKT NUM CLS_SQR_BRACKT EOL;
type-specifier: INT | VOID;
fun-declaration: type-specifier ID OPN_BRACKT params CLS_BRACKT compound-stmt;
params: param-list | VOID;
param-list: param-list COMMA param | param;
param: type-specifier ID | type-specifier ID OPN_SQR_BRACKT CLS_SQR_BRACKT;
compound-stmt: OPN_CURL_BRACKT local-declarations statement-list CLS_CURL_BRACKT;
local-declarations: local-declarations var-declaration | %empty;
statement-list: statement-list statement | %empty;
statement: expression-stmt | compound-stmt | selection-stmt | iteration-stmt |
return-stmt;
expression-stmt: expression EOL | EOL;
selection-stmt: IF OPN_BRACKT expression CLS_BRACKT statement | IF OPN_BRACKT expression CLS_BRACKT statement ELSE
statement;
iteration-stmt: WHILE OPN_BRACKT expression CLS_BRACKT statement;
return-stmt: RETURN EOL | RETURN expression EOL;
expression: var ASSIGN expression | simple-expression;
var: ID | ID OPN_SQR_BRACKT expression CLS_SQR_BRACKT;
simple-expression: additive-expression relop additive-expression | additive-expression;
relop: LESS_THAN | LESS_OR_EQUAL | GREATER_THAN | GREATER_OR_EQUAL | EQUALS | NOT_EQUALS;
additive-expression: additive-expression addop term | term;
addop: PLUS | MINUS;
term: term mulop factor | factor;
mulop: MULTIPLY | DIVIDE;
factor: OPN_BRACKT expression CLS_BRACKT | var | call | NUM;
call: ID OPN_BRACKT args CLS_BRACKT;
args: arg-list | %empty;
arg-list: arg-list COMMA expression | expression;

%%                                                                              
int main (void) {     
  yyparse ();
}