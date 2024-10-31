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
		
		AREA string_copy, CODE, READONLY
		EXPORT __main
		ALIGN 
		ENTRY
func PROC
			LDR R2, [R1]
			CMP R2, #0
			BEQ return
			AND R4, R2, R0   ;
			CMP R4, #0   ; R4 UN IÇINDE SIFIR VAR MI YOK MU 
			ADDNE R5, R5, #1
			ADD R1, R1, #4
			B func
			
					 
return		AND R5, R5, #1
			BX LR
			ENDP
				
__main PROC
	
			LDR R1, =input
			LDR R1, [R1]
			LSR R0, R1, #4
			LSL R0, R0, #5
			AND R2, R1, #14
			ADD R0, R2, R0
			AND R2, R1, #1
			LSL R0, R0, #1
			ADD R0, R2, R0
			LSL R0, R0, #3
			
			MOV R5, #0
			LDR R1, =peight 
			BL func
			ADD R0, R0, R5, LSL #8
			
			MOV R5, #0
			LDR R1, =pfour
			BL func
			ADD R0, R0, R5, LSL #4
			
			MOV R5, #0
			LDR R1, =ptwo
			BL func
			ADD R0, R0, R5, LSL #2
			
			MOV R5, #0
			LDR R1, =pone
			BL func
			ADD R0, R0, R5, LSL #1 
			
			MOV R5, #0
			LDR R1, =pzero
			BL func
			ADD R0, R0, R5
			ADD R0, R0, #0
			
		ENDP 

		AREA myData, DATA, READWRITE 
		ALIGN
input		DCD 10
peight		DCD 512,1024,2048,4096,0
pfour		DCD 32,64,128,4096,0
ptwo		DCD 8,64,128,1024,2048,0
pone		DCD 8,32,128,512,2048,0
pzero		DCD 2,4,8,16,32,64,128,256,512,1024,2048,4096,0





		END 
