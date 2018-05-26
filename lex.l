%%


"if"                        return IF;
"else"                      return ELSE;
"int"                       return INT;
"return"                    return RETURN;
"void"                      return VOID;
"while"                     return WHILE;
"+"                         return PLUS;
"-"                         return MINUS;
"*"                         return MULTIPLY;
"/"                         return DIVIDE;
"<"                         return LESS_THAN;
"<="                        return LESS_OR_EQUAL;                     
">"                         return GREATER_THAN;
">="                        return GREATER_OR_EQUAL;
"=="                        return EQUALS;
"!="                        return NOT_EQUALS;
"="                         return ASSIGNMENT;
";"                         return EOL;
","                         return COMMA;
"{"                         return LEFT_PARANTHESIS;
"}"                         return RIGHT_PARANTHESIS;
"("                         return LEFT_BRACKET;
")"                         return RIGHT_BRACKET;
"["                         return LEFT_SQR_BRACKET;
"]"                         return RIGHT_SQR_BRACKET;
"/*"                        return OPEN_COMMENT;
"*/"                        return CLOSE_COMMENT;

[a-zA-Z][a-zA-Z]*           return ID;
[0-9][0-9]*                 return NUM;
[ \t\r]+                    ;
[\n]                        {line_number++;}
.                           yyerror("Syntax Error!");


%%