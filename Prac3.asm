;------------- definiciones e includes ------------------------------
.INCLUDE "m1280def.inc" ; Incluir definiciones de Registros para 1280
;.INCLUDE "m2560def.inc" ; Incluir definiciones de Registros para 2560

.equ INIT_VALUE = 0 ; Valor inicial R24

;------------- inicializar ------------------------------------------
ldi R24,INIT_VALUE
;------------- implementar ------------------------------------------
;call delay20uS
;call delay4mS
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
delay20uS:
	ldi R24, 77
	loop1:
		nop
     	dec R24
     	brne loop1
	
	nop
	nop
	ret

delay4mS:
	ldi R24, 162 ; 1
	loop1:
     	ldi r25, 98 ; n
	 	loop2:
			nop
			dec r25 ; m*n
			brne loop2; (2m-1)*n
     	dec R24; n
    	brne loop1; 2n - 1
	
	nop
	nop
    nop
    nop
	ret
delay1S:
    ldi R23, 144
loop3:
    ldi R24, 188
loop2:
    ldi R25, 196 
loop1:
    dec R25               
    brne loop1            
    dec R24               
    brne loop2            
    dec R23               
    brne loop3            
    
    nop                   
    nop                  
    nop                   
    nop                   
    nop                  
    nop                  
  	nop
 	nop
    
    ret

myRand:
    lsr R25              ; Desplaza R25 (el número anterior). El bit 0 cae al Carry.
    brcc fin_random      ; Si el Carry es 0, saltamos directo al final.
    
    ldi R16, 0xB8        ; Usamos R16 como auxiliar para el polinomio mágico.
    eor R25, R16         ; Hacemos el XOR directamente sobre R25.

fin_random:
    ret

