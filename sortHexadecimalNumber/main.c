#include "stdio.h"
#include "stdint.h"

extern int sort(uint64_t * n);

int main(){

    uint64_t num=0x45321cdef0abc0;
    sort(&num);
    printf("%lx \n", num);

}