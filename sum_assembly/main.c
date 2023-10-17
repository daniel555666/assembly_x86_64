#include "stdio.h"

extern int Sum(int a,int b, int c,int d,int e,int f);

int main(){
    int e=5;
    int f=5;
    int d=5;
    int c=1;
    int a=2;
    int b=7;
    printf("sum:%i ",Sum(a,b,c,d,e,f));
}