default rel

global testfunc
section .text

testfunc:
    mov eax, [localdata]
    ret

localdata:
    dd 1234

