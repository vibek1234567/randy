/*C declarations*/
%{
#include<stdio.h>
int yylex(void);
void yyerror(char *);
extern int yylineno, yychar ;
%}

/*YACC Declarations */

%token NUM

/*Grammar follows*/
%% 

E :      E '+' T       {$$ = $1 + $3; printf ("Rule 1 : E -> E + T\n"); printf ("value of E + T: %d\n", $$);}
         |   T         {printf ("Rule 2 :E -> T \n ");}
         ;
         

T : T '*' F             {$$ = $1 * $3 ;printf("Rule 3 : T -> T *F\n");  printf("value after T * F :%d\n",$$);}
    |  F                {printf("Rule 4 : T -> F \n"); }
    ;
    
    
F:   NUM               {printf("Rule 5 : F -> NUM\n");  printf("value after T * F :%d\n",$$);} 
      ;
      
%% 
void yyerror(char *s)
{printf(" %s Line Number : %d near symbol %c\n",s,yylineno,(char)yychar);}

int main(){
yyparse();
return 0;
}
