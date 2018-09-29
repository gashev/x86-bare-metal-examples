org 0x7C00          ; Loaded into memory at 0x0000:0x7c00 (segment 0, address 0x7c00).

start:
    mov ah, 0x0E    ; Teletype output for int 0x10.
    mov si, str

loop:
    lodsb           ; Load byte at address DS:(E)SI into AL.
    cmp al, 0
    je  halt
    int 0x10
    jmp loop

halt: hlt

str: db "Hello, World!", 0

; The boot signature is in a boot sector.
times 510 - ($ - $$) db 0
dw 0xAA55
