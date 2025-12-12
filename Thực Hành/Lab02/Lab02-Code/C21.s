.section .data                
    msg: .string "NT209UIT"    
    msg_len = . - msg          
    ans: .byte 0    
.section .text                 
    .globl _start              
_start:
    movl $msg_len, %eax        
    subl $1, %eax               
    addl $'0', %eax            
    movb %al, ans              

    movl $1, %edx              
    movl $ans, %ecx            
    movl $1, %ebx              
    movl $4, %eax              
    int $0x80                  

    movl $1, %eax              
    int $0x80                 