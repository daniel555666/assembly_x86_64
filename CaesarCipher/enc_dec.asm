global enc
global dec

section .text

enc:
   ; rdi = k
   ; rsi = cp
   mov r10, 256
   xor rdx, rdx ;remainder in rdx  ; c= 20 , k= 10 10%256=t, t+c%256
   xor r11, r11

   mov r11b, [rsi] ;r11 = c
   add rdi, r11 ; rdi=k+c
   mov rax, rdi ; rax=k+c

   div r10 ; rdx= k+c %256
   mov [rsi], dl
   ret

dec:
    mov rax, rdi ; rax = k
    mov r11, -1
    mul r11
    mov rdi, rax ; rdi = -k

    jmp enc