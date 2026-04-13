nasm bootloader.asm -o boot.bin
nasm payload.asm -o payload.bin
dd if=boot.bin of=disk.img conv=notrunc
dd if=payload.bin of=disk.img bs=512 seek=1 conv=notrunc
qemu-system-x86_64 -drive format=raw,file=disk.img
