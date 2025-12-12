.section .data
    msg: .string "Enter number: "
    msg_len = . - msg
.section .bss
    .lcomm first, 4
    .lcomm second, 4
    .lcomm third, 4
    .lcomm fourth, 4
    .lcomm out, 4
.section .text
    .globl _start
_start:
    # Hien thi Enter number:
    movl $msg_len, %edx
    movl $msg, %ecx
    movl $1, %ebx
    movl $4, %eax
    int $0x80
    # Nhap so thu nhat
    movl $3, %eax
    movl $0, %ebx
    movl $first, %ecx
    movl $2, %edx
    int $0x80
    # Chuyen first tu string sang int
    movl $first, %esi
    movb (%esi), %al
    cmpb $'1', %al
    jne one_digit_1
    cmpb $'0', 1(%esi)
    je two_digit_1
one_digit_1:
    subb $'0', %al
    movzbl %al, %edi
    movl %edi, first
    jmp done_1
two_digit_1:
    movl $10, first
done_1:
    # Hien thi Enter number:
    movl $msg_len, %edx
    movl $msg, %ecx
    movl $1, %ebx
    movl $4, %eax
    int $0x80
    # Nhap so thu hai
    movl $3, %eax
    movl $0, %ebx
    movl $second, %ecx
    movl $2, %edx
    int $0x80
    # Chuyen second tu string sang int
    movl $second, %esi
    movb (%esi), %al
    cmpb $'1', %al
    jne one_digit_2
    cmpb $'0', 1(%esi)
    je two_digit_2
one_digit_2:
    subb $'0', %al
    movzbl %al, %edi 
    movl %edi, second  
    jmp done_2
two_digit_2:
    movl $10, second
done_2:
    # Hien thi Enter number:
    movl $msg_len, %edx
    movl $msg, %ecx
    movl $1, %ebx
    movl $4, %eax
    int $0x80
    # Nhap so thu ba
    movl $3, %eax
    movl $0, %ebx
    movl $third, %ecx
    movl $2, %edx
    int $0x80
    # Chuyen third tu string sang int
    movl $third, %esi
    movb (%esi), %al
    cmpb $'1', %al
    jne one_digit_3
    cmpb $'0', 1(%esi)
    je two_digit_3
one_digit_3:
    subb $'0', %al
    movzbl %al, %edi 
    movl %edi, third    
    jmp done_3
two_digit_3:
    movl $10, third
done_3:
    # Hien thi Enter number:
    movl $msg_len, %edx
    movl $msg, %ecx
    movl $1, %ebx
    movl $4, %eax
    int $0x80
    # Nhap so thu tu
    movl $3, %eax
    movl $0, %ebx
    movl $fourth, %ecx
    movl $2, %edx
    int $0x80
    # Chuyen fourth tu string sang int
    movl $fourth, %esi
    movb (%esi), %al
    cmpb $'1', %al
    jne one_digit_4
    cmpb $'0', 1(%esi)
    je two_digit_4
one_digit_4:
    subb $'0', %al
    movzbl %al, %edi 
    movl %edi, fourth    
    jmp done_4
two_digit_4:
    movl $10, fourth
done_4:
    # Tinh diem trung binh
    movl $0, %eax 
    addl first, %eax 
    addl second, %eax 
    addl third, %eax
    addl fourth, %eax
    movl $4, %ecx
    movl $0, %edx
    divl %ecx
    # Chuyen ket qua tu int sang string
    movl %eax, %esi
    cmpl $10, %esi
    je .out_2
.out_1:
    addl $'0', %esi
    movb %sil, out
    jmp .printf
.out_2:
    movb $10, out 
    # Xuat ket qua
.printf:    
    movl $2, %edx
    movl $out, %ecx
    movl $1, %ebx
    movl $4, %eax
    int $0x80 
    # Thoat
    movl $1, %eax
    int $0x80