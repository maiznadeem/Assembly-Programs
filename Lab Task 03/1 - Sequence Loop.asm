	ORG 100H     
	      
	.DATA

		TERM 	DW 	0
		SUM 	DW 	0

	.CODE      

			MOV TERM, 1   
			MOV SUM, 0
			MOV AX, 0

		L1:	ADD AX, TERM 
			ADD TERM, 3
			CMP TERM, 149
			JL L1 

			MOV SUM, AX

	RET