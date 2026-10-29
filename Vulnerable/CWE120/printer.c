
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    char name[16];
    if (argc < 2) return 1;
    //CWE 120/121 Stack-based buffer overflow
    strcpy(name, argv[1]);
    printf("Hello, %s!\n", name);

    return 0;

}
