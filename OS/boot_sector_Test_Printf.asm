[org 0x7c00]

code:
	mov bp, 0x8000;
	mov sp, bp;
	
	mov bx, data;
	call printf;	
	jmp $;

%include "printf.asm"
	
data: 
	db "Hello, Lenka!",0

zero_padding:
	times 510-($-$$) db 0;

boot_sector_end:
	dw 0xaa55;


