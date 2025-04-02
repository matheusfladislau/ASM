section .data
    mensagem db 'O texto digitado: ', 0   ; Mensagem
    len equ $ - mensagem             ; Tamanho da mensagem

section .bss
    buffer resb 255             ; Buffer alocado para write

section .text
    global _start             

_start:
    ; STDIN
    mov eax, 3          ; READ syscall
    mov ebx, 0          ; file descriptor 0 (stdin)
    mov ecx, buffer     ; buffer
    mov edx, 255        ; tamanho size_t count
    int 0x80            ; chama a syscall

    ; Printar a mensagem
    mov eax, 4          ; WRITE syscall
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, mensagem   ; buffer inicial da mensagem
    mov edx, len        ; size_t -> tamanho da mensagem
    int 0x80            ; chama a syscall

    ; Printar o texto
    mov eax, 4          ; WRITE syscall
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, buffer     ; buffer inicial do texto
    mov edx, 255        ; tamanho máximo do texto
    int 0x80            ; chama a syscall

    ; Fechar
    mov eax, 1          ; EXIT syscall
    mov ebx, 0          ; error_code 0
    int 0x80            ; chama a syscall
