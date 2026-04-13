[org 0x7e00]

; Set video mode 80x25 text
mov ah, 0x00
mov al, 0x03        ; mode 3 = 80x25 color text (mode 1 is 40x25)
int 0x10

; Set up es:bp -> string
xor ax, ax
mov es, ax
mov bp, stref

; Call int 0x10 ah=0x13 AFTER es:bp are set
mov ah, 0x13
mov al, 0x01        ; write mode 1: advance cursor
mov bh, 0x00        ; page 0
mov bl, 0x07        ; attribute: light grey on black
mov cx, 4           ; string length
mov dh, 0           ; row 0
mov dl, 0           ; col 0
int 0x10

jmp $

stref db 'test'

