#include <stdio.h>
#include <stdlib.h>

extern int yyparse(void);
extern FILE *yyin;

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        fprintf(stderr, "Usage: %s <json_file>\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");

    if (yyin == NULL)
    {
        perror("Error opening file");
        return 1;
    }

    if (yyparse() == 0)
    {
        printf("Valid JSON\n");
    }
    else
    {
        printf("Invalid JSON\n");
    }

    fclose(yyin);

    return 0;
}
