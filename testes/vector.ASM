        format PE

start:
int3
        mov     edi,0
        mov     ecx,0
        push    10
        push    0
        call    vector.start

        push    4
        push    1
        call    vector.start

        mov     eax,1
        int     0x80
vector.start:
        push    ebp
        mov     ebp, esp
        sub     esp,4

        mov     eax,[ebp+8]

        cmp     eax,0
        je      vector.sz
        cmp     eax,1
        je      vector.elem


vector.sz:
        cmp      ecx,0
        jne      vector.error

        mov      ecx,[ebp+12]
        mov      [ebp-4],ecx

        cmp      ecx,0
        jbe      vector.error

        mov      esp,ebp
        pop      ebp
        ret

vector.elem:
        cmp     ecx,0
        je      vector.error

        mov     ebx,[ebp+12]
        mov     dword [vector+edi*4],ebx

        inc     edi
        dec     ecx

        mov     esp,ebp
        pop     ebp
        ret

vector.error:
        mov     eax,1
        int     0x80


section 'example' data readable writeable

vector dd 0,0,0,0,0,0,0,0