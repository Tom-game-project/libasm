default rel

global ft_strlen
section .text

; size_t ft_strlen(const char *s);

; size_of(char *) = 64bit (8 byte) -> qword
;
; while (*c != '0') {
;   eax++;
;   c++;
; }
; return eax;
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

