%{
#include <stdio.h>
%}
 
%%
[a-z]*          printf("Lowercase word\n");
[A-Z]*          printf("Uppercase word\n");
[a-zA-Z]*       printf("Word\n");
[0-9]*          printf("Integer\n");
[0-9]*[.][0-9]*   printf("Float\n");
";"             printf("Semicolon\n");
"("             printf("Open parentheses\n");
")"             printf("Close parentheses\n");
%%