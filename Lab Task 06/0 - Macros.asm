
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.DATA           

WORD DW -10

.CODE

NEWLINE MACRO
    PUSH AX
    PUSH DX
    
    MOV AH, 2
    MOV DL, 13
    INT 21h 
    
    MOV DL, 10
    INT 21h     
    
    POP DX
    POP AX
ENDM    
                      
                      
ABSOLUTE MACRO BYTE
   LOCAL EXIT
    
         PUSH AX
    
         MOV AX, 0
         CMP AX, WORD
         JGE EXIT  
         NEG WORD
    
   EXIT: POP AX
         ENDM                    


MAIN PROC 
        
    MOV AH, 2
    MOV DL, 'A'
    INT 21h 
    
    NEWLINE  
    
    MOV DL, 'B'
    INT 21h    
             
    XOR AX, AX         
    ABSOLUTE WORD
    
    RET
    
ENDP

RET



