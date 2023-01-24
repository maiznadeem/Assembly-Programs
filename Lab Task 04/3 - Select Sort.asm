    ORG 100h

    .DATA        
        SWAP DB ?  
    	N DW 6
    	ARRAY DB 2, 6, 7, 1, 4, 8
    	
    .CODE    

    MOV SI, OFFSET ARRAY            ; storing array offset in SI
    SUB SI, 1          
    INC N                           ; retaining value of N for first cycle

    START:      
        
        DEC N                       ; decrementing N whenever the least number is caught
        MOV SWAP, 0                 ; indicates least value is caught
        INC SI                      ; incrementing SI whenever the least value is caught and stored in it
        XOR BX, BX
        

    COMPARISON:  
        MOV AL, [SI]   
        MOV DL, [SI+BX+1]  
        CMP AL, [SI+BX+1]   
        JBE NEXT       
        
    ;SWAP:
        MOV SWAP, 1                 
        XCHG AL, [SI+BX+1]
        MOV [SI], AL
                 
                 
    NEXT:
        INC BX   
        CMP BX, N                   ; using N as number of elements to loop through array
        JNZ COMPARISON  
        
    CMP SWAP, 0                     ; checks if least value is caught
    JNZ START                       ; if yes, loops again. if not, program ends
                 
    RET