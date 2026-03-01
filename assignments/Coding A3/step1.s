.section .data
msg1: .asciz "Hello, programmers!\n"
msg2: .asciz "Welcome to the world of,\n"
msg3: .asciz "Linux assembly programming!\n"

.section .text
.global _start

.macro PRINT msg
    mov $4, %eax        # sys_write
    mov $1, %ebx        # stdout
    mov \msg, %ecx      # message address
    mov $32, %edx       # message length (adjust if needed)
    int $0x80
.endm

_start:
    PRINT $msg1
    PRINT $msg2
    PRINT $msg3

    mov $1, %eax        # sys_exit
    xor %ebx, %ebx
    int $0x80