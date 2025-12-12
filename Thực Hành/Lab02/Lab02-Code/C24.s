.section .data
.section .bss
    .lcomm input, 4
.section .text
    .global _start
_start:
    movl $3, %eax           
    movl $4, %ebx          
Nhap:
    movl $3, %eax           
    movl $0, %ebx           
    movl $input, %ecx       
    movl $4, %edx           
    int $0x80      
            
    movl $input, %eax     
    
    # Ky tu dau tien
    movb (%eax), %bl        
    subb $32, %bl           
    movb %bl, (%eax)        

    # Ky tu thu hai
    movb 1(%eax), %bl       
    subb $32, %bl           
    movb %bl,1(%eax)        

    # Ky tu thu ba
    movb 2(%eax), %bl       
    subb $32, %bl          
    movb %bl, 2(%eax)        

# In ket qua
    movl $4, %eax
    movl $1, %ebx
    movl $input, %ecx
    movl $4, %edx
    int $0x80

# Thoat chuong trinh
    movl $1, %eax        
    int $0x80