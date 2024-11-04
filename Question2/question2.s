;******************** (C) Yifeng ZHU *******************************************
; @file    main.s
; @author  Yifeng Zhu
; @date    May-17-2015
; @note
;           This code is for the book "Embedded Systems with ARM Cortex-M 
;           Microcontrollers in Assembly Language and C, Yifeng Zhu, 
;           ISBN-13: 978-0982692639, ISBN-10: 0982692633
; @attension
;           This code is provided for education purpose. The author shall not be 
;           held liable for any direct, indirect or consequential damages, for any 
;           reason whatever. More information can be found from book website: 
;           http:;www.eece.maine.edu/~zhu/book
;*******************************************************************************


		INCLUDE core_cm4_constants.s		; Load Constant Definitions
		INCLUDE stm32l476xx_constants.s      
		
		AREA question2, CODE, READONLY
		EXPORT __main
		ALIGN 
		ENTRY

__main PROC
	
start   LDR R0, =Array
		LDR R1, =col 
		LDR R2, =row
		LDR R3, =first  ;degistirilmek istenen ilk sütun
		LDR R4, =second
		MOV R5, #4		;int deger oldugu icin
		LDR R3,[R3]   ;r3 ün degerini aldik r0a ekleyip güncel adresimiz haline getiriyoruz
		LDR R4,[R4]   ; aynisi r4 icin
		LDR R2,[R2]
		LDR R1,[R1]
		MLA R3, R3, R5, R0
		MLA R4, R4, R5, R0
		MUL R1, R1, R5  ;her for sonunda 1 sütun eklemek icin
		MOV R6, #0   ;looptaki i degerimiz satir sayisi kadar dönecek
		
		
loop    LDR R7, [R3]   ;ilk sütunun degeri alinir
		LDR R8, [R4]
		STR R7, [R4]   ;ikinci sütuna atilir
		STR R8, [R3]
		ADD R3, R3, R1   ;bi alt satira gecti
		ADD R4, R4, R1 
		ADD R6, R6, #1
		CMP R6, R2
		BNE loop
		
		
		
		ENDP 

		AREA myData, DATA , READWRITE
		ALIGN
Array   DCD 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
col 	DCD 3
row		DCD 5
first	DCD 1
second 	DCD 2

		


		END