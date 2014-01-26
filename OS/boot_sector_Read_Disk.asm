[org 0x7c00]

code:

	mov [BOOT_DRIVE], dl        ; BIOS stores our Boot Drive in DL
	
	mov bp, 0x8000;
	mov sp, bp;

	mov bx, HELLO_MSG
	call printf;
	
	mov bx, 0x9000;
	mov dh, 5;                  ; We want 5 sectors from the same media
	mov dl, [BOOT_DRIVE]        ; that we loaded from 
	call readf;

	mov bx, 0x9000;
	call printf;

	mov bx, 0x9510;
	call printf;

	jmp $;

%include "printf.asm"
%include "readf.asm"	

HELLO_MSG: 
	db "Hello, Lenka! ",0

BOOT_DRIVE:
	db 0;

zero_padding:
	times 510-($-$$) db 0;

boot_sector_end:
	dw 0xaa55;

times 256 db "ABC",0
times 256 db "XYZ",0
