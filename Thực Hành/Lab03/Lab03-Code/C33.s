.section .data
    str_prompt_1: .string "Enter number 1st (1-digit): "
    str_prompt_1_len = . - str_prompt_1
    str_prompt_2: .string "Enter number 2st (1-digit): "
    str_prompt_2_len = . - str_prompt_2
    str_prompt_3: .string "Enter number 3st (1-digit): "
    str_prompt_3_len = . - str_prompt_3
    str_prompt_4: .string "Enter number 4st (1-digit): "
    str_prompt_4_len = . - str_prompt_4
    str_prompt_5: .string "Enter number 5st (1-digit): "
    str_prompt_5_len = . - str_prompt_5
    str_ans: .string "Count (> = 5): "
    str_ans_len = . - str_ans
.section .bss
    .lcomm in, 2
    .lcomm out, 2
.section .text
    .globl _start
_start:
    # Khoi tao cho bien count = 0
    movl $0, %esi

_L1:
    # Xuat ra man hinh Enter number 1st (1-digit):
    movl $str_prompt_1_len, %edx
    movl $str_prompt_1, %ecx
    movl $1, %ebx
    movl $4, %eax 
    int $0x80

    # Nhap du lieu
    movl $3, %eax
    movl $0, %ebx
    movl $in, %ecx
    movl $2, %edx
    int $0x80

    # Kiem so thu 1
    movb in, %al
    cmpb $'5', %al
    jl _L2
    addl $1, %esi

_L2:
    # Xuat ra man hinh Enter number 2st (1-digit):
    movl $str_prompt_2_len, %edx
    movl $str_prompt_2, %ecx
    movl $1, %ebx
    movl $4, %eax 
    int $0x80

    # Nhap du lieu
    movl $3, %eax
    movl $0, %ebx
    movl $in, %ecx
    movl $2, %edx
    int $0x80

    # Kiem so thu 2
    movb in, %al
    cmpb $'5', %al
    jl _L3
    addl $1, %esi

_L3:
    # Xuat ra man hinh Enter number 3st (1-digit):
    movl $str_prompt_3_len, %edx
    movl $str_prompt_3, %ecx
    movl $1, %ebx
    movl $4, %eax 
    int $0x80

    # Nhap du lieu
    movl $3, %eax
    movl $0, %ebx
    movl $in, %ecx
    movl $2, %edx
    int $0x80

    # Kiem so thu 3
    movb in, %al
    cmpb $'5', %al
    jl _L4
    addl $1, %esi

_L4:
    # Xuat ra man hinh Enter number 4st (1-digit):
    movl $str_prompt_4_len, %edx
    movl $str_prompt_4, %ecx
    movl $1, %ebx
    movl $4, %eax 
    int $0x80

    # Nhap du lieu
    movl $3, %eax
    movl $0, %ebx
    movl $in, %ecx
    movl $2, %edx
    int $0x80

    # Kiem so thu 4
    movb in, %al
    cmpb $'5', %al
    jl _L5
    addl $1, %esi

_L5:
    # Xuat ra man hinh Enter number 5st (1-digit):
    movl $str_prompt_5_len, %edx
    movl $str_prompt_5, %ecx
    movl $1, %ebx
    movl $4, %eax 
    int $0x80

    # Nhap du lieu
    movl $3, %eax
    movl $0, %ebx
    movl $in, %ecx
    movl $2, %edx
    int $0x80

    # Kiem so thu 5
    movb in, %al
    cmpb $'5', %al
    jl _END
    addl $1, %esi

_END:
    # Doi count qua string
    movl %esi, out
    addl $'0', out

    # Xuat ra man hinh Count (> = 5): 
    movl $str_ans_len, %edx
    movl $str_ans, %ecx
    movl $1, %ebx
    movl $4, %eax
    int $0x80

    # Xuat ra ket qua
    movl $2, %edx
    movl $out, %ecx
    movl $1, %ebx
    movl $4, %eax
    int $0x80

    # Thoat
    movl $1, %eax
    int $0x80