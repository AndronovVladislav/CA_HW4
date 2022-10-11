.section .rodata
.LC0:
    .scan "%d"
.LC1:
    .print "%d\n"
.section .text
.globl main, @function

factorial:
    push %rbp
    mov %rsp, %rbp

    mov $1, %rax
    mov $1, %rcx
    .label:
    	inc %rcx
        mul %rcx
        cmp %rcx, %rdi
        jl .label

    mov %rbp, %rsp
    pop %rbp
    ret

main:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
    
    mov $1, %rax
    mov $1, %rcx

    lea .LC0(%rip), %rdi
    lea (%rsp), %rsi
    call scanf@PLT
    
    mov (%rsp), %rdi
    call factorial

    lea .LC1(%rip), %rdi
    mov %rax, %rsi
    call printf@PLT

    xor rax, rax
    ret
