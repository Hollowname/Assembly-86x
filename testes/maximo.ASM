format PE GUI

start:
int3
 mov    edi,0
 mov    eax,dword [datas1+edi*4]
 mov    ebx,eax
 mov    ecx,0
start_loop:
 cmp    eax,ecx
 je     end_loop
 inc    edi
 mov    eax,dword [datas1+edi*4]
 cmp    eax,ebx
 jbe    start_loop
 mov    ebx,eax
 jmp    start_loop

loop_loop:
 mov    ebx,eax
 jmp    start_loop

end_loop:
 inc    edi
 mov    eax,dword [datas1+edi*4]
 cmp    eax,1
 je     loop_loop

 mov    eax,1
 int    0x80

section 'example' data readable writeable

datas1 dd 1,2,3,4,5,30,5,0

datas2 dd 1,2,3,4,5,29,5,0

datas3 dd 1,2,3,4,5,28,5,0