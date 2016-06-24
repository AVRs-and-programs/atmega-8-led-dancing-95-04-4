
_RndBig:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,48 :: 		dim div2 as word
;MyProject.mbas,55 :: 		if top > 32767 then
	LDI        R16, 255
	LDI        R17, 127
	CP         R16, R4
	CPC        R17, R5
	BRLO       L__RndBig278
	JMP        L__RndBig2
L__RndBig278:
;MyProject.mbas,57 :: 		mult = 2
	JMP        L__RndBig3
;MyProject.mbas,58 :: 		else
L__RndBig2:
;MyProject.mbas,61 :: 		end if
L__RndBig3:
;MyProject.mbas,77 :: 		result = localword
; Result start address is: 18 (R18)
	LDD        R18, Y+0
	LDD        R19, Y+1
;MyProject.mbas,78 :: 		end sub
	MOVW       R16, R18
; Result end address is: 18 (R18)
L_end_RndBig:
	ADIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _RndBig

_Lcd_0:

;MyProject.mbas,80 :: 		sub procedure Lcd_0()
;MyProject.mbas,81 :: 		Lcd_Init()
	PUSH       R2
	CALL       _Lcd_Init+0
;MyProject.mbas,82 :: 		Lcd_Cmd(_LCD_CLEAR)               ' Clear display
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,83 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)          ' Cursor off
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,85 :: 		end sub
L_end_Lcd_0:
	POP        R2
	RET
; end of _Lcd_0

_Move_Delay:

;MyProject.mbas,87 :: 		sub procedure Move_Delay()            ' Function used for text moving
;MyProject.mbas,88 :: 		mode=1
	LDI        R27, 1
	STS        _mode+0, R27
	LDI        R27, 0
	STS        _mode+1, R27
;MyProject.mbas,91 :: 		Delay_ms(200)                       ' You can change the moving speed here
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L__Move_Delay10:
	DEC        R16
	BRNE       L__Move_Delay10
	DEC        R17
	BRNE       L__Move_Delay10
	DEC        R18
	BRNE       L__Move_Delay10
	NOP
;MyProject.mbas,97 :: 		Delay_ms(100)                       ' You can change the moving speed here
L__Move_Delay6:
;MyProject.mbas,99 :: 		end sub
L_end_Move_Delay:
	RET
; end of _Move_Delay

_strToInt1:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 28
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,105 :: 		tempCh as char
;MyProject.mbas,106 :: 		output = 0  ex=0
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	PUSH       R9
	LDI        R27, 0
	STS        _output+0, R27
	STS        _output+1, R27
	LDI        R27, 0
	STD        Y+6, R27
	STD        Y+7, R27
;MyProject.mbas,107 :: 		i = 1  stringLength = strlen(st)  temp = 0   numberLength = 0
	LDI        R27, 1
	STD        Y+8, R27
	LDI        R27, 0
	STD        Y+9, R27
	LDI        R27, #lo_addr(_st+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R3, R27
	CALL       _strlen+0
; stringLength start address is: 25 (R25)
	MOV        R25, R16
	MOV        R26, R17
	LDI        R27, 0
	STD        Y+2, R27
	STD        Y+3, R27
;MyProject.mbas,109 :: 		for j = 0 to stringLength-1
	LDI        R27, 0
	STD        Y+4, R27
	STD        Y+5, R27
; stringLength end address is: 25 (R25)
L__strToInt128:
; stringLength start address is: 25 (R25)
	MOV        R21, R25
	MOV        R22, R26
	SUBI       R21, 1
	SBCI       R22, 0
	LDD        R16, Y+4
	LDD        R17, Y+5
	CP         R21, R16
	CPC        R22, R17
	BRGE       L__strToInt1282
	JMP        L__strToInt132
L__strToInt1282:
;MyProject.mbas,111 :: 		tempCh = st[j]
	LDI        R18, #lo_addr(_st+0)
	LDI        R19, hi_addr(_st+0)
	LDD        R16, Y+4
	LDD        R17, Y+5
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LD         R18, Z
;MyProject.mbas,112 :: 		temp = tempCh - 48
	MOV        R16, R18
	LDI        R17, 0
	SUBI       R16, 48
	SBCI       R17, 0
	STD        Y+0, R16
	STD        Y+1, R17
;MyProject.mbas,113 :: 		if   tempCh =46 then
	CPI        R18, 46
	BREQ       L__strToInt1283
	JMP        L__strToInt134
L__strToInt1283:
;MyProject.mbas,114 :: 		ex=1
	LDI        R27, 1
	STD        Y+6, R27
	LDI        R27, 0
	STD        Y+7, R27
L__strToInt134:
;MyProject.mbas,116 :: 		if (temp >= 0) and ( temp <= 9) and (ex=0)  then
	LDD        R19, Y+0
	LDD        R20, Y+1
	LDI        R16, 0
	LDI        R17, 0
	CP         R19, R16
	CPC        R20, R17
	LDI        R18, 0
	BRLT       L__strToInt1284
	LDI        R18, 255
L__strToInt1284:
	LDI        R16, 9
	LDI        R17, 0
	CP         R16, R19
	CPC        R17, R20
	LDI        R27, 0
	BRLT       L__strToInt1285
	LDI        R27, 255
L__strToInt1285:
	MOV        R16, R27
	AND        R18, R16
	LDD        R16, Y+6
	LDD        R17, Y+7
	CPI        R17, 0
	BRNE       L__strToInt1286
	CPI        R16, 0
L__strToInt1286:
	LDI        R27, 0
	BRNE       L__strToInt1287
	LDI        R27, 255
L__strToInt1287:
	MOV        R16, R27
	AND        R16, R18
	BRNE       L__strToInt1288
	JMP        L__strToInt137
L__strToInt1288:
;MyProject.mbas,118 :: 		inc(numberLength)
	LDD        R16, Y+2
	LDD        R17, Y+3
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+2, R16
	STD        Y+3, R17
L__strToInt137:
;MyProject.mbas,120 :: 		next j
	LDD        R16, Y+4
	LDD        R17, Y+5
	CP         R16, R21
	CPC        R17, R22
	BRNE       L__strToInt1289
	JMP        L__strToInt132
L__strToInt1289:
	LDD        R16, Y+4
	LDD        R17, Y+5
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+4, R16
	STD        Y+5, R17
; stringLength end address is: 25 (R25)
	JMP        L__strToInt128
L__strToInt132:
;MyProject.mbas,123 :: 		for j = 0 to numberLength-1
	LDI        R27, 0
	STD        Y+4, R27
	STD        Y+5, R27
L__strToInt139:
	LDD        R18, Y+2
	LDD        R19, Y+3
	SUBI       R18, 1
	SBCI       R19, 0
	STD        Y+26, R18
	STD        Y+27, R19
	LDD        R16, Y+4
	LDD        R17, Y+5
	CP         R18, R16
	CPC        R19, R17
	BRGE       L__strToInt1290
	JMP        L__strToInt143
L__strToInt1290:
;MyProject.mbas,125 :: 		tempCh = st[j]
	LDI        R18, #lo_addr(_st+0)
	LDI        R19, hi_addr(_st+0)
	LDD        R16, Y+4
	LDD        R17, Y+5
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LD         R16, Z
;MyProject.mbas,126 :: 		temp = tempCh - 48
	MOV        R19, R16
	LDI        R20, 0
	SUBI       R19, 48
	SBCI       R20, 0
	STD        Y+0, R19
	STD        Y+1, R20
;MyProject.mbas,127 :: 		if (temp >= 0) and (temp <= 9)  then
	LDI        R16, 0
	LDI        R17, 0
	CP         R19, R16
	CPC        R20, R17
	LDI        R18, 0
	BRLT       L__strToInt1291
	LDI        R18, 255
L__strToInt1291:
	LDI        R16, 9
	LDI        R17, 0
	CP         R16, R19
	CPC        R17, R20
	LDI        R27, 0
	BRLT       L__strToInt1292
	LDI        R27, 255
L__strToInt1292:
	MOV        R16, R27
	AND        R16, R18
	BRNE       L__strToInt1293
	JMP        L__strToInt145
L__strToInt1293:
;MyProject.mbas,129 :: 		output =output +  temp * pow(10, (numberLength-i))
	LDD        R0, Y+8
	LDD        R1, Y+9
	LDI        R27, 0
	SBRC       R1, 7
	LDI        R27, 255
	LDD        R16, Y+2
	LDD        R17, Y+3
	LDI        R18, 0
	SBRC       R17, 7
	LDI        R18, 255
	MOV        R19, R18
	SUB        R16, R0
	SBC        R17, R1
	SBC        R18, R27
	SBC        R19, R27
	CALL       _float_slong2fp+0
	MOVW       R6, R16
	MOVW       R8, R18
	LDI        R27, 0
	MOV        R2, R27
	MOV        R3, R27
	LDI        R27, 32
	MOV        R4, R27
	LDI        R27, 65
	MOV        R5, R27
	CALL       _pow+0
	STD        Y+22, R16
	STD        Y+23, R17
	STD        Y+24, R18
	STD        Y+25, R19
	LDD        R16, Y+0
	LDD        R17, Y+1
	LDI        R18, 0
	SBRC       R17, 7
	LDI        R18, 255
	MOV        R19, R18
	CALL       _float_slong2fp+0
	LDD        R20, Y+22
	LDD        R21, Y+23
	LDD        R22, Y+24
	LDD        R23, Y+25
	CALL       _float_fpmul1+0
	STD        Y+22, R16
	STD        Y+23, R17
	STD        Y+24, R18
	STD        Y+25, R19
	LDS        R16, _output+0
	LDS        R17, _output+1
	LDI        R18, 0
	SBRC       R17, 7
	LDI        R18, 255
	MOV        R19, R18
	CALL       _float_slong2fp+0
	LDD        R20, Y+22
	LDD        R21, Y+23
	LDD        R22, Y+24
	LDD        R23, Y+25
	CALL       _float_fpadd1+0
	CALL       _float_fpint+0
	STS        _output+0, R16
	STS        _output+1, R17
;MyProject.mbas,130 :: 		i=i+1
	LDD        R16, Y+8
	LDD        R17, Y+9
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+8, R16
	STD        Y+9, R17
L__strToInt145:
;MyProject.mbas,133 :: 		next j
	LDD        R18, Y+4
	LDD        R19, Y+5
	LDD        R16, Y+26
	LDD        R17, Y+27
	CP         R18, R16
	CPC        R19, R17
	BRNE       L__strToInt1294
	JMP        L__strToInt143
L__strToInt1294:
	LDD        R16, Y+4
	LDD        R17, Y+5
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+4, R16
	STD        Y+5, R17
	JMP        L__strToInt139
L__strToInt143:
;MyProject.mbas,135 :: 		end sub
L_end_strToInt1:
	POP        R9
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 27
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _strToInt1

_PWM_MAKE_as_max:

;MyProject.mbas,139 :: 		jjyear as float
;MyProject.mbas,141 :: 		jjyear=ceil((jj*max_duty)/100)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	MOVW       R16, R2
	LDI        R18, 0
	SBRC       R3, 7
	LDI        R18, 255
	MOV        R19, R18
	MOVW       R20, R4
	LDI        R22, 0
	SBRC       R5, 7
	LDI        R22, 255
	MOV        R23, R22
	CALL       _HWMul_32x32+0
	CALL       _float_slong2fp+0
	LDI        R20, 0
	LDI        R21, 0
	LDI        R22, 200
	LDI        R23, 66
	CALL       _float_fpdiv1+0
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _ceil+0
;MyProject.mbas,142 :: 		FloatToStr(jjyear, st)
	LDI        R27, #lo_addr(_st+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R7, R27
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _FloatToStr+0
;MyProject.mbas,147 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,149 :: 		strToInt1()
	CALL       _strToInt1+0
;MyProject.mbas,151 :: 		IntToStr(ii, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _output+0
	LDS        R3, _output+1
	CALL       _IntToStr+0
;MyProject.mbas,152 :: 		Lcd_Out(1,1,st)
	LDI        R27, #lo_addr(_st+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,153 :: 		Lcd_Out(2,1,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,154 :: 		Delay_mS(1000)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__PWM_MAKE_as_max48:
	DEC        R16
	BRNE       L__PWM_MAKE_as_max48
	DEC        R17
	BRNE       L__PWM_MAKE_as_max48
	DEC        R18
	BRNE       L__PWM_MAKE_as_max48
;MyProject.mbas,155 :: 		end sub
L_end_PWM_MAKE_as_max:
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _PWM_MAKE_as_max

_PWM_MAKE:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,159 :: 		jjyear as float
;MyProject.mbas,161 :: 		jjyear=ceil((jj*max_duty)/100)
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	MOVW       R16, R2
	LDI        R18, 0
	SBRC       R3, 7
	LDI        R18, 255
	MOV        R19, R18
	MOVW       R20, R4
	LDI        R22, 0
	SBRC       R5, 7
	LDI        R22, 255
	MOV        R23, R22
	CALL       _HWMul_32x32+0
	CALL       _float_slong2fp+0
	PUSH       R7
	PUSH       R6
	PUSH       R3
	PUSH       R2
	LDI        R20, 0
	LDI        R21, 0
	LDI        R22, 200
	LDI        R23, 66
	CALL       _float_fpdiv1+0
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _ceil+0
;MyProject.mbas,162 :: 		FloatToStr(jjyear, st)
	LDI        R27, #lo_addr(_st+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R7, R27
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _FloatToStr+0
;MyProject.mbas,169 :: 		strToInt1()
	CALL       _strToInt1+0
;MyProject.mbas,170 :: 		ii =output
	LDS        R16, _output+0
	LDS        R17, _output+1
	STD        Y+0, R16
	STD        Y+1, R17
;MyProject.mbas,171 :: 		IntToStr(ii, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _output+0
	LDS        R3, _output+1
	CALL       _IntToStr+0
;MyProject.mbas,172 :: 		Lcd_Out(1,1,st)
	LDI        R27, #lo_addr(_st+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,173 :: 		Lcd_Out(2,6,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 6
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
;MyProject.mbas,174 :: 		IntToStr(jj, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	CALL       _IntToStr+0
;MyProject.mbas,175 :: 		Lcd_Out(2,1,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R6
	POP        R7
;MyProject.mbas,179 :: 		case 1
	LDI        R27, 0
	CP         R7, R27
	BRNE       L__PWM_MAKE297
	LDI        R27, 1
	CP         R6, R27
L__PWM_MAKE297:
	BREQ       L__PWM_MAKE298
	JMP        L__PWM_MAKE54
L__PWM_MAKE298:
;MyProject.mbas,182 :: 		PWM16bit_Change_Duty(ii, _TIMER1_CH_A )
	LDI        R27, 17
	MOV        R4, R27
	LDD        R2, Y+0
	LDD        R3, Y+1
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE51
L__PWM_MAKE54:
;MyProject.mbas,183 :: 		case 2
	LDI        R27, 0
	CP         R7, R27
	BRNE       L__PWM_MAKE299
	LDI        R27, 2
	CP         R6, R27
L__PWM_MAKE299:
	BREQ       L__PWM_MAKE300
	JMP        L__PWM_MAKE57
L__PWM_MAKE300:
;MyProject.mbas,184 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,186 :: 		PWM16bit_Change_Duty( ii, _TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	LDD        R2, Y+0
	LDD        R3, Y+1
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE51
L__PWM_MAKE57:
;MyProject.mbas,187 :: 		case 3
	LDI        R27, 0
	CP         R7, R27
	BRNE       L__PWM_MAKE301
	LDI        R27, 3
	CP         R6, R27
L__PWM_MAKE301:
	BREQ       L__PWM_MAKE302
	JMP        L__PWM_MAKE60
L__PWM_MAKE302:
;MyProject.mbas,190 :: 		PWM2_Set_Duty(ii)
	LDD        R2, Y+0
	CALL       _PWM2_Set_Duty+0
	JMP        L__PWM_MAKE51
L__PWM_MAKE60:
L__PWM_MAKE51:
;MyProject.mbas,193 :: 		end sub
L_end_PWM_MAKE:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _PWM_MAKE

_SetPWM0:

;MyProject.mbas,194 :: 		sub procedure SetPWM0(dim duty as integer)
;MyProject.mbas,197 :: 		OCR2=duty
	OUT        OCR2+0, R2
;MyProject.mbas,198 :: 		end sub
L_end_SetPWM0:
	RET
; end of _SetPWM0

_PROGRAM1:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 15
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,200 :: 		sub procedure PROGRAM1 (DIM J,dl AS integer)
;MyProject.mbas,202 :: 		Lcd_0()
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	POP        R2
	POP        R3
;MyProject.mbas,206 :: 		do
L__PROGRAM163:
;MyProject.mbas,210 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,211 :: 		PWM16bit_Change_Duty(j, _TIMER1_CH_A )
	PUSH       R5
	PUSH       R4
	LDI        R27, 17
	MOV        R4, R27
	CALL       _PWM16bit_Change_Duty+0
;MyProject.mbas,212 :: 		PWM16bit_Change_Duty(0, _TIMER1_CH_B )
	PUSH       R3
	PUSH       R2
	LDI        R27, 18
	MOV        R4, R27
	CLR        R2
	CLR        R3
	CALL       _PWM16bit_Change_Duty+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
;MyProject.mbas,213 :: 		SetPWM0(-1)
	PUSH       R3
	PUSH       R2
	LDI        R27, 255
	MOV        R2, R27
	MOV        R3, R27
	CALL       _SetPWM0+0
	POP        R2
	POP        R3
;MyProject.mbas,214 :: 		inc(J)
	MOVW       R16, R2
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
;MyProject.mbas,216 :: 		lcd_out(1,1," _TIMER1_CH_A ")
	MOVW       R30, R28
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 65
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
;MyProject.mbas,217 :: 		inttostr(j,txt)
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	CALL       _IntToStr+0
;MyProject.mbas,218 :: 		lcd_out(2,5,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 5
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
;MyProject.mbas,225 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R2, R16
	CPC        R3, R17
	BRLT       L__PROGRAM1305
	JMP        L__PROGRAM166
L__PROGRAM1305:
	JMP        L__PROGRAM163
L__PROGRAM166:
;MyProject.mbas,226 :: 		end sub
L_end_PROGRAM1:
	ADIW       R28, 14
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _PROGRAM1

_PROGRAM2:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 15
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,229 :: 		sub procedure PROGRAM2 (DIM J,dl AS integer)
;MyProject.mbas,232 :: 		Lcd_0()
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	POP        R2
	POP        R3
;MyProject.mbas,233 :: 		do
L__PROGRAM269:
;MyProject.mbas,236 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,238 :: 		PWM16bit_Change_Duty(0, _TIMER1_CH_A )
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 17
	MOV        R4, R27
	CLR        R2
	CLR        R3
	CALL       _PWM16bit_Change_Duty+0
	POP        R2
	POP        R3
;MyProject.mbas,239 :: 		PWM16bit_Change_Duty(J, _TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	CALL       _PWM16bit_Change_Duty+0
	POP        R4
	POP        R5
;MyProject.mbas,240 :: 		SetPWM0(-1)
	PUSH       R3
	PUSH       R2
	LDI        R27, 255
	MOV        R2, R27
	MOV        R3, R27
	CALL       _SetPWM0+0
	POP        R2
	POP        R3
;MyProject.mbas,242 :: 		lcd_out(1,1," _TIMER1_CH_B ")
	MOVW       R30, R28
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 66
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
;MyProject.mbas,243 :: 		inttostr(j,txt)
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	CALL       _IntToStr+0
;MyProject.mbas,244 :: 		lcd_out(2,5,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 5
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
;MyProject.mbas,245 :: 		inc(J)
	MOVW       R18, R2
	SUBI       R18, 255
	SBCI       R19, 255
	MOVW       R2, R18
;MyProject.mbas,246 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__PROGRAM2307
	JMP        L__PROGRAM272
L__PROGRAM2307:
	JMP        L__PROGRAM269
L__PROGRAM272:
;MyProject.mbas,247 :: 		end sub
L_end_PROGRAM2:
	ADIW       R28, 14
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _PROGRAM2

_PROGRAM3:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 15
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,251 :: 		sub procedure PROGRAM3 (DIM J,dl AS integer)
;MyProject.mbas,253 :: 		do
L__PROGRAM375:
;MyProject.mbas,254 :: 		PWM16bit_Change_Duty( 0, _TIMER1_CH_A )
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 17
	MOV        R4, R27
	CLR        R2
	CLR        R3
	CALL       _PWM16bit_Change_Duty+0
;MyProject.mbas,255 :: 		PWM16bit_Change_Duty( 0, _TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	CLR        R2
	CLR        R3
	CALL       _PWM16bit_Change_Duty+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
;MyProject.mbas,257 :: 		SetPWM0(j)    ''b channal
	CALL       _SetPWM0+0
;MyProject.mbas,258 :: 		Lcd_0()
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
;MyProject.mbas,259 :: 		lcd_out(1,1," _TIMER1_CH_A ")
	MOVW       R30, R28
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 65
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
;MyProject.mbas,260 :: 		inttostr(j,txt)
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	CALL       _IntToStr+0
;MyProject.mbas,261 :: 		lcd_out(2,5,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 5
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,262 :: 		lcd_out(1,1,"Pwm2 ")
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 50
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,263 :: 		inttostr(150,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 150
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;MyProject.mbas,264 :: 		lcd_out(2,5,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 5
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
;MyProject.mbas,265 :: 		inc(J)
	MOVW       R18, R2
	SUBI       R18, 255
	SBCI       R19, 255
	MOVW       R2, R18
;MyProject.mbas,266 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__PROGRAM3309
	JMP        L__PROGRAM378
L__PROGRAM3309:
	JMP        L__PROGRAM375
L__PROGRAM378:
;MyProject.mbas,267 :: 		end sub
L_end_PROGRAM3:
	ADIW       R28, 14
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _PROGRAM3

_PROGRAM4:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 13
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,270 :: 		sub procedure PROGRAM4 (DIM J,dl AS integer)
;MyProject.mbas,271 :: 		P=J
	STS        _p+0, R2
	STS        _p+1, R3
;MyProject.mbas,273 :: 		p=255-j
	LDI        R16, 255
	LDI        R17, 0
	SUB        R16, R2
	SBC        R17, R3
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,274 :: 		Lcd_0()
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	POP        R2
	POP        R3
;MyProject.mbas,275 :: 		do
L__PROGRAM481:
;MyProject.mbas,277 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,280 :: 		PWM16bit_Change_Duty(j, _TIMER1_CH_A )
	PUSH       R5
	PUSH       R4
	LDI        R27, 17
	MOV        R4, R27
	CALL       _PWM16bit_Change_Duty+0
;MyProject.mbas,281 :: 		PWM16bit_Change_Duty( p, _TIMER1_CH_B )
	PUSH       R3
	PUSH       R2
	LDI        R27, 18
	MOV        R4, R27
	LDS        R2, _p+0
	LDS        R3, _p+1
	CALL       _PWM16bit_Change_Duty+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
;MyProject.mbas,282 :: 		SetPWM0(-1)
	PUSH       R3
	PUSH       R2
	LDI        R27, 255
	MOV        R2, R27
	MOV        R3, R27
	CALL       _SetPWM0+0
	POP        R2
	POP        R3
;MyProject.mbas,283 :: 		lcd_out(1,1,"TIMER1_CH_A ")
	MOVW       R30, R28
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 65
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
;MyProject.mbas,284 :: 		inttostr(j,txt)
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	CALL       _IntToStr+0
;MyProject.mbas,285 :: 		lcd_out(1,11,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,286 :: 		inttostr(p,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _p+0
	LDS        R3, _p+1
	CALL       _IntToStr+0
;MyProject.mbas,287 :: 		lcd_out(2,1,"TIMER1_CH_B ")
	MOVW       R30, R28
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 82
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 72
	ST         Z+, R27
	LDI        R27, 95
	ST         Z+, R27
	LDI        R27, 66
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,288 :: 		lcd_out(2,11,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,289 :: 		lcd_out(1,1,"Pwm2 ")
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 50
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,290 :: 		inttostr(150,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 150
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;MyProject.mbas,291 :: 		lcd_out(2,5,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 5
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
;MyProject.mbas,292 :: 		inc(J)
	MOVW       R18, R2
	SUBI       R18, 255
	SBCI       R19, 255
	MOVW       R2, R18
;MyProject.mbas,293 :: 		dec(p)
	LDS        R16, _p+0
	LDS        R17, _p+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,300 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__PROGRAM4311
	JMP        L__PROGRAM484
L__PROGRAM4311:
	JMP        L__PROGRAM481
L__PROGRAM484:
;MyProject.mbas,301 :: 		end sub
L_end_PROGRAM4:
	ADIW       R28, 12
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _PROGRAM4

_PROGRAM5:

;MyProject.mbas,304 :: 		sub procedure PROGRAM5 (DIM J,dl AS integer)
;MyProject.mbas,305 :: 		P=J
	STS        _p+0, R2
	STS        _p+1, R3
;MyProject.mbas,307 :: 		p=255-j
	LDI        R16, 255
	LDI        R17, 0
	SUB        R16, R2
	SBC        R17, R3
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,308 :: 		do
L__PROGRAM587:
;MyProject.mbas,309 :: 		inc(J)
	MOVW       R16, R2
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
;MyProject.mbas,310 :: 		dec(p)
	LDS        R16, _p+0
	LDS        R17, _p+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,311 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,314 :: 		PWM16bit_Change_Duty(p, _TIMER1_CH_A )
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 17
	MOV        R4, R27
	LDS        R2, _p+0
	LDS        R3, _p+1
	CALL       _PWM16bit_Change_Duty+0
	POP        R2
	POP        R3
;MyProject.mbas,315 :: 		PWM16bit_Change_Duty( j, _TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	CALL       _PWM16bit_Change_Duty+0
	POP        R4
	POP        R5
;MyProject.mbas,316 :: 		SetPWM0(-1)
	PUSH       R3
	PUSH       R2
	LDI        R27, 255
	MOV        R2, R27
	MOV        R3, R27
	CALL       _SetPWM0+0
	POP        R2
	POP        R3
;MyProject.mbas,323 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R2, R16
	CPC        R3, R17
	BRLT       L__PROGRAM5313
	JMP        L__PROGRAM590
L__PROGRAM5313:
	JMP        L__PROGRAM587
L__PROGRAM590:
;MyProject.mbas,324 :: 		end sub
L_end_PROGRAM5:
	RET
; end of _PROGRAM5

_PROGRAM6:

;MyProject.mbas,327 :: 		sub procedure PROGRAM6 (DIM J,dl AS integer)
;MyProject.mbas,328 :: 		P=J
	STS        _p+0, R2
	STS        _p+1, R3
;MyProject.mbas,330 :: 		p=255-j
	LDI        R16, 255
	LDI        R17, 0
	SUB        R16, R2
	SBC        R17, R3
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,331 :: 		do
L__PROGRAM693:
;MyProject.mbas,333 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,336 :: 		PWM16bit_Change_Duty(0, _TIMER1_CH_A )
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 17
	MOV        R4, R27
	CLR        R2
	CLR        R3
	CALL       _PWM16bit_Change_Duty+0
;MyProject.mbas,337 :: 		PWM16bit_Change_Duty( p, _TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	LDS        R2, _p+0
	LDS        R3, _p+1
	CALL       _PWM16bit_Change_Duty+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
;MyProject.mbas,338 :: 		SetPWM0(j)
	CALL       _SetPWM0+0
;MyProject.mbas,339 :: 		J=j+3 p=p-3
	MOVW       R18, R2
	SUBI       R18, 253
	SBCI       R19, 255
	MOVW       R2, R18
	LDS        R16, _p+0
	LDS        R17, _p+1
	SUBI       R16, 3
	SBCI       R17, 0
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,348 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__PROGRAM6315
	JMP        L__PROGRAM696
L__PROGRAM6315:
	JMP        L__PROGRAM693
L__PROGRAM696:
;MyProject.mbas,349 :: 		end sub
L_end_PROGRAM6:
	RET
; end of _PROGRAM6

_PROGRAM7:

;MyProject.mbas,352 :: 		sub procedure PROGRAM7 (DIM J,dl AS integer)
;MyProject.mbas,353 :: 		P=J
	STS        _p+0, R2
	STS        _p+1, R3
;MyProject.mbas,355 :: 		p=255-j
	LDI        R16, 255
	LDI        R17, 0
	SUB        R16, R2
	SBC        R17, R3
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,356 :: 		do
L__PROGRAM799:
;MyProject.mbas,357 :: 		inc(J)
	MOVW       R16, R2
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
;MyProject.mbas,358 :: 		dec(p)
	LDS        R16, _p+0
	LDS        R17, _p+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,359 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,362 :: 		PWM16bit_Change_Duty(p, _TIMER1_CH_A )
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 17
	MOV        R4, R27
	LDS        R2, _p+0
	LDS        R3, _p+1
	CALL       _PWM16bit_Change_Duty+0
;MyProject.mbas,364 :: 		PWM16bit_Change_Duty( 0, _TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	CLR        R2
	CLR        R3
	CALL       _PWM16bit_Change_Duty+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
;MyProject.mbas,365 :: 		SetPWM0(j)
	CALL       _SetPWM0+0
;MyProject.mbas,367 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,378 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R2, R16
	CPC        R3, R17
	BRLT       L__PROGRAM7317
	JMP        L__PROGRAM7102
L__PROGRAM7317:
	JMP        L__PROGRAM799
L__PROGRAM7102:
;MyProject.mbas,379 :: 		end sub
L_end_PROGRAM7:
	RET
; end of _PROGRAM7

_PROGRAM8:

;MyProject.mbas,382 :: 		sub procedure PROGRAM8 (DIM J,dl AS integer)
;MyProject.mbas,383 :: 		P=J
	STS        _p+0, R2
	STS        _p+1, R3
;MyProject.mbas,385 :: 		p=255-j
	LDI        R16, 255
	LDI        R17, 0
	SUB        R16, R2
	SBC        R17, R3
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,386 :: 		do
L__PROGRAM8105:
;MyProject.mbas,387 :: 		inc(J)
	MOVW       R16, R2
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
;MyProject.mbas,388 :: 		dec(p)
	LDS        R16, _p+0
	LDS        R17, _p+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,389 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,392 :: 		PWM16bit_Change_Duty(j, _TIMER1_CH_A )
	PUSH       R5
	PUSH       R4
	LDI        R27, 17
	MOV        R4, R27
	CALL       _PWM16bit_Change_Duty+0
;MyProject.mbas,393 :: 		PWM16bit_Change_Duty(p, _TIMER1_CH_B )
	PUSH       R3
	PUSH       R2
	LDI        R27, 18
	MOV        R4, R27
	LDS        R2, _p+0
	LDS        R3, _p+1
	CALL       _PWM16bit_Change_Duty+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
;MyProject.mbas,394 :: 		SetPWM0(-1)
	PUSH       R3
	PUSH       R2
	LDI        R27, 255
	MOV        R2, R27
	MOV        R3, R27
	CALL       _SetPWM0+0
	POP        R2
	POP        R3
;MyProject.mbas,401 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R2, R16
	CPC        R3, R17
	BRLT       L__PROGRAM8319
	JMP        L__PROGRAM8108
L__PROGRAM8319:
	JMP        L__PROGRAM8105
L__PROGRAM8108:
;MyProject.mbas,402 :: 		end sub
L_end_PROGRAM8:
	RET
; end of _PROGRAM8

_PROGRAM9:

;MyProject.mbas,406 :: 		sub procedure PROGRAM9 (DIM J,dl AS integer)
;MyProject.mbas,407 :: 		P=J
	STS        _p+0, R2
	STS        _p+1, R3
;MyProject.mbas,409 :: 		p=255-j
	LDI        R16, 255
	LDI        R17, 0
	SUB        R16, R2
	SBC        R17, R3
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,410 :: 		do
L__PROGRAM9111:
;MyProject.mbas,411 :: 		inc(J)
	MOVW       R16, R2
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
;MyProject.mbas,412 :: 		dec(p)
	LDS        R16, _p+0
	LDS        R17, _p+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,413 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,416 :: 		PWM16bit_Change_Duty(j, _TIMER1_CH_A )
	PUSH       R5
	PUSH       R4
	LDI        R27, 17
	MOV        R4, R27
	CALL       _PWM16bit_Change_Duty+0
;MyProject.mbas,417 :: 		PWM16bit_Change_Duty( j, _TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	CALL       _PWM16bit_Change_Duty+0
	POP        R4
	POP        R5
;MyProject.mbas,418 :: 		SetPWM0(-1)
	PUSH       R3
	PUSH       R2
	LDI        R27, 255
	MOV        R2, R27
	MOV        R3, R27
	CALL       _SetPWM0+0
	POP        R2
	POP        R3
;MyProject.mbas,425 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R2, R16
	CPC        R3, R17
	BRLT       L__PROGRAM9321
	JMP        L__PROGRAM9114
L__PROGRAM9321:
	JMP        L__PROGRAM9111
L__PROGRAM9114:
;MyProject.mbas,426 :: 		end sub
L_end_PROGRAM9:
	RET
; end of _PROGRAM9

_PROGRAM10:

;MyProject.mbas,429 :: 		sub procedure PROGRAM10 (DIM J,dl AS integer)
;MyProject.mbas,430 :: 		P=J
	STS        _p+0, R2
	STS        _p+1, R3
;MyProject.mbas,432 :: 		p=255-j
	LDI        R16, 255
	LDI        R17, 0
	SUB        R16, R2
	SBC        R17, R3
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,433 :: 		do
L__PROGRAM10117:
;MyProject.mbas,434 :: 		inc(J)
	MOVW       R16, R2
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
;MyProject.mbas,435 :: 		dec(p)
	LDS        R16, _p+0
	LDS        R17, _p+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,436 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,439 :: 		PWM16bit_Change_Duty(0, _TIMER1_CH_A )
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 17
	MOV        R4, R27
	CLR        R2
	CLR        R3
	CALL       _PWM16bit_Change_Duty+0
	POP        R2
	POP        R3
;MyProject.mbas,440 :: 		PWM16bit_Change_Duty( j, _TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	CALL       _PWM16bit_Change_Duty+0
	POP        R4
	POP        R5
;MyProject.mbas,441 :: 		SetPWM0(j)
	CALL       _SetPWM0+0
;MyProject.mbas,448 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R2, R16
	CPC        R3, R17
	BRLT       L__PROGRAM10323
	JMP        L__PROGRAM10120
L__PROGRAM10323:
	JMP        L__PROGRAM10117
L__PROGRAM10120:
;MyProject.mbas,449 :: 		end sub
L_end_PROGRAM10:
	RET
; end of _PROGRAM10

_PROGRAM11:

;MyProject.mbas,452 :: 		sub procedure PROGRAM11 (DIM J,dl AS integer)
;MyProject.mbas,453 :: 		P=J
	STS        _p+0, R2
	STS        _p+1, R3
;MyProject.mbas,455 :: 		p=255-j
	LDI        R16, 255
	LDI        R17, 0
	SUB        R16, R2
	SBC        R17, R3
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,456 :: 		do
L__PROGRAM11123:
;MyProject.mbas,457 :: 		inc(J)
	MOVW       R16, R2
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
;MyProject.mbas,458 :: 		dec(p)
	LDS        R16, _p+0
	LDS        R17, _p+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,459 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,462 :: 		PWM16bit_Change_Duty(j, _TIMER1_CH_A )
	PUSH       R5
	PUSH       R4
	LDI        R27, 17
	MOV        R4, R27
	CALL       _PWM16bit_Change_Duty+0
;MyProject.mbas,463 :: 		PWM16bit_Change_Duty( 0, _TIMER1_CH_B )
	PUSH       R3
	PUSH       R2
	LDI        R27, 18
	MOV        R4, R27
	CLR        R2
	CLR        R3
	CALL       _PWM16bit_Change_Duty+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
;MyProject.mbas,464 :: 		SetPWM0(j)
	CALL       _SetPWM0+0
;MyProject.mbas,471 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R2, R16
	CPC        R3, R17
	BRLT       L__PROGRAM11325
	JMP        L__PROGRAM11126
L__PROGRAM11325:
	JMP        L__PROGRAM11123
L__PROGRAM11126:
;MyProject.mbas,472 :: 		end sub
L_end_PROGRAM11:
	RET
; end of _PROGRAM11

_PROGRAM12:

;MyProject.mbas,476 :: 		sub procedure PROGRAM12 (DIM J,dl AS integer)
;MyProject.mbas,477 :: 		P=J
	STS        _p+0, R2
	STS        _p+1, R3
;MyProject.mbas,479 :: 		p=255-j
	LDI        R16, 255
	LDI        R17, 0
	SUB        R16, R2
	SBC        R17, R3
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,480 :: 		do
L__PROGRAM12129:
;MyProject.mbas,483 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,486 :: 		PWM16bit_Change_Duty(0, _TIMER1_CH_A )
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 17
	MOV        R4, R27
	CLR        R2
	CLR        R3
	CALL       _PWM16bit_Change_Duty+0
	POP        R2
	POP        R3
;MyProject.mbas,487 :: 		PWM16bit_Change_Duty( j, _TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	CALL       _PWM16bit_Change_Duty+0
	POP        R4
	POP        R5
;MyProject.mbas,488 :: 		SetPWM0(j)
	CALL       _SetPWM0+0
;MyProject.mbas,489 :: 		J=j+1
	MOVW       R18, R2
	SUBI       R18, 255
	SBCI       R19, 255
	MOVW       R2, R18
;MyProject.mbas,496 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__PROGRAM12327
	JMP        L__PROGRAM12132
L__PROGRAM12327:
	JMP        L__PROGRAM12129
L__PROGRAM12132:
;MyProject.mbas,497 :: 		end sub
L_end_PROGRAM12:
	RET
; end of _PROGRAM12

_PROGRAM13:

;MyProject.mbas,500 :: 		sub procedure PROGRAM13 (DIM J,dl AS integer)
;MyProject.mbas,501 :: 		P=J
	STS        _p+0, R2
	STS        _p+1, R3
;MyProject.mbas,503 :: 		p=255-j
	LDI        R16, 255
	LDI        R17, 0
	SUB        R16, R2
	SBC        R17, R3
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,504 :: 		do
L__PROGRAM13135:
;MyProject.mbas,507 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,510 :: 		PWM16bit_Change_Duty(30, _TIMER1_CH_A )
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 17
	MOV        R4, R27
	LDI        R27, 30
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _PWM16bit_Change_Duty+0
;MyProject.mbas,511 :: 		PWM16bit_Change_Duty( 10, _TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	LDI        R27, 10
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _PWM16bit_Change_Duty+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
;MyProject.mbas,512 :: 		SetPWM0(100)
	PUSH       R3
	PUSH       R2
	LDI        R27, 100
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _SetPWM0+0
	POP        R2
	POP        R3
;MyProject.mbas,513 :: 		J=j+3
	MOVW       R18, R2
	SUBI       R18, 253
	SBCI       R19, 255
	MOVW       R2, R18
;MyProject.mbas,520 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__PROGRAM13329
	JMP        L__PROGRAM13138
L__PROGRAM13329:
	JMP        L__PROGRAM13135
L__PROGRAM13138:
;MyProject.mbas,521 :: 		end sub
L_end_PROGRAM13:
	RET
; end of _PROGRAM13

_PWM_Initialize:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,525 :: 		ocr0,ocr2, k as integer
;MyProject.mbas,526 :: 		J=0
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	LDI        R27, 0
	STD        Y+0, R27
	STD        Y+1, R27
;MyProject.mbas,531 :: 		DDb1_bit = 1                    ' set portd pin0 as output pin for ufa fountain
	IN         R27, DDB1_bit+0
	SBR        R27, BitMask(DDB1_bit+0)
	OUT        DDB1_bit+0, R27
;MyProject.mbas,532 :: 		DDb2_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDB2_bit+0
	SBR        R27, BitMask(DDB2_bit+0)
	OUT        DDB2_bit+0, R27
;MyProject.mbas,533 :: 		DDb3_bit = 1                    ' Set PORTD pin 7 as output pin for the PWM1 (according to datasheet)
	IN         R27, DDB3_bit+0
	SBR        R27, BitMask(DDB3_bit+0)
	OUT        DDB3_bit+0, R27
;MyProject.mbas,538 :: 		TCCR2 = (1<<FOC2)or (1<<COM21)or(1<<COM20) or(1<<WGM20) or (1<<CS00) ''Pwm0 or pwm1 in meicrobasic
	LDI        R27, 241
	OUT        TCCR2+0, R27
;MyProject.mbas,539 :: 		PWM2_Init(_PWM2_FAST_MODE, _PWM2_PRESCALER_8, _PWM2_NON_INVERTED, J)
	CLR        R5
	LDI        R27, 32
	MOV        R4, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 72
	MOV        R2, R27
	CALL       _PWM2_Init+0
;MyProject.mbas,540 :: 		PWM16bit_Init(_PWM16_PHASE_CORRECT_MODE_8BIT, _PWM16_PRESCALER_16bit_8, _PWM16_NON_INVERTED, j , _TIMER1)
	LDI        R27, 1
	MOV        R7, R27
	LDD        R5, Y+0
	LDD        R6, Y+1
	LDI        R27, 160
	MOV        R4, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 11
	MOV        R2, R27
	CALL       _PWM16bit_Init+0
;MyProject.mbas,544 :: 		SetPWM0(j)
	LDD        R2, Y+0
	LDD        R3, Y+1
	CALL       _SetPWM0+0
;MyProject.mbas,551 :: 		end sub
L_end_PWM_Initialize:
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _PWM_Initialize

_LOOP1:

;MyProject.mbas,555 :: 		sub procedure LOOP1 (DIM J AS integer)
;MyProject.mbas,556 :: 		K=0
	PUSH       R4
	PUSH       R5
	LDI        R27, 0
	STS        _K+0, R27
	STS        _K+1, R27
;MyProject.mbas,558 :: 		do
L__LOOP1142:
;MyProject.mbas,559 :: 		inc(K)
	LDS        R16, _K+0
	LDS        R17, _K+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _K+0, R16
	STS        _K+1, R17
;MyProject.mbas,560 :: 		J= K*10
	LDI        R20, 10
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	MOVW       R2, R16
;MyProject.mbas,561 :: 		PROGRAM1(J,k)
	PUSH       R3
	PUSH       R2
	LDS        R4, _K+0
	LDS        R5, _K+1
	MOVW       R2, R16
	CALL       _PROGRAM1+0
	POP        R2
	POP        R3
;MyProject.mbas,564 :: 		J=100
	LDI        R27, 100
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
;MyProject.mbas,565 :: 		PROGRAM3(J,k)
	PUSH       R3
	PUSH       R2
	LDS        R4, _K+0
	LDS        R5, _K+1
	LDI        R27, 100
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _PROGRAM3+0
	POP        R2
	POP        R3
;MyProject.mbas,566 :: 		delay_ms(2000)
	LDI        R18, 82
	LDI        R17, 43
	LDI        R16, 0
L__LOOP1147:
	DEC        R16
	BRNE       L__LOOP1147
	DEC        R17
	BRNE       L__LOOP1147
	DEC        R18
	BRNE       L__LOOP1147
	NOP
	NOP
	NOP
	NOP
;MyProject.mbas,567 :: 		loop until K = 10
	LDS        R16, _K+0
	LDS        R17, _K+1
	CPI        R17, 0
	BRNE       L__LOOP1332
	CPI        R16, 10
L__LOOP1332:
	BRNE       L__LOOP1333
	JMP        L__LOOP1145
L__LOOP1333:
	JMP        L__LOOP1142
L__LOOP1145:
;MyProject.mbas,568 :: 		end sub
L_end_LOOP1:
	POP        R5
	POP        R4
	RET
; end of _LOOP1

_LOOP11:

;MyProject.mbas,571 :: 		sub procedure LOOP11 (DIM J AS integer)
;MyProject.mbas,572 :: 		K=0
	PUSH       R4
	PUSH       R5
	LDI        R27, 0
	STS        _K+0, R27
	STS        _K+1, R27
;MyProject.mbas,573 :: 		kk=255 -k
	LDI        R27, 255
	STS        _kk+0, R27
	LDI        R27, 0
	STS        _kk+1, R27
;MyProject.mbas,576 :: 		do
L__LOOP11150:
;MyProject.mbas,577 :: 		PROGRAM1(k,dl2)
	PUSH       R3
	PUSH       R2
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM1+0
;MyProject.mbas,578 :: 		PROGRAM2(k,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM2+0
;MyProject.mbas,579 :: 		PROGRAM3(k,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM3+0
;MyProject.mbas,580 :: 		PROGRAM4(k,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM4+0
;MyProject.mbas,581 :: 		PROGRAM5(k,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM5+0
;MyProject.mbas,582 :: 		PROGRAM6(k,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM6+0
;MyProject.mbas,583 :: 		PROGRAM7(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM7+0
;MyProject.mbas,584 :: 		PROGRAM8(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM8+0
;MyProject.mbas,585 :: 		PROGRAM9(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM9+0
;MyProject.mbas,586 :: 		PROGRAM10(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM10+0
;MyProject.mbas,587 :: 		PROGRAM11(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM11+0
;MyProject.mbas,588 :: 		PROGRAM12(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM12+0
;MyProject.mbas,589 :: 		PROGRAM13(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM13+0
	POP        R2
	POP        R3
;MyProject.mbas,590 :: 		K=K+3
	LDS        R16, _K+0
	LDS        R17, _K+1
	MOVW       R18, R16
	SUBI       R18, 253
	SBCI       R19, 255
	STS        _K+0, R18
	STS        _K+1, R19
;MyProject.mbas,591 :: 		kk=kk - 3
	LDS        R16, _kk+0
	LDS        R17, _kk+1
	SUBI       R16, 3
	SBCI       R17, 0
	STS        _kk+0, R16
	STS        _kk+1, R17
;MyProject.mbas,593 :: 		loop until K >= 255
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__LOOP11335
	JMP        L__LOOP11153
L__LOOP11335:
	JMP        L__LOOP11150
L__LOOP11153:
;MyProject.mbas,596 :: 		end sub
L_end_LOOP11:
	POP        R5
	POP        R4
	RET
; end of _LOOP11

_loop22:

;MyProject.mbas,598 :: 		sub procedure loop22(dim k2 as integer)
;MyProject.mbas,599 :: 		K=k2
	PUSH       R4
	PUSH       R5
	STS        _K+0, R2
	STS        _K+1, R3
;MyProject.mbas,601 :: 		kk=255 -k
	LDI        R16, 255
	LDI        R17, 0
	SUB        R16, R2
	SBC        R17, R3
	STS        _kk+0, R16
	STS        _kk+1, R17
;MyProject.mbas,604 :: 		do
L__loop22156:
;MyProject.mbas,607 :: 		PROGRAM2(kk,dl2)
	PUSH       R3
	PUSH       R2
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _kk+0
	LDS        R3, _kk+1
	CALL       _PROGRAM2+0
;MyProject.mbas,611 :: 		PROGRAM6(k,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM6+0
;MyProject.mbas,615 :: 		PROGRAM12(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM12+0
	POP        R2
	POP        R3
;MyProject.mbas,617 :: 		K=K+3
	LDS        R16, _K+0
	LDS        R17, _K+1
	SUBI       R16, 253
	SBCI       R17, 255
	STS        _K+0, R16
	STS        _K+1, R17
;MyProject.mbas,618 :: 		kk=kk - 3
	LDS        R16, _kk+0
	LDS        R17, _kk+1
	SUBI       R16, 3
	SBCI       R17, 0
	STS        _kk+0, R16
	STS        _kk+1, R17
;MyProject.mbas,623 :: 		if mode<>2 then
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__loop22337
	CPI        R16, 2
L__loop22337:
	BRNE       L__loop22338
	JMP        L__loop22162
L__loop22338:
;MyProject.mbas,624 :: 		break
	JMP        L__loop22158
L__loop22162:
;MyProject.mbas,626 :: 		loop until K >= 255
	LDS        R18, _K+0
	LDS        R19, _K+1
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__loop22339
	JMP        L__loop22159
L__loop22339:
	JMP        L__loop22156
L__loop22159:
L__loop22158:
;MyProject.mbas,627 :: 		K=170
	LDI        R27, 170
	STS        _K+0, R27
	LDI        R27, 0
	STS        _K+1, R27
;MyProject.mbas,628 :: 		kk=255-170
	LDI        R27, 85
	STS        _kk+0, R27
	LDI        R27, 0
	STS        _kk+1, R27
;MyProject.mbas,629 :: 		do
L__loop22164:
;MyProject.mbas,630 :: 		if mode<>2 then
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__loop22340
	CPI        R16, 2
L__loop22340:
	BRNE       L__loop22341
	JMP        L__loop22170
L__loop22341:
;MyProject.mbas,631 :: 		break
	JMP        L__loop22166
L__loop22170:
;MyProject.mbas,634 :: 		PROGRAM9(K,dl2)
	PUSH       R3
	PUSH       R2
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM9+0
	POP        R2
	POP        R3
;MyProject.mbas,643 :: 		K=K+1
	LDS        R16, _K+0
	LDS        R17, _K+1
	MOVW       R18, R16
	SUBI       R18, 255
	SBCI       R19, 255
	STS        _K+0, R18
	STS        _K+1, R19
;MyProject.mbas,644 :: 		kk=kk - 1
	LDS        R16, _kk+0
	LDS        R17, _kk+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _kk+0, R16
	STS        _kk+1, R17
;MyProject.mbas,646 :: 		loop until K >= 255
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__loop22342
	JMP        L__loop22167
L__loop22342:
	JMP        L__loop22164
L__loop22167:
L__loop22166:
;MyProject.mbas,647 :: 		K=190
	LDI        R27, 190
	STS        _K+0, R27
	LDI        R27, 0
	STS        _K+1, R27
;MyProject.mbas,648 :: 		kk=255-190
	LDI        R27, 65
	STS        _kk+0, R27
	LDI        R27, 0
	STS        _kk+1, R27
;MyProject.mbas,649 :: 		do
L__loop22172:
;MyProject.mbas,650 :: 		if mode<>2 then
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__loop22343
	CPI        R16, 2
L__loop22343:
	BRNE       L__loop22344
	JMP        L__loop22178
L__loop22344:
;MyProject.mbas,651 :: 		break
	JMP        L__loop22174
L__loop22178:
;MyProject.mbas,663 :: 		PROGRAM11(K,dl2)
	PUSH       R3
	PUSH       R2
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM11+0
	POP        R2
	POP        R3
;MyProject.mbas,664 :: 		K=K+10
	LDS        R16, _K+0
	LDS        R17, _K+1
	MOVW       R18, R16
	SUBI       R18, 246
	SBCI       R19, 255
	STS        _K+0, R18
	STS        _K+1, R19
;MyProject.mbas,665 :: 		kk=kk - 10
	LDS        R16, _kk+0
	LDS        R17, _kk+1
	SUBI       R16, 10
	SBCI       R17, 0
	STS        _kk+0, R16
	STS        _kk+1, R17
;MyProject.mbas,666 :: 		loop until K >= 255
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__loop22345
	JMP        L__loop22175
L__loop22345:
	JMP        L__loop22172
L__loop22175:
L__loop22174:
;MyProject.mbas,667 :: 		K=180
	LDI        R27, 180
	STS        _K+0, R27
	LDI        R27, 0
	STS        _K+1, R27
;MyProject.mbas,668 :: 		kk=255-180
	LDI        R27, 75
	STS        _kk+0, R27
	LDI        R27, 0
	STS        _kk+1, R27
;MyProject.mbas,669 :: 		do
L__loop22180:
;MyProject.mbas,670 :: 		if mode<>2 then
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__loop22346
	CPI        R16, 2
L__loop22346:
	BRNE       L__loop22347
	JMP        L__loop22186
L__loop22347:
;MyProject.mbas,671 :: 		break
	JMP        L__loop22182
L__loop22186:
;MyProject.mbas,674 :: 		PROGRAM1(k,dl2)
	PUSH       R3
	PUSH       R2
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM1+0
;MyProject.mbas,676 :: 		PROGRAM2(kk,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _kk+0
	LDS        R3, _kk+1
	CALL       _PROGRAM2+0
;MyProject.mbas,678 :: 		PROGRAM10(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM10+0
;MyProject.mbas,680 :: 		PROGRAM6(k,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM6+0
;MyProject.mbas,682 :: 		PROGRAM8(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM8+0
	POP        R2
	POP        R3
;MyProject.mbas,684 :: 		K=K+1
	LDS        R16, _K+0
	LDS        R17, _K+1
	MOVW       R18, R16
	SUBI       R18, 255
	SBCI       R19, 255
	STS        _K+0, R18
	STS        _K+1, R19
;MyProject.mbas,685 :: 		kk=kk - 1
	LDS        R16, _kk+0
	LDS        R17, _kk+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _kk+0, R16
	STS        _kk+1, R17
;MyProject.mbas,687 :: 		loop until K >= 255
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__loop22348
	JMP        L__loop22183
L__loop22348:
	JMP        L__loop22180
L__loop22183:
L__loop22182:
;MyProject.mbas,689 :: 		end sub
L_end_loop22:
	POP        R5
	POP        R4
	RET
; end of _loop22

_loop33:

;MyProject.mbas,692 :: 		sub procedure loop33(dim k2 as integer)
;MyProject.mbas,693 :: 		K=k2
	PUSH       R4
	PUSH       R5
	STS        _K+0, R2
	STS        _K+1, R3
;MyProject.mbas,695 :: 		kk=255
	LDI        R27, 255
	STS        _kk+0, R27
	LDI        R27, 0
	STS        _kk+1, R27
;MyProject.mbas,698 :: 		do
L__loop33189:
;MyProject.mbas,709 :: 		PROGRAM12(K,dl2)
	PUSH       R3
	PUSH       R2
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM12+0
	POP        R2
	POP        R3
;MyProject.mbas,711 :: 		K=K+3
	LDS        R16, _K+0
	LDS        R17, _K+1
	SUBI       R16, 253
	SBCI       R17, 255
	STS        _K+0, R16
	STS        _K+1, R17
;MyProject.mbas,712 :: 		kk=kk - 3
	LDS        R16, _kk+0
	LDS        R17, _kk+1
	SUBI       R16, 3
	SBCI       R17, 0
	STS        _kk+0, R16
	STS        _kk+1, R17
;MyProject.mbas,717 :: 		if mode<>2 then
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__loop33350
	CPI        R16, 2
L__loop33350:
	BRNE       L__loop33351
	JMP        L__loop33195
L__loop33351:
;MyProject.mbas,718 :: 		break
	JMP        L__loop33191
L__loop33195:
;MyProject.mbas,720 :: 		loop until K >= 255
	LDS        R18, _K+0
	LDS        R19, _K+1
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__loop33352
	JMP        L__loop33192
L__loop33352:
	JMP        L__loop33189
L__loop33192:
L__loop33191:
;MyProject.mbas,721 :: 		K=170
	LDI        R27, 170
	STS        _K+0, R27
	LDI        R27, 0
	STS        _K+1, R27
;MyProject.mbas,722 :: 		kk=255-170
	LDI        R27, 85
	STS        _kk+0, R27
	LDI        R27, 0
	STS        _kk+1, R27
;MyProject.mbas,723 :: 		do
L__loop33197:
;MyProject.mbas,724 :: 		if mode<>3 then
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__loop33353
	CPI        R16, 3
L__loop33353:
	BRNE       L__loop33354
	JMP        L__loop33203
L__loop33354:
;MyProject.mbas,725 :: 		break
	JMP        L__loop33199
L__loop33203:
;MyProject.mbas,728 :: 		PROGRAM9(K,dl2)
	PUSH       R3
	PUSH       R2
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM9+0
	POP        R2
	POP        R3
;MyProject.mbas,737 :: 		K=K+1
	LDS        R16, _K+0
	LDS        R17, _K+1
	MOVW       R18, R16
	SUBI       R18, 255
	SBCI       R19, 255
	STS        _K+0, R18
	STS        _K+1, R19
;MyProject.mbas,738 :: 		kk=kk - 1
	LDS        R16, _kk+0
	LDS        R17, _kk+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _kk+0, R16
	STS        _kk+1, R17
;MyProject.mbas,740 :: 		loop until K >= 255
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__loop33355
	JMP        L__loop33200
L__loop33355:
	JMP        L__loop33197
L__loop33200:
L__loop33199:
;MyProject.mbas,741 :: 		K=190
	LDI        R27, 190
	STS        _K+0, R27
	LDI        R27, 0
	STS        _K+1, R27
;MyProject.mbas,742 :: 		kk=255-k
	LDI        R27, 65
	STS        _kk+0, R27
	LDI        R27, 0
	STS        _kk+1, R27
;MyProject.mbas,743 :: 		do
L__loop33205:
;MyProject.mbas,744 :: 		if mode<>3 then
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__loop33356
	CPI        R16, 3
L__loop33356:
	BRNE       L__loop33357
	JMP        L__loop33211
L__loop33357:
;MyProject.mbas,745 :: 		break
	JMP        L__loop33207
L__loop33211:
;MyProject.mbas,757 :: 		PROGRAM11(K,dl2)
	PUSH       R3
	PUSH       R2
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM11+0
	POP        R2
	POP        R3
;MyProject.mbas,758 :: 		K=K+10
	LDS        R16, _K+0
	LDS        R17, _K+1
	MOVW       R18, R16
	SUBI       R18, 246
	SBCI       R19, 255
	STS        _K+0, R18
	STS        _K+1, R19
;MyProject.mbas,759 :: 		kk=kk - 10
	LDS        R16, _kk+0
	LDS        R17, _kk+1
	SUBI       R16, 10
	SBCI       R17, 0
	STS        _kk+0, R16
	STS        _kk+1, R17
;MyProject.mbas,760 :: 		loop until K >= 255
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__loop33358
	JMP        L__loop33208
L__loop33358:
	JMP        L__loop33205
L__loop33208:
L__loop33207:
;MyProject.mbas,761 :: 		K=180
	LDI        R27, 180
	STS        _K+0, R27
	LDI        R27, 0
	STS        _K+1, R27
;MyProject.mbas,762 :: 		kk=255-k
	LDI        R27, 75
	STS        _kk+0, R27
	LDI        R27, 0
	STS        _kk+1, R27
;MyProject.mbas,763 :: 		do
L__loop33213:
;MyProject.mbas,764 :: 		if mode<>3 then
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__loop33359
	CPI        R16, 3
L__loop33359:
	BRNE       L__loop33360
	JMP        L__loop33219
L__loop33360:
;MyProject.mbas,765 :: 		break
	JMP        L__loop33215
L__loop33219:
;MyProject.mbas,768 :: 		PROGRAM1(k,dl2)
	PUSH       R3
	PUSH       R2
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM1+0
;MyProject.mbas,770 :: 		PROGRAM2(kk,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _kk+0
	LDS        R3, _kk+1
	CALL       _PROGRAM2+0
;MyProject.mbas,772 :: 		PROGRAM10(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM10+0
;MyProject.mbas,774 :: 		PROGRAM6(k,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM6+0
;MyProject.mbas,776 :: 		PROGRAM8(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM8+0
	POP        R2
	POP        R3
;MyProject.mbas,778 :: 		K=K+1
	LDS        R16, _K+0
	LDS        R17, _K+1
	MOVW       R18, R16
	SUBI       R18, 255
	SBCI       R19, 255
	STS        _K+0, R18
	STS        _K+1, R19
;MyProject.mbas,779 :: 		kk=kk - 1
	LDS        R16, _kk+0
	LDS        R17, _kk+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _kk+0, R16
	STS        _kk+1, R17
;MyProject.mbas,781 :: 		loop until K >= 255
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__loop33361
	JMP        L__loop33216
L__loop33361:
	JMP        L__loop33213
L__loop33216:
L__loop33215:
;MyProject.mbas,783 :: 		end sub
L_end_loop33:
	POP        R5
	POP        R4
	RET
; end of _loop33

_interrupt_ISR:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 18
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,786 :: 		sub procedure interrupt_ISR () org IVT_ADDR_INT0            ''// Interrupt rutine
;MyProject.mbas,789 :: 		SREG_I_bit = 0                                   '' // Disable Interrupts
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	IN         R27, SREG_I_bit+0
	CBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,792 :: 		INTF0_bit=0                                                  '  // Clear interrupt flag
	IN         R27, INTF0_bit+0
	CBR        R27, BitMask(INTF0_bit+0)
	OUT        INTF0_bit+0, R27
;MyProject.mbas,793 :: 		INT0_bit = 0
	IN         R27, INT0_bit+0
	CBR        R27, BitMask(INT0_bit+0)
	OUT        INT0_bit+0, R27
;MyProject.mbas,794 :: 		oldstate_3=0
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,795 :: 		if (Button(PORTD, 2, 0.1, 0)) then    ' Detect logical one up key
	CLR        R6
	CLR        R5
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PORTD+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PORTD+0)
	MOV        R3, R27
	CALL       _Button+0
	TST        R16
	BRNE       L__interrupt_ISR363
	JMP        L__interrupt_ISR223
L__interrupt_ISR363:
;MyProject.mbas,796 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L__interrupt_ISR223:
;MyProject.mbas,798 :: 		if (oldstate_3 and Button(PIND, 2,0.1, 1)) then
	LDI        R27, 1
	MOV        R6, R27
	CLR        R5
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(PIND+0)
	MOV        R2, R27
	LDI        R27, hi_addr(PIND+0)
	MOV        R3, R27
	CALL       _Button+0
	LDS        R0, _oldstate_3+0
	CLR        R17
	SBRC       R0, BitPos(_oldstate_3+0)
	INC        R17
	AND        R16, R17
	BRNE       L__interrupt_ISR364
	JMP        L__interrupt_ISR226
L__interrupt_ISR364:
;MyProject.mbas,799 :: 		if (mode=4) then
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__interrupt_ISR365
	CPI        R16, 4
L__interrupt_ISR365:
	BREQ       L__interrupt_ISR366
	JMP        L__interrupt_ISR229
L__interrupt_ISR366:
;MyProject.mbas,800 :: 		mode=1
	LDI        R27, 1
	STS        _mode+0, R27
	LDI        R27, 0
	STS        _mode+1, R27
	JMP        L__interrupt_ISR230
;MyProject.mbas,801 :: 		else
L__interrupt_ISR229:
;MyProject.mbas,802 :: 		mode=mode+1
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _mode+0, R16
	STS        _mode+1, R17
;MyProject.mbas,803 :: 		end if
L__interrupt_ISR230:
;MyProject.mbas,805 :: 		case 1
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__interrupt_ISR367
	CPI        R16, 1
L__interrupt_ISR367:
	BREQ       L__interrupt_ISR368
	JMP        L__interrupt_ISR234
L__interrupt_ISR368:
;MyProject.mbas,806 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,807 :: 		inttostr(mode,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _mode+0
	LDS        R3, _mode+1
	CALL       _IntToStr+0
;MyProject.mbas,808 :: 		LCD_Out(2,9, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,809 :: 		LCD_Out(1,1, "Mode : Dancing")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 68
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,810 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__interrupt_ISR235:
	DEC        R16
	BRNE       L__interrupt_ISR235
	DEC        R17
	BRNE       L__interrupt_ISR235
	DEC        R18
	BRNE       L__interrupt_ISR235
	JMP        L__interrupt_ISR231
L__interrupt_ISR234:
;MyProject.mbas,811 :: 		case 2
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__interrupt_ISR369
	CPI        R16, 2
L__interrupt_ISR369:
	BREQ       L__interrupt_ISR370
	JMP        L__interrupt_ISR239
L__interrupt_ISR370:
;MyProject.mbas,812 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,813 :: 		inttostr(mode,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _mode+0
	LDS        R3, _mode+1
	CALL       _IntToStr+0
;MyProject.mbas,814 :: 		LCD_Out(2,9, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,815 :: 		LCD_Out(1,1, "Mode : Clasic")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,816 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__interrupt_ISR240:
	DEC        R16
	BRNE       L__interrupt_ISR240
	DEC        R17
	BRNE       L__interrupt_ISR240
	DEC        R18
	BRNE       L__interrupt_ISR240
	JMP        L__interrupt_ISR231
L__interrupt_ISR239:
;MyProject.mbas,817 :: 		case 3
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__interrupt_ISR371
	CPI        R16, 3
L__interrupt_ISR371:
	BREQ       L__interrupt_ISR372
	JMP        L__interrupt_ISR244
L__interrupt_ISR372:
;MyProject.mbas,818 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,819 :: 		inttostr(mode,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _mode+0
	LDS        R3, _mode+1
	CALL       _IntToStr+0
;MyProject.mbas,820 :: 		LCD_Out(2,9, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,821 :: 		LCD_Out(1,1, "Mode : warm")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 119
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,822 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__interrupt_ISR245:
	DEC        R16
	BRNE       L__interrupt_ISR245
	DEC        R17
	BRNE       L__interrupt_ISR245
	DEC        R18
	BRNE       L__interrupt_ISR245
	JMP        L__interrupt_ISR231
L__interrupt_ISR244:
;MyProject.mbas,824 :: 		case 4
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__interrupt_ISR373
	CPI        R16, 4
L__interrupt_ISR373:
	BREQ       L__interrupt_ISR374
	JMP        L__interrupt_ISR249
L__interrupt_ISR374:
;MyProject.mbas,825 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,826 :: 		inttostr(mode,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _mode+0
	LDS        R3, _mode+1
	CALL       _IntToStr+0
;MyProject.mbas,827 :: 		LCD_Out(2,9, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,828 :: 		LCD_Out(1,1, "Mode : echolazier")  ''Show on LCD
	MOVW       R30, R28
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 122
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,829 :: 		Delay_mS(100)
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L__interrupt_ISR250:
	DEC        R16
	BRNE       L__interrupt_ISR250
	DEC        R17
	BRNE       L__interrupt_ISR250
	DEC        R18
	BRNE       L__interrupt_ISR250
	JMP        L__interrupt_ISR231
L__interrupt_ISR249:
L__interrupt_ISR231:
;MyProject.mbas,831 :: 		end select
L__interrupt_ISR226:
;MyProject.mbas,834 :: 		INT0_bit = 1
	IN         R27, INT0_bit+0
	SBR        R27, BitMask(INT0_bit+0)
	OUT        INT0_bit+0, R27
;MyProject.mbas,836 :: 		SREG_I_bit = 1
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,838 :: 		end sub
L_end_interrupt_ISR:
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 17
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _interrupt_ISR

_Timer0Overflow_ISR:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;MyProject.mbas,842 :: 		dim counter as byte
;MyProject.mbas,850 :: 		WHILE TRUE
L__Timer0Overflow_ISR254:
;MyProject.mbas,852 :: 		PORTB= 0X00
	LDI        R27, 0
	OUT        PORTB+0, R27
;MyProject.mbas,853 :: 		WEND
	JMP        L__Timer0Overflow_ISR254
;MyProject.mbas,854 :: 		end sub
L_end_Timer0Overflow_ISR:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _Timer0Overflow_ISR

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 14
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,857 :: 		main:
;MyProject.mbas,858 :: 		Lcd_Init()
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	CALL       _Lcd_Init+0
;MyProject.mbas,859 :: 		Lcd_Cmd(_LCD_CLEAR)               ' Clear display
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,860 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,861 :: 		Lcd_Out(1,1,"Waiting For ")
	MOVW       R30, R28
	LDI        R27, 87
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 103
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 70
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,862 :: 		Lcd_Out(2,1,"To Be Pressed")
	MOVW       R30, R28
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 66
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 100
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,863 :: 		PWM_Initialize ()
	CALL       _PWM_Initialize+0
;MyProject.mbas,864 :: 		DDD2_bit = 0                                        ' set Button pin as input
	IN         R27, DDD2_bit+0
	CBR        R27, BitMask(DDD2_bit+0)
	OUT        DDD2_bit+0, R27
;MyProject.mbas,866 :: 		ISC00_bit = 1                                    '' // Set interrupts to be detected on rising edge
	IN         R27, ISC00_bit+0
	SBR        R27, BitMask(ISC00_bit+0)
	OUT        ISC00_bit+0, R27
;MyProject.mbas,868 :: 		SREG_I_bit = 0
	IN         R27, SREG_I_bit+0
	CBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,870 :: 		SREG_I_bit = 1
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,872 :: 		INT0_bit = 1
	IN         R27, INT0_bit+0
	SBR        R27, BitMask(INT0_bit+0)
	OUT        INT0_bit+0, R27
;MyProject.mbas,875 :: 		mode=1
	LDI        R27, 1
	STS        _mode+0, R27
	LDI        R27, 0
	STS        _mode+1, R27
;MyProject.mbas,881 :: 		while TRUE
L__main260:
;MyProject.mbas,888 :: 		case 1
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__main377
	CPI        R16, 1
L__main377:
	BREQ       L__main378
	JMP        L__main267
L__main378:
;MyProject.mbas,889 :: 		K=0
	LDI        R27, 0
	STS        _K+0, R27
	STS        _K+1, R27
;MyProject.mbas,890 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,891 :: 		LOOP11(k)
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _LOOP11+0
	JMP        L__main264
L__main267:
;MyProject.mbas,892 :: 		case 2  ''######## warm
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__main379
	CPI        R16, 2
L__main379:
	BREQ       L__main380
	JMP        L__main270
L__main380:
;MyProject.mbas,893 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,894 :: 		loop22(K)
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _loop22+0
	JMP        L__main264
L__main270:
;MyProject.mbas,895 :: 		case 3
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__main381
	CPI        R16, 3
L__main381:
	BREQ       L__main382
	JMP        L__main273
L__main382:
;MyProject.mbas,896 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,897 :: 		loop33(K)
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _loop33+0
	JMP        L__main264
L__main273:
;MyProject.mbas,898 :: 		case 4
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__main383
	CPI        R16, 4
L__main383:
	BREQ       L__main384
	JMP        L__main276
L__main384:
;MyProject.mbas,899 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,900 :: 		PROGRAM8(0,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	CLR        R2
	CLR        R3
	CALL       _PROGRAM8+0
	JMP        L__main264
L__main276:
;MyProject.mbas,902 :: 		PROGRAM8(0,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	CLR        R2
	CLR        R3
	CALL       _PROGRAM8+0
L__main264:
;MyProject.mbas,904 :: 		wend
	JMP        L__main260
L_end_main:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
