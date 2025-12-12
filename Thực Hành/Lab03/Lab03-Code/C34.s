.section .data
    str_cccd: .string "CCCD: "
    str_cccd_len = . - str_cccd
    str_namsinh: .string "Nam sinh: "
    str_namsinh_len = . - str_namsinh
    str_gioitinh: .string "Gioi tinh: "
    str_gioitinh_len = . - str_gioitinh
    str_less: .string "Chua den tuoi lao dong"
    str_less_len = . - str_less
    str_equal: .string "Trong do tuoi lao dong"
    str_equal_len = . - str_equal
    str_greater: .string "Het do tuoi lao dong"
    str_greater_len = . - str_greater
    str_nam: .string "Nam\n"
    str_nam_len = . - str_nam
    str_nu: .string "Nu\n"
    str_nu_len = . - str_nu
    newline: .string "\n"
    newline_len = . - newline
.section .bss
    .lcomm cccd, 13
    .lcomm gioitinh, 2
    .lcomm namsinh, 6
.section .text
    .globl _start

_start:

    # Xuat ra CCCD: 
    movl $str_cccd_len, %edx
    movl $str_cccd, %ecx
    movl $1, %ebx
    movl $4, %eax 
    int $0x80

    # Nhap cccd
    movl $3, %eax
    movl $0, %ebx
    movl $cccd, %ecx
    movl $13, %edx
    int $0x80

# Xu ly logic

    # Xu ly gioi tinh
    movb cccd + 3, %al
    subb $'0', %al
    andb $1, %al   
    cmpb $0, %al
    je _Nam

_Nu: 
    movl $0, (gioitinh)

    movb cccd + 3, %al
    subb $'0', %al

    cmpb $3, %al
    je _The_Ki_21
    cmpb $5, %al
    je _The_Ki_22
    cmpb $7, %al
    je _The_Ki_23
    cmpb $9, %al
    je _The_Ki_24

    jmp _The_Ki_20

_Nam:     
    movl $1, (gioitinh)

    movb cccd + 3, %al
    subb $'0', %al

    cmpb $2, %al
    je _The_Ki_21
    cmpb $4, %al
    je _The_Ki_22
    cmpb $6, %al
    je _The_Ki_23
    cmpb $8, %al
    je _The_Ki_24
    
    jmp _The_Ki_20

    # Xu ly nam sinh

_The_Ki_20: 
    movl $namsinh, %edi
    movb $'1', (%edi)
    movb $'9', 1(%edi)
    movl $cccd, %esi
    movb 4(%esi), %al
    movb %al, 2(%edi)
    movb 5(%esi), %al
    movb %al, 3(%edi)
    jmp _Calculate

_The_Ki_21:
    movl $namsinh, %edi
    movb $'2', (%edi)
    movb $'0', 1(%edi)
    movl $cccd, %esi
    movb 4(%esi), %al
    movb %al, 2(%edi)
    movb 5(%esi), %al
    movb %al, 3(%edi)
    jmp _Calculate

_The_Ki_22:
    movl $namsinh, %edi
    movb $'2', (%edi)
    movb $'1', 1(%edi)
    movl $cccd, %esi
    movb 4(%esi), %al
    movb %al, 2(%edi)
    movb 5(%esi), %al
    movb %al, 3(%edi)
    jmp _Calculate

_The_Ki_23:
    movl $namsinh, %edi
    movb $'2', (%edi)
    movb $'2', 1(%edi)
    movl $cccd, %esi
    movb 4(%esi), %al
    movb %al, 2(%edi)
    movb 5(%esi), %al
    movb %al, 3(%edi)
    jmp _Calculate

_The_Ki_24:
    movl $namsinh, %edi
    movb $'2', (%edi)
    movb $'3', 1(%edi)
    movl $cccd, %esi
    movb 4(%esi), %al
    movb %al, 2(%edi)
    movb 5(%esi), %al
    movb %al, 3(%edi)
    movb $'\n', 4(%edi)
    jmp _Calculate

    # Xu ly tuoi lao dong

_Calculate:

    # Tinh tuoi

_Convert:

    # Xuat Nam sinh:
    movl $str_namsinh_len, %edx
    movl $str_namsinh, %ecx
    movl $1, %ebx
    movl $4, %eax 
    int $0x80

    movl $5, %edx
    movl $namsinh, %ecx
    movl $1, %ebx
    movl $4, %eax 
    int $0x80

    movl $newline_len, %edx
    movl $newline, %ecx
    movl $1, %ebx
    movl $4, %eax
    int $0x80

    # Chuyen nam sinh tu chuoi sang so
    movl $namsinh, %esi     
    xorl %eax, %eax      

    movb (%esi), %bl        
    subb $'0', %bl          
    movzbl %bl, %ebx        
    imull $10, %eax         
    addl %ebx, %eax         
    incl %esi               

    movb (%esi), %bl        
    subb $'0', %bl
    movzbl %bl, %ebx
    imull $10, %eax
    addl %ebx, %eax
    incl %esi

    movb (%esi), %bl        
    subb $'0', %bl
    movzbl %bl, %ebx
    imull $10, %eax
    addl %ebx, %eax
    incl %esi

    movb (%esi), %bl       
    subb $'0', %bl
    movzbl %bl, %ebx
    imull $10, %eax
    addl %ebx, %eax
    
    movl %eax, namsinh

    cmpb $0, gioitinh
    je _Calculate_Old_Nu

_Calculate_Old_Nam:

    # Xuat Gioi tinh: Nam
    movl $str_gioitinh_len, %edx
    movl $str_gioitinh, %ecx
    movl $1, %ebx
    movl $4, %eax 
    int $0x80

    movl $str_nam_len, %edx
    movl $str_nam, %ecx
    movl $1, %ebx
    movl $4, %eax 
    int $0x80

    # Tinh tuoi
    movl $2025, %ebx
    subl namsinh, %ebx
    movl %ebx, namsinh
    cmpl $15, namsinh
    jl _Less_Old
    cmpl $60, namsinh
    jg _Greater_Old
    jmp _Equal_Old

_Calculate_Old_Nu:
    # Xuat Gioi tinh: Nu
    movl $str_gioitinh_len, %edx
    movl $str_gioitinh, %ecx
    movl $1, %ebx
    movl $4, %eax 
    int $0x80

    movl $str_nu_len, %edx
    movl $str_nu, %ecx
    movl $1, %ebx
    movl $4, %eax 
    int $0x80

    # Tinh tuoi
    movl $2025, %ebx
    subl namsinh, %ebx
    movl %ebx, namsinh
    cmpl $15, namsinh
    jl _Less_Old
    cmpl $55, namsinh
    jg _Greater_Old
    jmp _Equal_Old

_Less_Old:
    movl $str_less_len, %edx
    movl $str_less, %ecx
    movl $1, %ebx
    movl $4, %eax 
    int $0x80

    jmp _Exit

_Equal_Old:
    movl $str_equal_len, %edx
    movl $str_equal, %ecx
    movl $1, %ebx
    movl $4, %eax 
    int $0x80

    jmp _Exit

_Greater_Old:
    movl $str_greater_len, %edx
    movl $str_greater, %ecx
    movl $1, %ebx
    movl $4, %eax 
    int $0x80

    jmp _Exit

_Exit:
    movl $1, %eax
    int $0x80