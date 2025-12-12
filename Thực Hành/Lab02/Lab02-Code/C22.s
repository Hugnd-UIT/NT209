.section .data
    msg1: .string "Date (DDMMYYYY): "
    msg1_len = . - msg1
    msg2: .string "Date (MMDDYYYY): "
    msg2_len = . - msg2
.section .bss
    .lcomm dauvao, 9
    .lcomm daura, 9
.section .text
    .globl _start
_start:
    movl $msg1_len, %edx
    movl $msg1, %ecx
    movl $1, %ebx
    movl $4, %eax
    int $0x80

    movl $3, %eax
    movl $0, %ebx
    movl $dauvao, %ecx
    movl $9, %edx
    int $0x80
    
    movl $dauvao, %esi
    movl $daura, %edi
    
    movb 2(%esi),%al
    movb %al,0(%edi)
    movb 3(%esi),%al
    movb %al,1(%edi)

    movb 0(%esi),%al
    movb %al,2(%edi)
    movb 1(%esi),%al
    movb %al,3(%edi)

    movb 4(%esi),%al
    movb %al,4(%edi)
    movb 5(%esi),%al
    movb %al,5(%edi)
    movb 6(%esi),%al
    movb %al,6(%edi)
    movb 7(%esi),%al
    movb %al,7(%edi)

    movl $msg2_len, %edx
    movl $msg2, %ecx
    movl $1, %ebx
    movl $4, %eax
    int $0x80

    movl $9, %edx
    movl $daura, %ecx
    movl $1, %ebx
    movl $4, %eax
    int $0x80

    movl $1,%eax
    int $0x80