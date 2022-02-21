  format PE
start:
int3
push    10
call    fatorial_reC  ; Esse leva para o recursivo
add     esp,4

push    eax

mov     ebx,eax

mov     eax,1
int 0x80
;  Começo do fatorial recursivo
fatorial_rec:
push    ebp
mov     ebp,esp
sub     esp,4

mov     ecx,[ebp+8]
;mov     [ebp-4],ecx

call    start_rec

end:
mov     esp,ebp
pop     ebp
ret

start_rec:
cmp      ecx,1
je       rec_1

dec      ecx  ; ecx é diminuido em 1 até chegar no valor minimo 1
call     start_rec
inc      ecx  ; ecx volta ao valor original antes de entrar na recursão

imul     eax,ecx
ret

rec_1:        ; Os calculos do fatorial só começam quando ecx chega em 1
mov     eax,1 ; eax é a variavel do resultado do fatorial
ret
; fim do recursivo, começo do padrão

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
