%{
#include<stdio.h>
int a=0,hex=0,id=0,oct=0,inte=0,dedc=0,rep=0,mup=0,ari=0,bit=0,asss=0,left=0,right=0,delin=0;
%}

%option noyywrap

L [A-Za-z]
D [0-9]
DO [0-7]
HX [A-Fa-f0-9]

%%

int|if|else|return|float|char|const|static|while|do|void {
    printf("Keyword found %s\n",yytext);
    ++a;
    return 1;
}

(0X){HX}+ {
    printf("Hexadecimal found %s\n",yytext);
    ++hex;
    return 1;
}

{L}({L}|{D})* {
    printf("ID found %s\n",yytext);
    ++id;
    return 1;
}

0{DO}+ {
    printf("Octal found %s\n",yytext);
    ++oct;
    return 1;
}

{D}+ {
    printf("Integer found %s\n",yytext);
    ++inte;
    return 1;
}

{D}+\.{D}+ {
    printf("Decimal found %s\n",yytext);
    ++dedc;
    return 1;
}

"<"|"<="|">"|">="|"=="|"!=" {
    printf("Relop %s\n",yytext);
    ++rep;
    return 1;
}

"%"|"*"|"/" {
    printf("MULTIPLICATIVE operator %s\n",yytext);
    ++mup;
    return 1;
}

"+"|"-" {
    printf("arithmetic operator %s\n",yytext);
    ++ari;
    return 1;
}

"<<"|">>" {
    printf("bitwise operator %s\n",yytext);
    ++bit;
    return 1;
}

"="|"+="|"-=" {
    printf("Assiglop %s\n",yytext);
    ++asss;
    return 1;
}

"("|"["|"{" {
    printf("Leftpar found \n");
    ++left;
    return 1;
}

")"|"]"|"}" {
    printf("Rightpar found %s\n",yytext);
    ++right;
    return 1;
}

";"|"," {
    printf("Delimiter found %s\n",yytext);
    ++delin;
    return 1;
}

%%

int main()
{
    while(yylex());
    printf("keywords %d \n",a);
    printf("Hexadecimal %d\n",hex);
    printf("ID %d\n",id);
    printf("Octal %d\n",oct);
    printf("Integer %d\n",inte);
    printf("Decimal %d\n",dedc);
    printf("Relop %d\n",rep);
    printf("MULTIPLICATIVE %d\n",mup);
    printf("arithmetic %d\n",ari);
    printf("bitwise %d\n",bit);
    printf("Assiglop %d\n",asss);
    printf("Leftpar %d\n",left);
    printf("Rightpar %d\n",right);
    printf("Delimiter %d\n",delin);
}
