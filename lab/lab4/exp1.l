%{
#include <stdio.h>

#include <string.h>
%}
%option noyywrap

L [A-Za-z]
D [0-9]

%%

{L}({L}|{D})* {
    printf("Token is IDENTIFIER: %s\n", yytext);
    return 1;
}

{D}+ {
    printf("Token is NUMBER: %s\n", yytext);
    return 2;
}

(if|else|int|return)\\b {
    printf("Token is KEYWORD: %s\n", yytext);
    return 3;
}

{D}+("."{D}+|"."{D}+{D}*[eE][-+]?[0-9]+|{D}*[eE][-+]?[0-9]+) {
    printf("Token is REAL: %s\n", yytext);
    return 4;
}

[<>]=?|[!=]==? {
    printf("Token is REL_OP: %s\n", yytext);
    return 5;
}

=([-+*%/&|^]?=|<<?=|>>?=) {
    printf("Token is ASSIGN_OP: %s\n", yytext);
    return 6;
}


[\(\[\{] {
    printf("Token is LEFT_PAREN: (\n");
    return 7;
}

[\)\]\}] {
    printf("Token is LEFT_PAREN: (\n");
    return 8;
}

[;,] {
    printf("Token is DELIMITER: %c\n", yytext[0]);
    return 9;
}


%%

int main() {
    while (yylex()) {}
    return 0;
}

