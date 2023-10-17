global sort

sort:
    ; rdi = num_32 ; 12349876
    mov r13,rdi
    mov rdi, [r13]

    xor r10, r10
    push r10 
    push r10 ; push 16 bytes for each number from 1 - 16

    mov r10, 0xf ;r10 is our mask
    xor rcx,rcx

    loop:
        cmp rcx,16    ;  rcx<16 ?
        jge end_loop 

        and r10, rdi
        mov r15b, byte [rsp+r10] ; add +1 in the value of the num32[i]
        inc r15b
        mov byte [rsp+r10], r15b
        xor r10, r10
        mov r10,0xf
        inc rcx ; +1 to counter i
        shr rdi, 4
        
        jmp loop

    end_loop:

        ; set the values in the order 
        xor rdi, rdi ; index j=0 for the 16 numbers
        xor rsi, rsi ; index i=0 for the rax 4 bits
        xor rax, rax ; return the rax
        mov cl,64   ; to shift

    start_loop:
        cmp rdi, 16 ; rdi = index of the current byte number to write
        jge end

    inside_loop:
        cmp byte[rsp+rdi], 0
        je skip

        dec byte[rsp+rdi]
        mov r11, rdi ; r11 is mask
        sub cl, 4   ; 4 for each 16base number
        shl r11, cl 
        or rax, r11  ; put the number
        jmp inside_loop

    skip:
        inc rdi
        jmp start_loop    


    end:
        mov [r13], rax
        add rsp, 16 ; move 16 adress forward 
        mov r12, [rsp]
        add rsp, 8
    b1:
        jmp r12    ; return to c file
