loop:
	
	mov ah, 0x0e;

	mov al, [the_secret];
	int 0x10;

	mov bx, 0x7c0                   ; Segment addressing will mul this value by 16     
	mov ds, bx                      ;             
	mov al, [the_secret];
	int 0x10;

	mov al, [es:the_secret];
	int 0x10;

	mov bx, 0x7c0;	
	mov es, bx;
	mov al, [es:the_secret]
	int 0x10;

	jmp $;

	the_secret: 
	db 'XYZ'

	times 510-($-$$) db 0;

	dw 0xaa55;


