ORG 100h     
           
.MODEL SMALL           
           
.STACK 100h     
     
.DATA     

INPUT  DB 5 DUP(5)    
OUTPUT DB 5 DUP(?)
SIZE   DW 0  

.CODE

MAIN PROC         
    
        MOV SI, OFFSET INPUT    
        MOV AL, 0
    
  LOOP1:   
        MOV AH, 1  
        INT 21h    
        SUB AL, 30h
        MOV [SI], AL
        INC SIZE
        INC SI  
        CMP AL, 0xDDh
        JNZ LOOP1       
        DEC SIZE
             
        MOV SI, OFFSET INPUT     
        DEC SI    
        ADD SI, SIZE
        MOV BL, 0        
        XOR CX, CX
        MOV CX, SIZE

  LOOP2:
        MOV DL, [SI]  
        DEC SI 
        ADD DL, 30h
        MOV AH, 2
        INT 21h
        LOOP LOOP2
        
        MOV AH, 4Ch
        INT 21h   
          
MAIN ENDP

END MAIN

ret




