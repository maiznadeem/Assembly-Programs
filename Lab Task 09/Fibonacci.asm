	ORG 100h

	.DATA

		SERIES	DW  0, 1, 8 DUP(0)		; (Global) Array that holds terms of the series
		TERM1 	DW 	0 					; (Local)  N-2 term
		TERM2 	DW	0 					; (Local)  N-1 term
		N 		DW  0 					; (Local)  Number of terms remaining.
		SIZE	DW  8					; (Global) Number of terms to be added in array.

	.CODE

	MAIN PROC

		LEA SI, SERIES
		ADD SI, 4

		PUSH SIZE						; 1. Passed Parameters from MAIN.
		PUSH 0
		PUSH 1

		CALL FIBO 						; 2. Called PROC.

	RET
	MAIN ENDP


	FIBO PROC

		MOV BP, SP									

		MOV AX, [BP+6]					; 3. Loaded First Parameter in PROC.
		MOV N, AX
		CMP N, 0 						; 4. Checked Base Criteria.
		JNE AGAIN

		MOV AX, [BP+2]
		MOV [SI], AX
		JMP EXIT 						; 5. RET if Fulfilled.

		AGAIN:	DEC N
				MOV BP, SP

				MOV AX, [BP+2]			; 8. Loaded Previously called Parameters.
				MOV TERM2, AX
				MOV BX, AX
				MOV AX, [BP+4]
				MOV TERM1, AX

				MOV AX, TERM1
				ADD AX, TERM2

				MOV TERM1, BX
				MOV TERM2, AX

				MOV [SI], AX
				ADD SI, 2

				PUSH N 					; 6. Prepared Parameters for next Call.
				PUSH TERM1
				PUSH TERM2
				CALL FIBO				; 7. Called Again.

	EXIT:								; 9. Processed and Exit.
	RET 6

	FIBO ENDP