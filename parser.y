%{
#include <stdio.h>
#include <stdlib.h>

extern int yylineno;
extern char *yytext;

int yylex(void);
void yyerror(const char *s);
%}

%token STRING
%token NUMBER
%token TRUE
%token FALSE
%token NULLTOK

%%

json
    : value
    ;

value
    : object
    | array
    | STRING
    | NUMBER
    | TRUE
    | FALSE
    | NULLTOK
    ;

object
    : '{' '}'
    | '{' pairs '}'
    ;

pairs
    : pair
    | pairs ',' pair
    ;

pair
    : STRING ':' value
    ;

array
    : '[' ']'
    | '[' elements ']'
    ;

elements
    : value
    | elements ',' value
    ;

%%

void yyerror(const char *s)
{
    fprintf(stderr, "Error at line %d near '%s': %s\n",yylineno,yytext,s);
}
