        Format  PE64 GUI

Start:

        mov     rax,2
        mov     rdx,2
        call    addi
        cmp     rbx,9h
        je      cu
        add     rbx,27h
        cu:
        push    rbx

        xor     ecx,ecx
        lea     rdx,[rsp-8]
        mov     r8,rdx
        xor     r9d,r9d
        call    [MessageBox]

        mov     ecx,0
        call    [ExitProcess]
addi:
        mov     rbx,rax
        add     rbx,rdx

        ret

section 'example' data readable writeable

digits db '0123456789abcdef',0

section '.idata' import data readable writeable

  dd 0,0,0,RVA kernel_name,RVA kernel_table
  dd 0,0,0,RVA user_name,RVA user_table
  dd 0,0,0,0,0

  kernel_table:
    ExitProcess dq RVA _ExitProcess
    dq 0
  user_table:
    MessageBox dq RVA _MessageBoxA
    dq 0

  kernel_name db 'KERNEL32.DLL',0
  user_name db 'USER32.DLL',0

  _ExitProcess dw 0
    db 'ExitProcess',0
  _MessageBoxA dw 0
    db 'MessageBoxA',0