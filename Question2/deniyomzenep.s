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
		
		AREA question1, CODE, READONLY
		EXPORT __main
		ALIGN 
		ENTRY

__main PROC
	
start	LDR R1, =a
		LDR R1, [R1]
		LDR R2, =n
		LDR R2, [R2]
		MOV R3, #10
		MOV R4, R1
		MOV R5, #10 ;SABIT ON
		
		
		
bas_bul SDIV R4, R4, R5
		CMP R4, #0
		BLE exit_bas_bul
		MUL R3, R3, R5
		B bas_bul
		
exit_bas_bul

		MOV R4, R1
		MOV R0, R1
		MOV R5, R1
		SUB R2, R2, #1
		

func	CMP R2, #0 
		BEQ exit 
		MUL R5, R3, R5
		ADD R6, R4, R5 
		ADD R0, R0, R6
		MOV R4, R6
		SUB R2, R2, #1
		B func
		
exit
		
		
		
		
		
		
		ENDP 

		AREA myData, DATA , READWRITE
		ALIGN
a		DCD 10
n 		DCD 1

		


		END