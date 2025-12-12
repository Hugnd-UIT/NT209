.section .data
    str_enter: .string "Enter a string (<255 chars): "
    str_enter_len = . - str_enter

.section .bss
    .lcomm input, 256
    .lcomm flag_space, 4

.section .text
    .globl _start

_start:
    # In thông báo
    movl $4, %eax
    movl $1, %ebx
    movl $str_enter, %ecx
    movl $str_enter_len, %edx
    int $0x80

    # Đọc chuỗi
    movl $3, %eax
    movl $0, %ebx
    movl $input, %ecx
    movl $256, %edx
    int $0x80

    # Khởi tạo
    movl $input, %esi
    movl $1, flag_space      

_Loop:

    # Kiem tra co phai ki tu xuong dong khong
    movb (%esi), %al
    cmpb $'\n', %al          
    je done

    # Kiem tra co phai dau cach khong
    cmpb $' ', %al
    jne _Not_space
    movl $1, flag_space
    jmp _Next

_Not_space:

    # Kiem tra co phai chu hay khong
    cmpb $'A', %al
    jb _Next
    cmpb $'z', %al
    ja _Next

    # Neu la chu thi lower
    cmpb $'Z', %al
    jle _Lower
    jmp _Check_Capitalize

_Lower:

    # Chuyen sang kí tu thuong
    addb $32, %al            
    jmp _Check_Capitalize

_Check_Capitalize:

    # Kiem tra co phai chu dau khong
    movl flag_space, %ebx
    cmpl $1, %ebx
    jne _Store

    # Neu la chu dau thi viet hoa
    movl $0, flag_space
    cmpb $'a', %al
    jb _Store
    cmpb $'z', %al
    ja _Store
    subb $32, %al          

_Store:
    movb %al, (%esi)

_Next:
    incl %esi
    jmp _Loop

done:
    # In kết quả
    movl $4, %eax
    movl $1, %ebx
    movl $input, %ecx
    movl $256, %edx
    int $0x80

    # Thoát
    movl $1, %eax
    int $0x80
