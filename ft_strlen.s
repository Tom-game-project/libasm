default rel

global ft_strlen
section .text

; size_of(char *) = 64bit (8 byte) -> qword
;
; while (*c != `0`) {
;   eax++;
;   c++;
; }
; return eax;
ft_strlen:
    mov eax, 0
    .loop
    cmp byte [rdi], 0 
    jz .break
    inc byte rdi
    inc dword eax
    jmp .loop
    .break
    ret


