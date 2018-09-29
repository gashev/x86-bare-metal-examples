org 0x7C00

start:
    mov ah, 0x0E
    mov si, str

loop:
    lodsb
    cmp al, 0
    je  halt
    int 0x10
    jmp loop

halt: hlt

str: db "Hello, World!", 0

times 510 - ($ - $$) db 0
dw 0xAA55
