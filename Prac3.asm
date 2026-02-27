;------------- definiciones e includes ------------------------------
.INCLUDE "m1280def.inc" ; Incluir definiciones de Registros para 1280
;.INCLUDE "m2560def.inc" ; Incluir definiciones de Registros para 2560

.equ INIT_VALUE = 0 ; Valor inicial R24

;------------- inicializar ------------------------------------------
ldi R24,INIT_VALUE
;------------- implementar ------------------------------------------
call delay20uS
call delay4mS
;call delay1S
;call myRand ; Retorna valor en R25
;------------- ciclo principal --------------------------------------
arriba: inc R24
	cpi R24,10
	breq abajo
	out PORTA,R24
	rjmp arriba

abajo: dec R24
	cpi R24,0
	breq arriba
	out PORTA,R24
	rjmp abajo
delay 20uS:
	ldi R24, 77
	nxt:
		nop
     	dec R24
     	brne nxt
	
	nop
	nop
	ret

delay 4mS:
	ldi R24, 162 ; 1
	nxt:
     	ldi r25, 98 ; n
	 	nxt2:
			dec r25 ; m*n
			brne nxt2 ; (2m-1)*n
			nop
     	dec R24; n
    	brne nxt; 2n - 1
	
	nop
	nop
	ret
