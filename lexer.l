



%{                                                                                          
	#include "lexer.tab.h" 



	extern int line_number;                                                                     
%}                 


%option noyywrap                                                                            
 


%% 
"if"						return IF;
"else"						return ELSE;
"int"						return INT;
"return"					return RETURN;
"void"						return VOID;
"while"						return WHILE;
"+"							return PLUS;
"-"							return MINUS;
"*"                         return MULTIPLY;
"/"                         return DIVIDE;
"<"                         return LESS_THAN;
"<="                        return LESS_OR_EQUAL;                     
">"                         return GREATER_THAN;
">="                        return GREATER_OR_EQUAL;
"=="                        return EQUALS;
"!="                        return NOT_EQUALS;
"="                         return ASSIGN;
";"                         return EOL;
","                         return COMMA;
"{"                         return OPN_CURL_BRACKT;
"}"                         return CLS_CURL_BRACKT;
"("                         return OPN_BRACKT;
")"                         return CLS_BRACKT;
"["                         return OPN_SQR_BRACKT;
"]"                         return CLS_SQR_BRACKT;
[a-zA-Z][a-zA-Z]*           return ID;
[0-9][0-9]*                 return NUM;

[\n] 						{ line_number++;}
[ \t\r]+ 					;

.                           { printf("Syntax Error! %s\n", yytext);}






"float"         { printf("FROM FLEX FLOAT %s\n", yytext); return FLOAT;  }                  
"int"           { printf("FROM FLEX INT %s\n", yytext); return INT; }                       
                                                                
[_a-zA-Z][_a-zA-Z0-9]* { printf("FROM FLEX IDENTIFIER: %s\n", yytext); return IDENTIFIER; } 
                                                
                                                                   
%%