.section .data
    str_true: .string "Giam dan"
    str_true_len = . - str_true
    str_false: .string "Khong giam dan"
    str_false_len = . - str_false
    str_prompt: .string "Enter a number (5-digit): "
    str_prompt_len = . - str_prompt
.section .bss
    .lcomm input, 6
.section .text
    .globl _start
_start: 
    # Xuất ra màn hình Enter a number (5-digit): 
    movl $str_prompt_len, %edx
    movl $str_prompt, %ecx
    movl $1, %ebx
    movl $4, %eax
    int $0x80

    # Nhập dữ liệu từ bàn phím
    movl $3, %eax
    movl $0, %ebx
    movl $input, %ecx
    movl $5, %edx
    int $0x80

# Xử lý logic
    # Lấy chữ số thứ 1
    movl $input, %esi
    movb (%esi), %al
    # Kiểm tra chữ số thứ 2
    movb 1(%esi), %bl
    cmpb %bl, %al
    jle _Exit_false
    movb %bl, %al
    # Kiểm tra chữ số thứ 3
    movb 2(%esi), %bl
    cmpb %bl, %al
    jle _Exit_false
    movb %bl, %al
    # Kiểm tra chữ số thứ 4
    movb 3(%esi), %bl
    cmpb %bl, %al
    jle _Exit_false
    movb %bl, %al
    # Kiểm tra chữ số thư 5
    movb 4(%esi), %bl
    cmpb %bl, %al
    jle _Exit_false
    movb %bl, %al
    # Nếu số giảm dần
_Exit_true:
    # Xuất ra màn hình Giam dan
    movl $str_true_len, %edx
    movl $str_true, %ecx
    movl $1, %ebx
    movl $4, %eax
    int $0x80
    jmp _Exit
    # Nếu số không giảm dần
_Exit_false:
    movl $str_false_len, %edx
    movl $str_false, %ecx
    movl $1, %ebx
    movl $4, %eax
    int $0x80
    jmp _Exit
_Exit:
    movl $1, %eax
    int $0x80