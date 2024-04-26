%{
#include<stdio.h>
int l=0;
%}
%option noyywrap
I [A-Za-z]
D [0-9]
bitReg64 [\%r*]
bitReg32 [\%e*]
opCode sub|mov|lea|add|ret|cmp|imul|sal|shr|and|or|not
suffix b|w|l|q
%%
\.file.*    {printf(" C Source file:%s\n",yytext);return 1;} 
\.string.*    {printf(" Format String:%s\n",yytext);return 1;} 
\.L({I}+{D}+) {printf("Label-%s\n",yytext);l++;return 1;}

{opCode}q     {printf("Quad Word Instruction : %s\n", yytext); return 1;}
{opCode}l     {printf("Long Word Instruction : %s\n", yytext); return 1;}

jmp|je|jne|js|jns|jg|jge|jl|jle     {printf("Jump Operation %s\n", yytext); return 1;}
pushq|popq     {printf("Stack Operation %s\n", yytext); return 1;}

\%r.*           {printf("64 Bit Register %s\n", yytext); return 1;}
\%e.*           {printf("32 Bit Register %s\n", yytext); return 1;}

int|if|else|return|float|char|while|do|void|static  {printf("Token keyword %s\n",yytext); return 1;}
{I}({I}|{D})*  {printf("Token id %s\n", yytext); return 1;}

{D}+           {printf("Token integers %s\n",yytext); return 1;}
{D}+\.{D}+     {printf("Token real %s\n",yytext); return 1;}

"//".*         {printf("Token single comment %s\n",yytext); return 1;}
"/"."*/"     {printf("Token multiple comment %s\n",yytext); return 1;}
\%             {printf("Token format specifier %s\n",yytext); return 1;}
\&             {printf("Token address specifier %s\n",yytext); return 1;}
\(|\[|\{       {printf("Token leftpar %s\n",yytext); return 1;}
\)|\]|\}       {printf("Token rightpar %s\n",yytext); return 1;}
\;|\.|\,|\:    {printf("Token delimeter %s\n",yytext); return 1;}
\=|\+=|\-+     {printf("Token assignop %s\n",yytext); return 1;}
\<|\<=|\>|\>\|\==|\!=   {printf("Token real %s\n",yytext); return 1;}
\"|\'             {printf("Token quotes %s\n",yytext); return 1;}

%%

int main(){
while(yylex());
printf("\n no. of lables-%d\n",l);
return 0;
}
