    ORG 100h

    .DATA     

        ARRAY DW 12 DUP(?)    

    .CODE   

            MOV CX, 12
            MOV SI, OFFSET ARRAY

            XOR AX, AX
            MOV BX, 0
            MOV DX, 1       
            MOV [SI], BX   
            ADD SI, 2    
            MOV [SI], DX
            ADD SI, 2

    FIBO:   XOR AX, AX
            ADD AX, BX
            ADD AX, DX
            MOV BX, DX
            MOV DX, AX
            MOV [SI], AX
            ADD SI, 2
            LOOP FIBO

    RET