[org 0x7c00]

mov ah, 0x00
mov al, 0x01
int 0x10

; setup text cpointer
xor ax, ax
mov es, ax
mov bp, stref

;draw text
fail:
    mov ah, 0x13
    mov al, 0x01
    mov bh, 0x00
    mov bl, 0x1F
    mov cx, 11
    mov dh, 0
    mov dl, 0
    int 0x10

xor ax, ax
mov es, ax
mov bx, 0x7e00

mov ah, 0x02
mov al, 1
mov ch, 0
mov cl, 2
mov dh, 0
mov dl, 0x80
int 0x13

jc fail

jmp 0x0000:0x7e00


stref db 'Boot Failed'

times 510-($-$$) db 0
dw 0xaa55