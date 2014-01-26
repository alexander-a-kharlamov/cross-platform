; expects that number of requested sectors will come from DX
; expects that memory address to write data is in ES:BX

readf:

begin_readf:

	pusha           ;
	push dx         ;

	mov ah, 0x02    ; BIOS read sector function
	mov al, dh      ; Read DH sectors
	mov ch, 0x00    ; Select cylinder 0
	mov dh, 0x00    ; Select head 0
	mov cl, 0x02    ; start reading from second sector
	int 0x13        ; call BIOS interupt

	jc error_readf  ;

	pop dx          ;      
	cmp dh, al      ; al will store the actual number of read sectors 
	je  end_readf   ;
	
error_readf:
	mov bx, DISK_ERROR_MSG;
	call printf;

end_readf:
	popa            ;
	ret             ;

; Variables
DISK_ERROR_MSG db "Disk read error!", 0
