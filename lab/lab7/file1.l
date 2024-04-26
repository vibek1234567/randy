%{
#include<stdio.h>
#include "y.tab.h"
extern int yylval;
%}


ws [ \t\n]+
digit [0-9]
num {digit}+

%%

{ws}      {;/* No action */}
{digit}+  {yylval = atoi(yytext); return NUM;}
"*"       {return '*' ;}
"+"       {return '+' ;;}

%%

int yywrap(void)
{return 1; }
  
