image:
	nasm -f bin boot.asm -o boot.img

run:
	qemu-system-i386 -hda boot.img

clean:
	rm -f boot.img
