   	ORG 100H     
	      
	.DATA

	.CODE            

		MOV CX, 'a'
		MOV AX, 0

		CMP CX, 41h
		JL NOT_ALPHABET

		CMP CX, 5Ah
		JL UPPER

		CMP CX, 61h
		JL NOT_ALPHABET

		CMP CX, 7Ah
		JL LOWER

		CMP CX, 7Ah
		JG NOT_ALPHABET

	        
	NOT_ALPHABET:	MOV AX, 0
					JMP EXIT

	UPPER:			MOV AX, 1
					JMP EXIT

	LOWER:			MOV AX, -1

	EXIT: 			RET