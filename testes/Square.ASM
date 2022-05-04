        format  PE
start:
 push   214
 call   square
 add    esp,4



square:
 push   ebp
 mov    ebp,esp

 mov    eax,[ebp+8]

op:
 imul   eax,eax
 mov    esp,ebp
 pop    ebp