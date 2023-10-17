#include "stdio.h"

extern void reverse(char*str);
extern void rec_reverse(char*str);

int main(){
    char str[]="abc45888";
    rec_reverse(str);
    printf("%s\n",str);
}