 format PE

start:
     int3
     mov        eax,10
     mov        edx,2
     call       divi

        push    0
        push    eax
        push    eax
        push    0
        call    [MessageBox]

exit:
     push       0
     call       [ExitProcess]

addi:
     add        eax,ebx
     ret

subi:
     sub        eax,ebx
     ret

mult:
     mul       ebx
     ret

divi:
     div       edx
     ret

section '.idata' import data readable writeable

  dd 0,0,0,RVA kernel_name,RVA kernel_table
  dd 0,0,0,RVA user_name,RVA user_table
  dd 0,0,0,0,0

  kernel_table:
    ExitProcess dd RVA _ExitProcess
    dd 0
  user_table:
    MessageBox dd RVA _MessageBoxA
    dd 0

  kernel_name db 'KERNEL32.DLL',0
  user_name db 'USER32.DLL',0

  _ExitProcess dw 0
    db 'ExitProcess',0
  _MessageBoxA dw 0
    db 'MessageBoxA',0