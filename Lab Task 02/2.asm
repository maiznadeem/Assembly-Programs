	ORG 100h

	.DATA

		var1 DW 0    
		var2 DW 0
		var3 DW 0
		var4 DW 0
		var5 DB 0xFFFFh

	.CODE 
	    
		MOV var1, 4AC8h
		MOV var2, 478
		MOV var3, 0110101000101101b
		MOV var4, 'BD'

		MOV AX, var1
		ADD var1, BX	; 4CA6h

		MOV AX, var1
		SUB var3, AX	; 1F65h

		INC var3
		DEC var1

		MOV AX, var4
		XCHG var1, AX
		MOV var4, AX
		
		NEG var3

		MOV AX, var1	; ADD var5 to var1
		ADD AL, var5	
		MOV var1, AX

		MOV AX, var2	; SUB var5 from var2
		SUB AL, var5
		MOV var2, AX

		MOV AX, var3	; Swap var5 with var3
		XCHG AL, var5
		MOV var3, AX

		NEG var5		; Negative of var5

	RET