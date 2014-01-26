
; expects bx to point to data address that ends with zero

printf:

begin_printf:

	pusha                     ; push all registers to stack
	mov ah, 0x0e              ; initialize ah with bios print routine

loop_printf:	
	
	mov al, [bx];             ; load al with data in bx
	cmp al, 0;                ; compare that data with 0
	je end_printf;            ; if (al != 0)
	int 0x10;                 ; print al		
	add bx, 1;                ; increment bx
	jmp loop_printf;          ; print next symbol

end_printf:                       ; else (here al == 0)

	popa;                     ; pop all registers 
	ret;                      ; return 

