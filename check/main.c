#include "stdio.h"
#include "stdint.h"

extern int f(int n);

int main() {
    uint64_t num = 0x842014444444;
    printf("%llx\n", num);
    return 0;
}