    ORG 100h

    .DATA

        SWAP DB ?
    	N DW 6
    	ARRAY DB 2, 6, 7, 1, 4, 7
    	
    .CODE                           

    START:      MOV SWAP, 0
                MOV SI, OFFSET ARRAY    ; storing array offset in SI 
                XOR BX, BX
        

    COMPARISON: MOV AL, [SI+BX]     
                CMP AL, [SI+BX+1]   
                JBE NOSWAP       
        
    ;SWAP:
                MOV SWAP, 1             ; indicates swapping has occurred
                XCHG AL, [SI+BX+1]
                MOV [SI+BX], AL
                 
                 
    NOSWAP:     INC BX   
                CMP BX, N               ; using N as number of elements to loop through array
                JNZ COMPARISON
        
                CMP SWAP, 0             ; checks if swapping has occurred
                JNZ START               ; if yes, loops again. if not, program ends
                 
    RET