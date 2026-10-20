default rel

global ft_strlen
section .text

ft_strlen:
    mov eax, 0        ; eax = 0
    .loop
    cmp byte [rdi], `\0` ; rdi == `\0`
    jz .break
    inc byte rdi      ; rdi++;
    inc dword eax     ; eax++;
    jmp .loop
    .break
    ret

