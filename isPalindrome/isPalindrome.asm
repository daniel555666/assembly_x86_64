global isPalindrome

isPalindrome:
                 ; rdi = num
    mov r10, rdi ; r10 = num 
    xor r11, r11 ; r11 will hold the reverse(num)
    mov r12, 10

    while:
        cmp r10, 0 ; r10 == 0 ?
    b1:
        je end_loop
        
        ; r11= r11*10 + r10%10
        ;r11*10 :
        mov rax, r11;
        mul r12  ; 10*rax == 10*r11 
        mov r11, rax
        ;r10%10 :
        mov rax, r10
        div r12
        ; + :
        add r11, rdx
        mov r10, rax
        jmp while

    end_loop:
        cmp rdi, r11
        je skip
        xor rax, rax
        jmp end
        skip:
            mov rax,1
    end:
        mov r15, [rsp]
        add rsp, 8
        jmp r15