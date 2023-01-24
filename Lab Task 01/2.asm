	ORG 100h
	 
	.DATA       
	 
	.CODE  
	
		MOV AL, 255             ; 256 exceeds the 0-255 lower byte limit.
		MOV AX, 0xF1ABh         ; Not a hex value until preceded by 0x because F is in front.
		MOV AX, -123            ; Negative decimal in 16-bit register.
		MOV BX, 123             ; Positive decimal in 16-bit register.
		MOV AH, 010010001b      ; Binary value in 8-bit register.
		MOV 1234h, BX           ; 16-bit register in a hex memory location.
		MOV DX, 33h             ; Hex value in a register.
		MOV CX, 'AB'            ; 16-bit ASCII value of AB in register.
		MOV CH, AL              ; Lower byte of Accumulator to Higher Byte of Count register.
		MOV DL, BL              ; 8-bit to 9-bit.
		MOV AH, BL              ; Higher to Lower (8-bit to 8-bit).
		MOV AX, CX              ; Move operation on 2 different registers.                      
	 
	RET