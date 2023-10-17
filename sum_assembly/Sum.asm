global Sum

section .text

Sum:
    add rdi, rsi
    add rdi, rdx
    add rdi, rcx
    add rdi, r8
    add rdi, r9

    mov rax, rdi
    ret

