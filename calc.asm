section .data
    msg db 'The result is: ', 0
    newline db 10                  ; ASCII for newline

section .bss
    res resb 1                     ; Reserve 1 byte for the result character

section .text
    global _start

_start:
    ; --- The Math ---
    mov eax, 1                     ; Move 1 into register EAX
    add eax, 1                     ; Add 1 to the value in EAX (EAX = 2)
    
    ; --- Convert to ASCII ---
    add eax, 48                    ; Convert raw 2 to ASCII '2' (48 is '0')
    mov [res], al                  ; Store the result in memory

    ; --- Print Message ---
    mov eax, 1                     ; 'write' system call
    mov edi, 1                     ; file descriptor (stdout)
    mov rsi, msg                   ; pointer to the message
    mov rdx, 15                    ; length of message
    syscall

    ; --- Print Result ---
    mov eax, 1                     ; 'write' system call
    mov edi, 1                     ; stdout
    mov rsi, res                   ; pointer to our calculated '2'
    mov rdx, 1                     ; length is 1 byte
    syscall

    ; --- Print Newline ---
    mov eax, 1
    mov edi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    ; --- Exit Program ---
    mov eax, 60                    ; 'exit' system call
    xor edi, edi                   ; return code 0
    syscall
