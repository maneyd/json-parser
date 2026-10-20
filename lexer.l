%option yylineno

%{
#include "parser.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

DIGIT      [0-9]
INT        -?{DIGIT}+
FRAC       (\.{DIGIT}+)
EXP        ([eE][+-]?{DIGIT}+)
NUMBERPAT  {INT}{FRAC}?{EXP}?

STRINGPAT  \"([^\\\"]|\\.)*\"

%%

"{"                     return '{';
"}"                     return '}';
"["                     return '[';
"]"                     return ']';
":"                     return ':';
","                     return ',';

"true"                  return TRUE;
"false"                 return FALSE;
"null"                  return NULLTOK;

{NUMBERPAT}             return NUMBER;

{STRINGPAT}             return STRING;

[ \t\r\n]+              ;

. {
    printf("Unexpected character: %s\n", yytext);
    return yytext[0];
}

%%
