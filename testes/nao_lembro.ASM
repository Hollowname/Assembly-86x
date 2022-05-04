        format PE
_start:
int3
 push   3
 push   2
 call   power
 add    esp,0x8

 push   eax

 push   2
 push   5
 call   power
 add    esp,0x8

 pop    ebx
 add    ebx,eax

 mov    eax,0x1
 int    0x80


power:
 push   ebp
 mov    ebp,esp
 sub    esp,4

 mov    ebx,[ebp+8]
 mov    ecx,[ebp+12]
 mov    [ebp-4],ebx

power_loop:
 cmp    ecx,1
 je     power_end
 mov    eax,[ebp-4]
 imul   eax,ebx
 mov    [ebp-4],eax
 dec    ecx
 jmp    power_loop

power_end:
 mov    eax,[ebp-4]
 mov    esp,ebp
 pop    ebp
 ret