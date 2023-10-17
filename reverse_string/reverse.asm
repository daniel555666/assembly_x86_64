global reverse
global rec_reverse

section .data
    p db "hey",0

section .text

len:
    xor rcx, rcx ; set rcx to 0
    start_loop:                                  ;abcc 4
        cmp byte [rdi+rcx], 0
        je end_loop

        inc rcx
        jmp start_loop

    end_loop:
        ret

reverse:
    cmp rdi,0
    je end_reverse
    call len

    xor rdx, rdx ;;set zero
    ; rdi = str pointer, rcx = length of str
    mov rax, rcx
    mov r13, 2
    div r13 ;rax now = length/2
    xor rsi, rsi ; rsi = 0 , index

    loop_reverse:
        cmp rsi, rax
        jge end_reverse

        mov r10, rdi
        add r10, rcx
        dec r10
        sub r10, rsi ; r10= str[len(str)-1-i]
        ;swap
        mov r11,[rdi+rsi] ; r11= str[i] 
        mov r12, [r10] ; r12=temp register
        mov [rdi+rsi],r12b
        mov [r10], r11b
        
        inc rsi
        jmp loop_reverse

    end_reverse:
        ret


rec_reverse:
    xor rsi,rsi ; rsi=0
    rec:
        cmp  byte[rdi+rsi], 0
        jne skip
        xor rsi, rsi
        ; add rsp, 8
        ; jmp [rsp-8] ; check this
        ret ;; ret is equal to what above that in comment
                      
        skip:
        dec rsp
        mov r10, [rdi+rsi]
        mov [rsp], r10b ; save in the stack the char str[i]

        inc rsi
        call rec

        mov r10, [rsp]
        mov [rdi+rsi], r10b ; set the values of str chars

        inc rsi
        inc rsp ; rsp point to the rec adress
        
        ret


    
