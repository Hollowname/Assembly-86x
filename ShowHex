        format  PE GUI

start:
        int3
        mov      eax,8
        mov      ebx,3
        mul      ebx

        mov      ebx,3
        div      ebx
        push     eax
        call     ShowHex


; cmp é o mesmo que sub mas sem alterar o valor do register
   ;     push     example
    ;    call     toLowerCase



        push    0
        call    [ExitProcess]
ShowHex:
        ; eax, ecx, edx - may be destroyed
        push    ebp
        mov     ebp,esp
        sub     esp,12

        mov     edx,[ebp+8]

        push     ebx


        lea      ebx,[ebp-12]
        mov      ecx,8
  process:
        rol      edx,4
        mov      eax,edx
        and      eax,1111b
        mov      al,[digits+eax]
        mov      [ebx],al
        inc      ebx
        dec      ecx
        jnz      process

        pop      ebx

        lea     ecx,[ebp-12]

        xor     eax,eax
        push    eax
        push    ecx
        push    ecx
        push    eax
        call    [MessageBox]


        leave
        ret      4


section 'example' data readable writeable

digits  db '0123456789ABCDEF',0






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
                                   
