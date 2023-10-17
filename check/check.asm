global f

f:
    inc rdi
    mov rax, rdi
    mov r10, [rsp]
    add rsp, 8
    jmp r10