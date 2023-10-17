#include "stdio.h"

extern long int isPalindrome(int n);

int main(){
    int n=1233241;
    int check=isPalindrome(n);
    if(check)
        printf("%d is palindrome",n);
    else
        printf("%d is not palindrome",n);
}