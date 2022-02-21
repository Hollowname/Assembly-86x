  format PE
start:
int3
push    10
call    fatorial_rec
add     esp,4

push    eax

mov     ebx,eax

mov     eax,1
int 0x80

fatorial_rec:
push    ebp
mov     ebp,esp
sub     esp,4

mov     ecx,[ebp+8]
;mov     [ebp-4],ecx

call    start_rec

mov     esp,ebp
pop     ebp
ret



start_rec:
cmp      ecx,1
je       rec_1

dec      ecx
call     start_rec
inc      ecx

imul     eax,ecx
ret

rec_1:
mov     eax,1
ret


fatorial:
push    ebp
mov     ebp,esp
sub     esp,4

mov     ecx,[ebp+8]
mov     [ebp-4],ecx

start_loop:
cmp     ecx,1
je      fat_end

dec     ecx

mov     eax,[ebx-4]
imul    eax,ecx
mov     [ebp-4],eax
jmp     start_loop

fat_end:
mov     eax,[ebx-4]
mov     esp,ebp
pop     ebp
ret                            
