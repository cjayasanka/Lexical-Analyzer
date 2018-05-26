

/*
Implement a parser for a sample language using YACC (FOR loop/SWITCH/IF statements)
EXECUTION:
yacc -d sample.y   (# create y.tab.h, y.tab.c)
lex sample.l (# create lex.yy.c)
gcc -o sample y.tab.c
./sample
*/

%{  
	#include"sample.tab.h"
	extern int yylval;
%}

%%
 /* RULES SECTION */
"for" {return FOR;}

"=" {return EQU;}
"++" {return INC;}  
"--" {return DEC;}
 /* RELATIONAL OPERATIONS: */
"<=" {return LE;}  
">=" {return GE;}  
">" {return GT;}  
"<" {return LT;}  
"!=" {return NE;}    
"==" {return EQ;}  
 /* --------------------- */
"(" {return OPBR;}
")" {return CLBR;}
";" {return SEMIC;}
 /* Convert string to integer and store it */
[0-9]+ {yylval=atoi(yytext);return NUM;}
 /* yytext[0] holds the first character of the text matched by the current token */ 
[a-zA-Z]+ {yylval=yytext[0];return ID;} 
%%

/*
OUTPUT:
kpratik@pratik-lenovo:~$ lex sample.l
kpratik@pratik-lenovo:~$ yacc -d sample.y
kpratik@pratik-lenovo:~$ gcc -o sample y.tab.c
kpratik@pratik-lenovo:~$ ./sample
for(a=5;a<10;a++)

ACCEPTED

*/

