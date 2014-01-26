[org 0x7c00]

begin_code:
	mov bp, 0x8000;
	mov sp, bp;
	
	mov bl, 'X'
	mov cl, 'Y'
	mov dl, 'Z'
	pusha;	

	push 'A'
	push 'B'
	push 'C'
	
	mov ah, 0x0e;
	pop bx;
	mov al, bl;
	int 0x10

	pop bx;
	mov al, bl;
	int 0x10
	
	pop bx;
	mov al, bl;
	int 0x10;
	
	popa;

	mov ah, 0x0e;
	mov al, bl;
	int 0x10;
	mov al, cl;
	int 0x10;
	mov al, dl;
	int 0x10;

	jmp	 $;

zero_padding:
	times 510-($-$$) db 0;

boot_sector_end:
	dw 0xaa55;


