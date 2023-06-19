org 0x7C00 ; MBR entry point

section .text
    ; Clear the screen
    mov ah, 0x06
    mov al, 0x00
    xor cx, cx
    mov dh, 0x18
    mov dl, 0x00
    int 0x10

    ; Set cursor position
    mov ah, 0x02
    mov bh, 0x00
    xor dh, dh
    xor dl, dl
    int 0x10

    ; Print "Poggers" string
    mov si, message
    call print_string

    ; Infinite loop to prevent the program from exiting
    cli
    hlt

print_string:
    lodsb
    or al, al
    jz done
    mov ah, 0x0E
    int 0x10
    jmp print_string

done:
    ret

section .data
    message db 'Poggers', 0

times 510 - ($-$$) db 0 ; Fill the rest of the MBR with zeroes
dw 0xAA55 ; Boot signature
