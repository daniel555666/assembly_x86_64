#include "stdio.h"

extern enc(int k, char* pc);
extern dec(int k, char* pc);


int main(){
    int flag;
    int k;
    char c;
    printf("for enc type 1,\nfor dec type 2.\n");
    scanf("%d",&flag);
    printf("enter key\n");
    scanf("%d",&k);

    FILE *file=fopen("text.exe","r+");
    if (file == NULL) {
        printf("Error opening file.\n");
        return 1;
    }
    while((c=fgetc(file))!=EOF){
        if(flag==1){
            enc(k,&c);
        }
        else{
            dec(k,&c);
        }
        fseek(file, -1, SEEK_CUR);
        fputc(c, file);
    }

    
}