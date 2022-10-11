.LC0:
        .string "%d\n"
        .globl main
main:
        sub     $8, %rsp
        mov     $2, %rax
        mov     $1, %rsi
.L2:
        imul    %rax, %rsi
        add     $1, %rax
        test    %rsi, %rsi
        jg      .L2

        lea     .LC0(%rip), %rdi
        mov     %rax, %rsi
        dec     %rsi
        call    printf@PLT

        xor     %rax, %rax
        add     $8, %rsp
        ret
