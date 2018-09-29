org 0x7C00          ; Loaded into memory at 0x0000:0x7c00 (segment 0, address 0x7c00).

start:
    mov ah, 0x0E    ; Teletype output for int 0x10.
    mov si, str

loop:
    lodsb           ; Load byte at address DS:(E)SI into AL.
    cmp al, 0
    je  read_key_press
    int 0x10
    jmp loop

read_key_press:
    mov ah, 0       ; Return AH = Scan code of the key pressed down, AL = ASCII character of the button pressed.
    int 0x16        ; This interruption is responsible for control of the PC keyboard.

    ; Print pressed character.
    mov ah, 0x0E    ; Teletype output for int 0x10.
    int 0x10
    hlt  

str: db "> ", 0

; The boot signature is in a boot sector.
times 510 - ($ - $$) db 0
dw 0xAA55
