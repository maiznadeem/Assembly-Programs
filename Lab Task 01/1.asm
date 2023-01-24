	ORG 100h
	 
	.DATA      
	 
		X DW 11
		Y DW 0x1AB2
	 
	.CODE      
	 
	 	; VALID:
		MOV AX, BX			; Register to Register
		MOV AX, X 			; Reference to Register
		MOV AX, 9			; Immediate to Register
		MOV Y, BX			; Register to Reference
		MOV Y, 5			; Immediate to Reference
		
		MOV 38h, BX			; Register to memory address
		MOV 5, 6			; Immediate to Immediate

		; NOT VALID
		MOV X, Y			; Reference to Reference

	RET