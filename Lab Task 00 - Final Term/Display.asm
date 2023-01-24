ORG 100h

.DATA             

    ARR     DW  0500h
    COUNT   DW  0
        
    RIGHT   DW  0
    DOWN    DW  0      
    LEFT    DW  0
    UP      DW  0
     
    RFLAG   DW  0 
    DFLAG   DW  0
    LFLAG   DW  0
    UFLAG   DW  0  


.CODE                
                    
                    MOV BX, ARR      
                    

    INPUTSTRING:    MOV AH, 1
                    INT 21H
                    CMP AL, 0x0D
                    JE  NEXT  
                    MOV [BX], AL
                    INC BX
                    INC COUNT
                    JMP INPUTSTRING     
                               
                               

           NEXT:    MOV DX, COUNT
                    DEC DX
                    MOV AX, 160
                    MUL DX
                    MOV DX, 22*160+2*2
                    SUB DX, AX
                    MOV RIGHT, DX           ; CALCULATING STRING'S RIGHT MOVING INDEX  
                                 

                    MOV DX, RIGHT           
                    ADD DX, 152
                    SUB DX, COUNT
                    SUB DX, COUNT             
                    MOV UP, DX              ; CALCULATING STRING'S   UP  MOVING INDEX


                    MOV DX, 2*160+77*2
                    SUB DX, COUNT
                    SUB DX, COUNT
                    ADD DX, 2
                    MOV LEFT, DX            ; CALCULATING STRING'S  LEFT MOVING INDEX    

                               
                    MOV DX, 2*160+2*2
                    MOV DOWN, DX            ; CALCULATING STRING'S  DOWN MOVING INDEX    
                                        
                    
                    
                    ; DISPLAY MODE   
                    
                    MOV SI, RIGHT           ; STARTING INDEX
                    SUB SI, 2 

                    MOV AH, 0
                    MOV AL, 3
                    INT 10H 
                    
                    MOV AX, 0xB800
                    MOV ES, AX 
                    MOV AH, 0x07  
                    

      RIGHTMOVE:    MOV RFLAG, 1
                    MOV DFLAG, 0  
                    MOV LFLAG, 0
                    MOV UFLAG, 0            ; PREVENTS MOVING STRING IN OTHER DIRECTIONS
                    
                    ADD SI, 2
                    MOV BX, ARR
                    MOV CX, COUNT  
                    JMP STRINGPRINT

         UPMOVE:    MOV RFLAG, 0
                    MOV DFLAG, 0
                    MOV LFLAG, 0
                    MOV UFLAG, 1
                    
                    SUB SI, 160
                    MOV BX, ARR
                    MOV CX, COUNT  
                    JMP STRINGPRINT

       LEFTMOVE:    MOV RFLAG, 0
                    MOV DFLAG, 0  
                    MOV LFLAG, 1
                    MOV UFLAG, 0 
                    
                    SUB SI, 2
                    MOV BX, ARR
                    MOV CX, COUNT  
                    JMP STRINGPRINT

       DOWNMOVE:    MOV RFLAG, 0
                    MOV DFLAG, 1  
                    MOV LFLAG, 0
                    MOV UFLAG, 0 
                    
                    ADD SI, 160
                    MOV BX, ARR
                    MOV CX, COUNT  
                    JMP STRINGPRINT
                      
                      
    STRINGPRINT:    CMP CX, 0
                    JE  PRINTNEXT  
                    MOV AL, [BX]
                    MOV ES:SI, AX
                    ADD SI, 162
                    INC BX    
                    DEC CX
                    JMP STRINGPRINT          ; PRINTS STRING DIAGONALLY
                    
                                
      PRINTNEXT:    MOV CX, COUNT
                    
          ERASE:    MOV AH, 0X07
                    MOV AL, ' '
                    MOV ES:SI, AX
                    SUB SI, 162     
                    LOOP ERASE               ; ERASES STRING DIAGONALLY
                    
                    MOV ES:SI, AX   

                    CMP SI, UP
                    JE  UPMOVE               ; SHIFTS STRING UP  
                    CMP SI, LEFT
                    JE  LEFTMOVE             ; SHIFTS STRING LEFT                  
                    CMP SI, DOWN
                    JE  DOWNMOVE             ; SHIFTS STRING DOWN
                    CMP SI, RIGHT
                    JE  RIGHTMOVE            ; SHIFTS STRING RIGHT
                               
                               
                    CMP UFLAG, 1             
                    JE  UPMOVE
                    CMP LFLAG, 1
                    JE  LEFTMOVE 
                    CMP DFLAG, 1
                    JE  DOWNMOVE
                    CMP RFLAG, 1
                    JE  RIGHTMOVE            ; MAKES STRING KEEP MOVING IN SAME DIRECTION      
                    
              
