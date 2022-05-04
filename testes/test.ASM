        format PE

int3
        mov     ecx,15
        cmp     ecx,14
        jg      bunda
        xor     ecx,ecx
        bunda:
        add     ecx,1
