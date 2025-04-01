section .data
    mensagem db 'Hello, World!', 0   ; The string to print
    len equ $ - mensagem             ; The length of the string

section .text
    global _start                    ; Entry point

_start:
    ; SYS_write (system call number 4)
    mov eax, 4        ; SYS_write
    mov ebx, 1        ; File descriptor 1 (stdout)
    mov ecx, mensagem ; Pointer to the message
    mov edx, len      ; Length of the message
    int 0x80          ; Trigger the system call

    ; SYS_exit (system call number 1)
    xor ebx, ebx      ; Clear ebx (exit code 0)
    mov eax, 1        ; SYS_exit
    int 0x80          ; Trigger the system call to exit
