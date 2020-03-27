;Panaite Cristian

bits 32

global start        

extern exit, scanf, printf
import exit msvcrt.dll
import scanf msvcrt.dll
import printf msvcrt.dll

;Se cere sa se citeasca de la tastatura un sir de numere, date in baza 16 (se citeste de la tastatura un sir de caractere si in memorie trebuie stocat un sir de numere). Sa se afiseze valoarea zecimala a nr atat ca numere fara semn cat si ca numere cu semn.

segment data use32 class=data
    mesaj_n db "n = ", 0
    format_numar_char db '%s', 0
    format_n db "%d", 0
    mesaj_nHexa db "Introduceti un numar hexazecimal: ", 0
    format_decimal_signed db "%d", 10, 0
    format_decimal_unsigned db "%u", 10, 0
    mesaj_signed db "reprezentare cu semn : %d", 10, 0
    mesaj_unsigned db "reprezentare fara semn : %u", 10, 0
    
    n dd 0
    s dd 0
    a times 10 dd 0
      db -1
    b times 10 dd 0
    

segment code use32 class=code
    start:
        ; scanf("%d", &n)
        ; for i to n :
        ;   scanf("%s", &s)
        ;   a[i] = s
        ;   for j to len(s)
        ;       b[i] = b[i] * 10 + conversie(s[j])
        ;
        ; for i to n:
        ;   printf("%d", b[i])
        ;   printf("", b[i])
        
        push mesaj_n
        call [printf]
        add esp, 4
        
        push n
        push format_n
        call [scanf]
        add esp, 8
        
        mov ecx, [n]
        jecxz sfarsit
        mov edi, a
    first_loop:
        pushad
        push mesaj_nHexa
        call [printf]
        add esp, 4
        popad
    
        pushad
        push s
        push format_numar_char
        call [scanf]
        add esp, 8
        popad
        
        mov eax, [s]
        stosd
    
    loop first_loop
        mov ecx, [n]
        mov esi, a
    second_loop:
        pushad
        lodsd
        push eax
        push mesaj_signed
        call [printf]
        add esp, 4
        popad
        pushad
        push eax
        push mesaj_unsigned
        call [printf]
        popad
    
    loop second_loop
    sfarsit:

        push    dword 0
        call    [exit]       
