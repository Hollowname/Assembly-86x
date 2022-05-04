format PE64 GUI

start:
        mov     rax,4324
        mov     rdx,2
        call    addi
        xor     rax,rax
        xor     rdx,rdx

        sub     rsp,4*8+8
        mov     rcx,rbx
        xor     rbx,rbx
        call    ShowHex

        mov     ecx,0
        call    [ExitProcess]

addi:
        mov     rbx,rax
        add     rbx,rdx

        ret

ShowHex:

        push    rbp
        mov     rbp,rsp
        sub     rsp,(2*16)+4*8
       ;rax, rcx, rdx, r8, r9, r10, r11 - may be destroyed
                  ; [rdp-16] - local data
                  ; [rbp] - stored edp
                  ; [rbp+8] - return address
        mov     rdx,rcx

        lea      r10,[rbp-16]
        mov      rcx,28
  process:
        mov      rax,rdx
        shr      rax,cl
        and      eax,1111b
        mov      al,[digits+rax]
        mov      [r10],al
        inc      r10
        sub      ecx,4
        jnc      process
        mov      byte [r10],0


        lea     ecx,[ebp-16]

        xor     ecx,ecx
        lea     rdx,[rbp-16]
        mov     r8,rdx
        xor     r9d,r9d
        call    [MessageBox]


        leave
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