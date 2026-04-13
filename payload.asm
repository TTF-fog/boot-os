[org 0x7e00]

mov ah, 0x00
mov al, 0x03
int 0x10

xor ax, ax
mov es, ax
mov bp, stref

mov ah, 0x13
mov al, 0x01
mov bh, 0x00
mov bl, 0x1F
mov cx, 6
mov dh, 0
mov dl, 0
int 0x10
mov dh, 1
mov bl, 0x80
xor ax, ax
mov es, ax
mov bp, diskmsg
discover_disks:
    mov ah, 0x02
    mov al, 1
    mov ch, 0
    mov cl, 2
    mov bh, 0
    int 0x13
    jc disk_error
    inc [disk]
    cmp [disk], 0x85
    jne discover_disks
    jmp $

disk_error:
    mov ah, 0x13
    mov al, 0x01
    mov bh, 0x00
    mov bl, 0x1F
    mov cx, 11
    mov dh, [row]
    mov dl, 0
    int 0x10
    inc [row]
    inc [disk]
    cmp [disk], 0x85
    jne discover_disks
    jmp $

jmp $

stref db 'Disks:'
diskmsg db 'No Disk'
row db 1
disk db 0x80