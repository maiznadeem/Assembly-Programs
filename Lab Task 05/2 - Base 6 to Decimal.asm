     DIS MACRO STR 
         MOV AH,09H
         LEA DX,STR
         INT 21H
     ENDM 

     ORG 100h
          
     .DATA     
       
     MSG1   DB "ENTER A BASE 6 NUMBER: $"        
     MSG2   DB "BASE 10 NUMBER IS: $"
     INPUT  DB 20 DUP('$')    
     ANS    DB 0   
     SIZE   DB 0 
     LEN    DB 0
     BASE   DB 6
     LINE   DB 10, 13, '$'

     .CODE

     MAIN PROC   
         
             DIS MSG1         
         
             LEA SI, INPUT
             MOV AH, 1
                 
        L1:  INT 21H      
             SUB AL, 30H
             MOV [SI], AL
             INC SI
             INC SIZE
             CMP AL, 0DDH
             JNE L1
            
             DEC SIZE
             MOV AL, SIZE
             MOV LEN, AL      
             XOR AX, AX
             XOR DX, DX
                    
             LEA SI, INPUT 
              
              
              
        L2:  MOV AL, [SI]
             INC SI
             DEC SIZE
             MOV DL, SIZE
             CMP DL, 0
             JE L4
        L3:  MUL BASE
             DEC DL
             CMP DL, 0
             JNE L3
        L4:  ADD ANS, AL
             CMP SIZE, 0
             JNE L2
             
             
             DIS LINE
             DIS MSG2  
             
             XOR AX, AX              
             XOR DX, DX 
             MOV AL, ANS
                           
                           
             MOV CX, 0
             MOV DX, 0
     LABEL1: CMP AX, 0
             JE PRINT1     
              
             MOV  BX, 10       
             DIV  BX                 
             PUSH DX             
             INC  CX             
             XOR  DX, DX
             JMP LABEL1
             
     PRINT1: CMP CX, 0
             JE EXIT
             POP DX
             ADD DX, 48
             MOV AH, 2
             INT 21H
             DEC CX
             JMP PRINT1
     EXIT:
                   
     MAIN ENDP

     RET