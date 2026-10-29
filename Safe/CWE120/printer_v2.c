
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    char name[16];
    if (argc < 2) return 1;
    //FIX: Use snprintf() instead of strcpy()
    snprintf(name, sizeof name, "%s", argv[1]);
    printf("Hello, %s!\n", name);

    return 0;

}
