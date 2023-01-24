	ORG 100h

	.DATA

		A   	DW  5, 4, 3, 2, 1		; (Global) Array that holds terms
		I    	DW 	0 					; (Local)  Array's index
		N 		DW  5 					; (Global) Number of terms remaining
		MIN     DW  0                   ; (Global) Holds minimum value

	.CODE

	MAIN PROC

		LEA SI, A
		PUSH 0
		CALL FINDMIN

	RET
	MAIN ENDP


	FINDMIN PROC

		MOV BP, SP									

		MOV BX, [BP+2] 
		MOV DX, N
		ADD DX, N
		SUB DX, 2
		CMP BX, DX
		JNE AGAIN

		MOV BX, [BP+2]
		MOV DX, [SI+BX]
		MOV MIN, DX
		JMP EXIT

		AGAIN:	ADD I, 2
                PUSH I
                CALL FINDMIN
                
                MOV BP, SP 
                MOV BX, [BP+2]
                MOV AX, [SI+BX]
                CMP MIN, AX  
                JLE EXIT
                MOV MIN, AX
                

	EXIT:
	RET 2

	FINDMIN ENDP