
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
	BRLO       L__RndBig299
	JMP        L__RndBig2
L__RndBig299:
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
;MyProject.mbas,89 :: 		case 1
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__Move_Delay302
	CPI        R16, 1
L__Move_Delay302:
	BREQ       L__Move_Delay303
	JMP        L__Move_Delay9
L__Move_Delay303:
;MyProject.mbas,90 :: 		Delay_ms(4)                       ' You can change the moving speed here
	LDI        R17, 21
	LDI        R16, 199
L__Move_Delay10:
	DEC        R16
	BRNE       L__Move_Delay10
	DEC        R17
	BRNE       L__Move_Delay10
	JMP        L__Move_Delay6
L__Move_Delay9:
;MyProject.mbas,91 :: 		case 2
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__Move_Delay304
	CPI        R16, 2
L__Move_Delay304:
	BREQ       L__Move_Delay305
	JMP        L__Move_Delay14
L__Move_Delay305:
;MyProject.mbas,92 :: 		Delay_ms(30)                       ' You can change the moving speed here
	LDI        R17, 156
	LDI        R16, 215
L__Move_Delay15:
	DEC        R16
	BRNE       L__Move_Delay15
	DEC        R17
	BRNE       L__Move_Delay15
	NOP
	NOP
	JMP        L__Move_Delay6
L__Move_Delay14:
;MyProject.mbas,93 :: 		case 3
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__Move_Delay306
	CPI        R16, 3
L__Move_Delay306:
	BREQ       L__Move_Delay307
	JMP        L__Move_Delay19
L__Move_Delay307:
;MyProject.mbas,94 :: 		Delay_ms(50)                       ' You can change the moving speed here
	LDI        R18, 2
	LDI        R17, 4
	LDI        R16, 187
L__Move_Delay20:
	DEC        R16
	BRNE       L__Move_Delay20
	DEC        R17
	BRNE       L__Move_Delay20
	DEC        R18
	BRNE       L__Move_Delay20
	NOP
	JMP        L__Move_Delay6
L__Move_Delay19:
;MyProject.mbas,95 :: 		case 4
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__Move_Delay308
	CPI        R16, 4
L__Move_Delay308:
	BREQ       L__Move_Delay309
	JMP        L__Move_Delay24
L__Move_Delay309:
;MyProject.mbas,96 :: 		Delay_ms(1)                       ' You can change the moving speed here
	LDI        R17, 6
	LDI        R16, 49
L__Move_Delay25:
	DEC        R16
	BRNE       L__Move_Delay25
	DEC        R17
	BRNE       L__Move_Delay25
	JMP        L__Move_Delay6
L__Move_Delay24:
L__Move_Delay6:
;MyProject.mbas,98 :: 		end sub
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

;MyProject.mbas,104 :: 		tempCh as char
;MyProject.mbas,105 :: 		output = 0  ex=0
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
;MyProject.mbas,106 :: 		i = 1  stringLength = strlen(st)  temp = 0   numberLength = 0
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
;MyProject.mbas,108 :: 		for j = 0 to stringLength-1
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
	BRGE       L__strToInt1311
	JMP        L__strToInt132
L__strToInt1311:
;MyProject.mbas,110 :: 		tempCh = st[j]
	LDI        R18, #lo_addr(_st+0)
	LDI        R19, hi_addr(_st+0)
	LDD        R16, Y+4
	LDD        R17, Y+5
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LD         R18, Z
;MyProject.mbas,111 :: 		temp = tempCh - 48
	MOV        R16, R18
	LDI        R17, 0
	SUBI       R16, 48
	SBCI       R17, 0
	STD        Y+0, R16
	STD        Y+1, R17
;MyProject.mbas,112 :: 		if   tempCh =46 then
	CPI        R18, 46
	BREQ       L__strToInt1312
	JMP        L__strToInt134
L__strToInt1312:
;MyProject.mbas,113 :: 		ex=1
	LDI        R27, 1
	STD        Y+6, R27
	LDI        R27, 0
	STD        Y+7, R27
L__strToInt134:
;MyProject.mbas,115 :: 		if (temp >= 0) and ( temp <= 9) and (ex=0)  then
	LDD        R19, Y+0
	LDD        R20, Y+1
	LDI        R16, 0
	LDI        R17, 0
	CP         R19, R16
	CPC        R20, R17
	LDI        R18, 0
	BRLT       L__strToInt1313
	LDI        R18, 255
L__strToInt1313:
	LDI        R16, 9
	LDI        R17, 0
	CP         R16, R19
	CPC        R17, R20
	LDI        R27, 0
	BRLT       L__strToInt1314
	LDI        R27, 255
L__strToInt1314:
	MOV        R16, R27
	AND        R18, R16
	LDD        R16, Y+6
	LDD        R17, Y+7
	CPI        R17, 0
	BRNE       L__strToInt1315
	CPI        R16, 0
L__strToInt1315:
	LDI        R27, 0
	BRNE       L__strToInt1316
	LDI        R27, 255
L__strToInt1316:
	MOV        R16, R27
	AND        R16, R18
	BRNE       L__strToInt1317
	JMP        L__strToInt137
L__strToInt1317:
;MyProject.mbas,117 :: 		inc(numberLength)
	LDD        R16, Y+2
	LDD        R17, Y+3
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+2, R16
	STD        Y+3, R17
L__strToInt137:
;MyProject.mbas,119 :: 		next j
	LDD        R16, Y+4
	LDD        R17, Y+5
	CP         R16, R21
	CPC        R17, R22
	BRNE       L__strToInt1318
	JMP        L__strToInt132
L__strToInt1318:
	LDD        R16, Y+4
	LDD        R17, Y+5
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+4, R16
	STD        Y+5, R17
; stringLength end address is: 25 (R25)
	JMP        L__strToInt128
L__strToInt132:
;MyProject.mbas,122 :: 		for j = 0 to numberLength-1
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
	BRGE       L__strToInt1319
	JMP        L__strToInt143
L__strToInt1319:
;MyProject.mbas,124 :: 		tempCh = st[j]
	LDI        R18, #lo_addr(_st+0)
	LDI        R19, hi_addr(_st+0)
	LDD        R16, Y+4
	LDD        R17, Y+5
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LD         R16, Z
;MyProject.mbas,125 :: 		temp = tempCh - 48
	MOV        R19, R16
	LDI        R20, 0
	SUBI       R19, 48
	SBCI       R20, 0
	STD        Y+0, R19
	STD        Y+1, R20
;MyProject.mbas,126 :: 		if (temp >= 0) and (temp <= 9)  then
	LDI        R16, 0
	LDI        R17, 0
	CP         R19, R16
	CPC        R20, R17
	LDI        R18, 0
	BRLT       L__strToInt1320
	LDI        R18, 255
L__strToInt1320:
	LDI        R16, 9
	LDI        R17, 0
	CP         R16, R19
	CPC        R17, R20
	LDI        R27, 0
	BRLT       L__strToInt1321
	LDI        R27, 255
L__strToInt1321:
	MOV        R16, R27
	AND        R16, R18
	BRNE       L__strToInt1322
	JMP        L__strToInt145
L__strToInt1322:
;MyProject.mbas,128 :: 		output =output +  temp * pow(10, (numberLength-i))
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
;MyProject.mbas,129 :: 		i=i+1
	LDD        R16, Y+8
	LDD        R17, Y+9
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+8, R16
	STD        Y+9, R17
L__strToInt145:
;MyProject.mbas,132 :: 		next j
	LDD        R18, Y+4
	LDD        R19, Y+5
	LDD        R16, Y+26
	LDD        R17, Y+27
	CP         R18, R16
	CPC        R19, R17
	BRNE       L__strToInt1323
	JMP        L__strToInt143
L__strToInt1323:
	LDD        R16, Y+4
	LDD        R17, Y+5
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+4, R16
	STD        Y+5, R17
	JMP        L__strToInt139
L__strToInt143:
;MyProject.mbas,134 :: 		end sub
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

;MyProject.mbas,138 :: 		jjyear as float
;MyProject.mbas,140 :: 		jjyear=ceil((jj*max_duty)/100)
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
;MyProject.mbas,141 :: 		FloatToStr(jjyear, st)
	LDI        R27, #lo_addr(_st+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R7, R27
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _FloatToStr+0
;MyProject.mbas,146 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,148 :: 		strToInt1()
	CALL       _strToInt1+0
;MyProject.mbas,150 :: 		IntToStr(ii, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _output+0
	LDS        R3, _output+1
	CALL       _IntToStr+0
;MyProject.mbas,151 :: 		Lcd_Out(1,1,st)
	LDI        R27, #lo_addr(_st+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,152 :: 		Lcd_Out(2,1,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,153 :: 		Delay_mS(1000)
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L__PWM_MAKE_as_max48:
	DEC        R16
	BRNE       L__PWM_MAKE_as_max48
	DEC        R17
	BRNE       L__PWM_MAKE_as_max48
	DEC        R18
	BRNE       L__PWM_MAKE_as_max48
	NOP
;MyProject.mbas,154 :: 		end sub
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

;MyProject.mbas,158 :: 		jjyear as float
;MyProject.mbas,160 :: 		jjyear=ceil((jj*max_duty)/100)
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
;MyProject.mbas,161 :: 		FloatToStr(jjyear, st)
	LDI        R27, #lo_addr(_st+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R7, R27
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _FloatToStr+0
;MyProject.mbas,168 :: 		strToInt1()
	CALL       _strToInt1+0
;MyProject.mbas,169 :: 		ii =output
	LDS        R16, _output+0
	LDS        R17, _output+1
	STD        Y+0, R16
	STD        Y+1, R17
;MyProject.mbas,170 :: 		IntToStr(ii, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _output+0
	LDS        R3, _output+1
	CALL       _IntToStr+0
;MyProject.mbas,171 :: 		Lcd_Out(1,1,st)
	LDI        R27, #lo_addr(_st+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_st+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,172 :: 		Lcd_Out(2,6,txt)
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
;MyProject.mbas,173 :: 		IntToStr(jj, txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	CALL       _IntToStr+0
;MyProject.mbas,174 :: 		Lcd_Out(2,1,txt)
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
;MyProject.mbas,178 :: 		case 1
	LDI        R27, 0
	CP         R7, R27
	BRNE       L__PWM_MAKE326
	LDI        R27, 1
	CP         R6, R27
L__PWM_MAKE326:
	BREQ       L__PWM_MAKE327
	JMP        L__PWM_MAKE54
L__PWM_MAKE327:
;MyProject.mbas,181 :: 		PWM16bit_Change_Duty(ii, _TIMER1_CH_A )
	LDI        R27, 17
	MOV        R4, R27
	LDD        R2, Y+0
	LDD        R3, Y+1
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE51
L__PWM_MAKE54:
;MyProject.mbas,182 :: 		case 2
	LDI        R27, 0
	CP         R7, R27
	BRNE       L__PWM_MAKE328
	LDI        R27, 2
	CP         R6, R27
L__PWM_MAKE328:
	BREQ       L__PWM_MAKE329
	JMP        L__PWM_MAKE57
L__PWM_MAKE329:
;MyProject.mbas,183 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,185 :: 		PWM16bit_Change_Duty( ii, _TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	LDD        R2, Y+0
	LDD        R3, Y+1
	CALL       _PWM16bit_Change_Duty+0
	JMP        L__PWM_MAKE51
L__PWM_MAKE57:
;MyProject.mbas,186 :: 		case 3
	LDI        R27, 0
	CP         R7, R27
	BRNE       L__PWM_MAKE330
	LDI        R27, 3
	CP         R6, R27
L__PWM_MAKE330:
	BREQ       L__PWM_MAKE331
	JMP        L__PWM_MAKE60
L__PWM_MAKE331:
;MyProject.mbas,189 :: 		PWM2_Set_Duty(ii)
	LDD        R2, Y+0
	CALL       _PWM2_Set_Duty+0
	JMP        L__PWM_MAKE51
L__PWM_MAKE60:
L__PWM_MAKE51:
;MyProject.mbas,207 :: 		end sub
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

_PROGRAM1:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 15
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MyProject.mbas,209 :: 		sub procedure PROGRAM1 (DIM J,dl AS integer)
;MyProject.mbas,211 :: 		Lcd_0()
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	POP        R2
	POP        R3
;MyProject.mbas,214 :: 		do
L__PROGRAM162:
;MyProject.mbas,218 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,219 :: 		PWM16bit_Change_Duty(j, _TIMER1_CH_A )
	PUSH       R5
	PUSH       R4
	LDI        R27, 17
	MOV        R4, R27
	CALL       _PWM16bit_Change_Duty+0
;MyProject.mbas,220 :: 		PWM16bit_Change_Duty( j, _TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	CALL       _PWM16bit_Change_Duty+0
	POP        R4
	POP        R5
;MyProject.mbas,221 :: 		PWM2_Set_Duty(j)
	CALL       _PWM2_Set_Duty+0
;MyProject.mbas,222 :: 		inc(J)
	MOVW       R16, R2
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
;MyProject.mbas,224 :: 		lcd_out(1,1," _TIMER1_CH_A ")
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
;MyProject.mbas,225 :: 		inttostr(j,txt)
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	CALL       _IntToStr+0
;MyProject.mbas,226 :: 		lcd_out(2,5,txt)
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
;MyProject.mbas,233 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R2, R16
	CPC        R3, R17
	BRLT       L__PROGRAM1333
	JMP        L__PROGRAM165
L__PROGRAM1333:
	JMP        L__PROGRAM162
L__PROGRAM165:
;MyProject.mbas,234 :: 		end sub
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

;MyProject.mbas,237 :: 		sub procedure PROGRAM2 (DIM J,dl AS integer)
;MyProject.mbas,240 :: 		Lcd_0()
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	POP        R2
	POP        R3
;MyProject.mbas,241 :: 		do
L__PROGRAM268:
;MyProject.mbas,244 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,246 :: 		PWM16bit_Change_Duty(j, _TIMER1_CH_A )
	PUSH       R5
	PUSH       R4
	LDI        R27, 17
	MOV        R4, R27
	CALL       _PWM16bit_Change_Duty+0
;MyProject.mbas,247 :: 		PWM16bit_Change_Duty( j, _TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	CALL       _PWM16bit_Change_Duty+0
	POP        R4
	POP        R5
;MyProject.mbas,248 :: 		PWM2_Set_Duty(j)
	CALL       _PWM2_Set_Duty+0
;MyProject.mbas,250 :: 		lcd_out(1,1," _TIMER1_CH_A ")
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
;MyProject.mbas,251 :: 		inttostr(j,txt)
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	CALL       _IntToStr+0
;MyProject.mbas,252 :: 		lcd_out(2,5,txt)
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
;MyProject.mbas,253 :: 		Dec(J)
	MOVW       R18, R2
	SUBI       R18, 1
	SBCI       R19, 0
	MOVW       R2, R18
;MyProject.mbas,260 :: 		loop until J>=0
	LDI        R16, 0
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__PROGRAM2335
	JMP        L__PROGRAM271
L__PROGRAM2335:
	JMP        L__PROGRAM268
L__PROGRAM271:
;MyProject.mbas,261 :: 		end sub
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

;MyProject.mbas,265 :: 		sub procedure PROGRAM3 (DIM J,dl AS integer)
;MyProject.mbas,268 :: 		PWM16bit_Change_Duty( j, _TIMER1_CH_A )
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 17
	MOV        R4, R27
	CALL       _PWM16bit_Change_Duty+0
;MyProject.mbas,269 :: 		PWM16bit_Change_Duty( j, _TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	CALL       _PWM16bit_Change_Duty+0
;MyProject.mbas,271 :: 		PWM2_Set_Duty(150)    ''b channal
	PUSH       R3
	PUSH       R2
	LDI        R27, 150
	MOV        R2, R27
	CALL       _PWM2_Set_Duty+0
;MyProject.mbas,272 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,273 :: 		lcd_out(1,1," _TIMER1_CH_A ")
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
;MyProject.mbas,274 :: 		inttostr(j,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	CALL       _IntToStr+0
;MyProject.mbas,275 :: 		lcd_out(2,5,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 5
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,276 :: 		lcd_out(1,1,"Pwm2 ")
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
;MyProject.mbas,277 :: 		inttostr(150,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 150
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;MyProject.mbas,278 :: 		lcd_out(2,5,txt )
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 5
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,280 :: 		end sub
L_end_PROGRAM3:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
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

;MyProject.mbas,283 :: 		sub procedure PROGRAM4 (DIM J,dl AS integer)
;MyProject.mbas,284 :: 		P=J
	STS        _p+0, R2
	STS        _p+1, R3
;MyProject.mbas,286 :: 		p=255-j
	LDI        R16, 255
	LDI        R17, 0
	SUB        R16, R2
	SBC        R17, R3
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,287 :: 		Lcd_0()
	PUSH       R3
	PUSH       R2
	CALL       _Lcd_0+0
	POP        R2
	POP        R3
;MyProject.mbas,288 :: 		do
L__PROGRAM475:
;MyProject.mbas,290 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,293 :: 		PWM16bit_Change_Duty(j, _TIMER1_CH_A )
	PUSH       R5
	PUSH       R4
	LDI        R27, 17
	MOV        R4, R27
	CALL       _PWM16bit_Change_Duty+0
;MyProject.mbas,294 :: 		PWM16bit_Change_Duty( p, _TIMER1_CH_B )
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
;MyProject.mbas,295 :: 		PWM2_Set_Duty(j)
	CALL       _PWM2_Set_Duty+0
;MyProject.mbas,296 :: 		lcd_out(1,1,"TIMER1_CH_A ")
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
;MyProject.mbas,297 :: 		inttostr(j,txt)
	PUSH       R3
	PUSH       R2
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	CALL       _IntToStr+0
;MyProject.mbas,298 :: 		lcd_out(1,11,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,299 :: 		inttostr(p,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _p+0
	LDS        R3, _p+1
	CALL       _IntToStr+0
;MyProject.mbas,300 :: 		lcd_out(2,1,"TIMER1_CH_B ")
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
;MyProject.mbas,301 :: 		lcd_out(2,11,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 11
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,302 :: 		lcd_out(1,1,"Pwm2 ")
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
;MyProject.mbas,303 :: 		inttostr(150,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 150
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToStr+0
;MyProject.mbas,304 :: 		lcd_out(2,5,txt )
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
;MyProject.mbas,305 :: 		inc(J)
	MOVW       R18, R2
	SUBI       R18, 255
	SBCI       R19, 255
	MOVW       R2, R18
;MyProject.mbas,306 :: 		dec(p)
	LDS        R16, _p+0
	LDS        R17, _p+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,313 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__PROGRAM4338
	JMP        L__PROGRAM478
L__PROGRAM4338:
	JMP        L__PROGRAM475
L__PROGRAM478:
;MyProject.mbas,314 :: 		end sub
L_end_PROGRAM4:
	ADIW       R28, 12
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _PROGRAM4

_PROGRAM5:

;MyProject.mbas,317 :: 		sub procedure PROGRAM5 (DIM J,dl AS integer)
;MyProject.mbas,318 :: 		P=J
	STS        _p+0, R2
	STS        _p+1, R3
;MyProject.mbas,320 :: 		p=255-j
	LDI        R16, 255
	LDI        R17, 0
	SUB        R16, R2
	SBC        R17, R3
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,321 :: 		do
L__PROGRAM581:
;MyProject.mbas,322 :: 		inc(J)
	MOVW       R16, R2
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
;MyProject.mbas,323 :: 		dec(p)
	LDS        R16, _p+0
	LDS        R17, _p+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,324 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,327 :: 		PWM16bit_Change_Duty(p, _TIMER1_CH_A )
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
;MyProject.mbas,328 :: 		PWM16bit_Change_Duty( j, _TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	CALL       _PWM16bit_Change_Duty+0
	POP        R4
	POP        R5
;MyProject.mbas,329 :: 		PWM2_Set_Duty(p)
	PUSH       R3
	PUSH       R2
	LDS        R2, _p+0
	CALL       _PWM2_Set_Duty+0
	POP        R2
	POP        R3
;MyProject.mbas,336 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R2, R16
	CPC        R3, R17
	BRLT       L__PROGRAM5340
	JMP        L__PROGRAM584
L__PROGRAM5340:
	JMP        L__PROGRAM581
L__PROGRAM584:
;MyProject.mbas,337 :: 		end sub
L_end_PROGRAM5:
	RET
; end of _PROGRAM5

_PROGRAM6:

;MyProject.mbas,340 :: 		sub procedure PROGRAM6 (DIM J,dl AS integer)
;MyProject.mbas,341 :: 		P=J
	STS        _p+0, R2
	STS        _p+1, R3
;MyProject.mbas,343 :: 		p=255-j
	LDI        R16, 255
	LDI        R17, 0
	SUB        R16, R2
	SBC        R17, R3
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,344 :: 		do
L__PROGRAM687:
;MyProject.mbas,346 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,349 :: 		PWM16bit_Change_Duty(p, _TIMER1_CH_A )
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 17
	MOV        R4, R27
	LDS        R2, _p+0
	LDS        R3, _p+1
	CALL       _PWM16bit_Change_Duty+0
;MyProject.mbas,350 :: 		PWM16bit_Change_Duty( p, _TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	LDS        R2, _p+0
	LDS        R3, _p+1
	CALL       _PWM16bit_Change_Duty+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
;MyProject.mbas,351 :: 		PWM2_Set_Duty(j)
	CALL       _PWM2_Set_Duty+0
;MyProject.mbas,352 :: 		J=j+3 p=p-3
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
;MyProject.mbas,361 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__PROGRAM6342
	JMP        L__PROGRAM690
L__PROGRAM6342:
	JMP        L__PROGRAM687
L__PROGRAM690:
;MyProject.mbas,362 :: 		end sub
L_end_PROGRAM6:
	RET
; end of _PROGRAM6

_PROGRAM7:

;MyProject.mbas,365 :: 		sub procedure PROGRAM7 (DIM J,dl AS integer)
;MyProject.mbas,366 :: 		P=J
	STS        _p+0, R2
	STS        _p+1, R3
;MyProject.mbas,368 :: 		p=255-j
	LDI        R16, 255
	LDI        R17, 0
	SUB        R16, R2
	SBC        R17, R3
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,369 :: 		do
L__PROGRAM793:
;MyProject.mbas,370 :: 		inc(J)
	MOVW       R16, R2
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
;MyProject.mbas,371 :: 		dec(p)
	LDS        R16, _p+0
	LDS        R17, _p+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,372 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,375 :: 		PWM16bit_Change_Duty(p, _TIMER1_CH_A )
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 17
	MOV        R4, R27
	LDS        R2, _p+0
	LDS        R3, _p+1
	CALL       _PWM16bit_Change_Duty+0
;MyProject.mbas,377 :: 		PWM16bit_Change_Duty( p, _TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	LDS        R2, _p+0
	LDS        R3, _p+1
	CALL       _PWM16bit_Change_Duty+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
;MyProject.mbas,378 :: 		PWM2_Set_Duty(j)
	CALL       _PWM2_Set_Duty+0
;MyProject.mbas,380 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,381 :: 		PWM16bit_Change_Duty(p*0, _TIMER1_CH_A )
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 17
	MOV        R4, R27
	CLR        R2
	CLR        R3
	CALL       _PWM16bit_Change_Duty+0
;MyProject.mbas,383 :: 		PWM16bit_Change_Duty( p*0, _TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	CLR        R2
	CLR        R3
	CALL       _PWM16bit_Change_Duty+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
;MyProject.mbas,384 :: 		PWM2_Set_Duty(j*0)
	PUSH       R3
	PUSH       R2
	CLR        R2
	CALL       _PWM2_Set_Duty+0
	POP        R2
	POP        R3
;MyProject.mbas,391 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R2, R16
	CPC        R3, R17
	BRLT       L__PROGRAM7344
	JMP        L__PROGRAM796
L__PROGRAM7344:
	JMP        L__PROGRAM793
L__PROGRAM796:
;MyProject.mbas,392 :: 		end sub
L_end_PROGRAM7:
	RET
; end of _PROGRAM7

_PROGRAM8:

;MyProject.mbas,395 :: 		sub procedure PROGRAM8 (DIM J,dl AS integer)
;MyProject.mbas,396 :: 		P=J
	STS        _p+0, R2
	STS        _p+1, R3
;MyProject.mbas,398 :: 		p=255-j
	LDI        R16, 255
	LDI        R17, 0
	SUB        R16, R2
	SBC        R17, R3
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,399 :: 		do
L__PROGRAM899:
;MyProject.mbas,400 :: 		inc(J)
	MOVW       R16, R2
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
;MyProject.mbas,401 :: 		dec(p)
	LDS        R16, _p+0
	LDS        R17, _p+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,402 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,405 :: 		PWM16bit_Change_Duty(p, _TIMER1_CH_A )
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
;MyProject.mbas,406 :: 		PWM16bit_Change_Duty( j, _TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	CALL       _PWM16bit_Change_Duty+0
	POP        R4
	POP        R5
;MyProject.mbas,407 :: 		PWM2_Set_Duty(0)
	PUSH       R3
	PUSH       R2
	CLR        R2
	CALL       _PWM2_Set_Duty+0
	POP        R2
	POP        R3
;MyProject.mbas,414 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R2, R16
	CPC        R3, R17
	BRLT       L__PROGRAM8346
	JMP        L__PROGRAM8102
L__PROGRAM8346:
	JMP        L__PROGRAM899
L__PROGRAM8102:
;MyProject.mbas,415 :: 		end sub
L_end_PROGRAM8:
	RET
; end of _PROGRAM8

_PROGRAM9:

;MyProject.mbas,419 :: 		sub procedure PROGRAM9 (DIM J,dl AS integer)
;MyProject.mbas,420 :: 		P=J
	STS        _p+0, R2
	STS        _p+1, R3
;MyProject.mbas,422 :: 		p=255-j
	LDI        R16, 255
	LDI        R17, 0
	SUB        R16, R2
	SBC        R17, R3
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,423 :: 		do
L__PROGRAM9105:
;MyProject.mbas,424 :: 		inc(J)
	MOVW       R16, R2
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
;MyProject.mbas,425 :: 		dec(p)
	LDS        R16, _p+0
	LDS        R17, _p+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,426 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,429 :: 		PWM16bit_Change_Duty(0, _TIMER1_CH_A )
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
;MyProject.mbas,430 :: 		PWM16bit_Change_Duty( j, _TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	CALL       _PWM16bit_Change_Duty+0
	POP        R4
	POP        R5
;MyProject.mbas,431 :: 		PWM2_Set_Duty(p)
	PUSH       R3
	PUSH       R2
	LDS        R2, _p+0
	CALL       _PWM2_Set_Duty+0
	POP        R2
	POP        R3
;MyProject.mbas,438 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R2, R16
	CPC        R3, R17
	BRLT       L__PROGRAM9348
	JMP        L__PROGRAM9108
L__PROGRAM9348:
	JMP        L__PROGRAM9105
L__PROGRAM9108:
;MyProject.mbas,439 :: 		end sub
L_end_PROGRAM9:
	RET
; end of _PROGRAM9

_PROGRAM10:

;MyProject.mbas,442 :: 		sub procedure PROGRAM10 (DIM J,dl AS integer)
;MyProject.mbas,443 :: 		P=J
	STS        _p+0, R2
	STS        _p+1, R3
;MyProject.mbas,445 :: 		p=255-j
	LDI        R16, 255
	LDI        R17, 0
	SUB        R16, R2
	SBC        R17, R3
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,446 :: 		do
L__PROGRAM10111:
;MyProject.mbas,447 :: 		inc(J)
	MOVW       R16, R2
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
;MyProject.mbas,448 :: 		dec(p)
	LDS        R16, _p+0
	LDS        R17, _p+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,449 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,452 :: 		PWM16bit_Change_Duty(0, _TIMER1_CH_A )
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 17
	MOV        R4, R27
	CLR        R2
	CLR        R3
	CALL       _PWM16bit_Change_Duty+0
;MyProject.mbas,453 :: 		PWM16bit_Change_Duty( 0, _TIMER1_CH_B )
	LDI        R27, 18
	MOV        R4, R27
	CLR        R2
	CLR        R3
	CALL       _PWM16bit_Change_Duty+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
;MyProject.mbas,454 :: 		PWM2_Set_Duty(p)
	PUSH       R3
	PUSH       R2
	LDS        R2, _p+0
	CALL       _PWM2_Set_Duty+0
	POP        R2
	POP        R3
;MyProject.mbas,461 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R2, R16
	CPC        R3, R17
	BRLT       L__PROGRAM10350
	JMP        L__PROGRAM10114
L__PROGRAM10350:
	JMP        L__PROGRAM10111
L__PROGRAM10114:
;MyProject.mbas,462 :: 		end sub
L_end_PROGRAM10:
	RET
; end of _PROGRAM10

_PROGRAM11:

;MyProject.mbas,465 :: 		sub procedure PROGRAM11 (DIM J,dl AS integer)
;MyProject.mbas,466 :: 		P=J
	STS        _p+0, R2
	STS        _p+1, R3
;MyProject.mbas,468 :: 		p=255-j
	LDI        R16, 255
	LDI        R17, 0
	SUB        R16, R2
	SBC        R17, R3
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,469 :: 		do
L__PROGRAM11117:
;MyProject.mbas,470 :: 		inc(J)
	MOVW       R16, R2
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
;MyProject.mbas,471 :: 		dec(p)
	LDS        R16, _p+0
	LDS        R17, _p+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,472 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,475 :: 		PWM16bit_Change_Duty(j, _TIMER1_CH_A )
	PUSH       R5
	PUSH       R4
	LDI        R27, 17
	MOV        R4, R27
	CALL       _PWM16bit_Change_Duty+0
;MyProject.mbas,476 :: 		PWM16bit_Change_Duty( 0, _TIMER1_CH_B )
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
;MyProject.mbas,477 :: 		PWM2_Set_Duty(p)
	PUSH       R3
	PUSH       R2
	LDS        R2, _p+0
	CALL       _PWM2_Set_Duty+0
	POP        R2
	POP        R3
;MyProject.mbas,484 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R2, R16
	CPC        R3, R17
	BRLT       L__PROGRAM11352
	JMP        L__PROGRAM11120
L__PROGRAM11352:
	JMP        L__PROGRAM11117
L__PROGRAM11120:
;MyProject.mbas,485 :: 		end sub
L_end_PROGRAM11:
	RET
; end of _PROGRAM11

_PROGRAM12:

;MyProject.mbas,489 :: 		sub procedure PROGRAM12 (DIM J,dl AS integer)
;MyProject.mbas,490 :: 		P=J
	STS        _p+0, R2
	STS        _p+1, R3
;MyProject.mbas,492 :: 		p=255-j
	LDI        R16, 255
	LDI        R17, 0
	SUB        R16, R2
	SBC        R17, R3
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,493 :: 		do
L__PROGRAM12123:
;MyProject.mbas,496 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,499 :: 		PWM16bit_Change_Duty(j, _TIMER1_CH_A )
	PUSH       R5
	PUSH       R4
	LDI        R27, 17
	MOV        R4, R27
	CALL       _PWM16bit_Change_Duty+0
;MyProject.mbas,500 :: 		PWM16bit_Change_Duty( p, _TIMER1_CH_B )
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
;MyProject.mbas,501 :: 		PWM2_Set_Duty(1)
	PUSH       R3
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _PWM2_Set_Duty+0
	POP        R2
	POP        R3
;MyProject.mbas,502 :: 		J=j+1
	MOVW       R18, R2
	SUBI       R18, 255
	SBCI       R19, 255
	MOVW       R2, R18
;MyProject.mbas,509 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__PROGRAM12354
	JMP        L__PROGRAM12126
L__PROGRAM12354:
	JMP        L__PROGRAM12123
L__PROGRAM12126:
;MyProject.mbas,510 :: 		end sub
L_end_PROGRAM12:
	RET
; end of _PROGRAM12

_PROGRAM13:

;MyProject.mbas,513 :: 		sub procedure PROGRAM13 (DIM J,dl AS integer)
;MyProject.mbas,514 :: 		P=J
	STS        _p+0, R2
	STS        _p+1, R3
;MyProject.mbas,516 :: 		p=255-j
	LDI        R16, 255
	LDI        R17, 0
	SUB        R16, R2
	SBC        R17, R3
	STS        _p+0, R16
	STS        _p+1, R17
;MyProject.mbas,517 :: 		do
L__PROGRAM13129:
;MyProject.mbas,520 :: 		Move_Delay()
	CALL       _Move_Delay+0
;MyProject.mbas,523 :: 		PWM16bit_Change_Duty(30, _TIMER1_CH_A )
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
;MyProject.mbas,524 :: 		PWM16bit_Change_Duty( 10, _TIMER1_CH_B )
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
;MyProject.mbas,525 :: 		PWM2_Set_Duty(100)
	PUSH       R3
	PUSH       R2
	LDI        R27, 100
	MOV        R2, R27
	CALL       _PWM2_Set_Duty+0
	POP        R2
	POP        R3
;MyProject.mbas,526 :: 		J=j+3
	MOVW       R18, R2
	SUBI       R18, 253
	SBCI       R19, 255
	MOVW       R2, R18
;MyProject.mbas,533 :: 		loop until J>=255
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__PROGRAM13356
	JMP        L__PROGRAM13132
L__PROGRAM13356:
	JMP        L__PROGRAM13129
L__PROGRAM13132:
;MyProject.mbas,534 :: 		end sub
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

;MyProject.mbas,538 :: 		ocr0,ocr2, k as integer
;MyProject.mbas,539 :: 		J=0
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	LDI        R27, 0
	STD        Y+0, R27
	STD        Y+1, R27
;MyProject.mbas,544 :: 		DDb1_bit = 1                    ' set portd pin0 as output pin for ufa fountain
	IN         R27, DDB1_bit+0
	SBR        R27, BitMask(DDB1_bit+0)
	OUT        DDB1_bit+0, R27
;MyProject.mbas,545 :: 		DDb2_bit = 1                    ' Set PORTB pin 3 as output pin for the PWM (according to datasheet)
	IN         R27, DDB2_bit+0
	SBR        R27, BitMask(DDB2_bit+0)
	OUT        DDB2_bit+0, R27
;MyProject.mbas,546 :: 		DDb3_bit = 1                    ' Set PORTD pin 7 as output pin for the PWM1 (according to datasheet)
	IN         R27, DDB3_bit+0
	SBR        R27, BitMask(DDB3_bit+0)
	OUT        DDB3_bit+0, R27
;MyProject.mbas,551 :: 		PWM2_Init(_PWM2_FAST_MODE, _PWM2_PRESCALER_8, _PWM2_NON_INVERTED, J)
	CLR        R5
	LDI        R27, 32
	MOV        R4, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 72
	MOV        R2, R27
	CALL       _PWM2_Init+0
;MyProject.mbas,552 :: 		PWM16bit_Init(_PWM16_PHASE_CORRECT_MODE_8BIT, _PWM16_PRESCALER_16bit_8, _PWM16_NON_INVERTED, j , _TIMER1)
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
;MyProject.mbas,556 :: 		PWM2_Set_Duty(j)
	LDD        R2, Y+0
	CALL       _PWM2_Set_Duty+0
;MyProject.mbas,563 :: 		end sub
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

;MyProject.mbas,567 :: 		sub procedure LOOP1 (DIM J AS integer)
;MyProject.mbas,568 :: 		K=0
	PUSH       R4
	PUSH       R5
	LDI        R27, 0
	STS        _K+0, R27
	STS        _K+1, R27
;MyProject.mbas,570 :: 		do
L__LOOP1136:
;MyProject.mbas,571 :: 		inc(K)
	LDS        R16, _K+0
	LDS        R17, _K+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _K+0, R16
	STS        _K+1, R17
;MyProject.mbas,572 :: 		J= K*10
	LDI        R20, 10
	LDI        R21, 0
	CALL       _HWMul_16x16+0
	MOVW       R2, R16
;MyProject.mbas,573 :: 		PROGRAM1(J,k)
	PUSH       R3
	PUSH       R2
	LDS        R4, _K+0
	LDS        R5, _K+1
	MOVW       R2, R16
	CALL       _PROGRAM1+0
	POP        R2
	POP        R3
;MyProject.mbas,576 :: 		J=100
	LDI        R27, 100
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
;MyProject.mbas,577 :: 		PROGRAM3(J,k)
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
;MyProject.mbas,578 :: 		delay_ms(2000)
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L__LOOP1141:
	DEC        R16
	BRNE       L__LOOP1141
	DEC        R17
	BRNE       L__LOOP1141
	DEC        R18
	BRNE       L__LOOP1141
;MyProject.mbas,579 :: 		loop until K = 10
	LDS        R16, _K+0
	LDS        R17, _K+1
	CPI        R17, 0
	BRNE       L__LOOP1359
	CPI        R16, 10
L__LOOP1359:
	BRNE       L__LOOP1360
	JMP        L__LOOP1139
L__LOOP1360:
	JMP        L__LOOP1136
L__LOOP1139:
;MyProject.mbas,580 :: 		end sub
L_end_LOOP1:
	POP        R5
	POP        R4
	RET
; end of _LOOP1

_LOOP11:

;MyProject.mbas,583 :: 		sub procedure LOOP11 (DIM J AS integer)
;MyProject.mbas,584 :: 		K=150
	PUSH       R4
	PUSH       R5
	LDI        R27, 150
	STS        _K+0, R27
	LDI        R27, 0
	STS        _K+1, R27
;MyProject.mbas,585 :: 		kk=255 -k
	LDI        R27, 105
	STS        _kk+0, R27
	LDI        R27, 0
	STS        _kk+1, R27
;MyProject.mbas,588 :: 		do
L__LOOP11144:
;MyProject.mbas,590 :: 		PROGRAM9(K,dl2)
	PUSH       R3
	PUSH       R2
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM9+0
;MyProject.mbas,591 :: 		PROGRAM2(kk,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _kk+0
	LDS        R3, _kk+1
	CALL       _PROGRAM2+0
;MyProject.mbas,592 :: 		PROGRAM4(k,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM4+0
;MyProject.mbas,593 :: 		PROGRAM10(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM10+0
;MyProject.mbas,594 :: 		PROGRAM5(k,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM5+0
;MyProject.mbas,595 :: 		PROGRAM6(k,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM6+0
;MyProject.mbas,596 :: 		PROGRAM7(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM7+0
;MyProject.mbas,597 :: 		PROGRAM8(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM8+0
;MyProject.mbas,598 :: 		PROGRAM11(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM11+0
;MyProject.mbas,600 :: 		PROGRAM13(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM13+0
	POP        R2
	POP        R3
;MyProject.mbas,601 :: 		K=K+3
	LDS        R16, _K+0
	LDS        R17, _K+1
	SUBI       R16, 253
	SBCI       R17, 255
	STS        _K+0, R16
	STS        _K+1, R17
;MyProject.mbas,602 :: 		kk=kk - 3
	LDS        R16, _kk+0
	LDS        R17, _kk+1
	SUBI       R16, 3
	SBCI       R17, 0
	STS        _kk+0, R16
	STS        _kk+1, R17
;MyProject.mbas,607 :: 		if mode<>1 then
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__LOOP11362
	CPI        R16, 1
L__LOOP11362:
	BRNE       L__LOOP11363
	JMP        L__LOOP11150
L__LOOP11363:
;MyProject.mbas,608 :: 		break
	JMP        L__LOOP11146
L__LOOP11150:
;MyProject.mbas,611 :: 		loop until K >= 255
	LDS        R18, _K+0
	LDS        R19, _K+1
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__LOOP11364
	JMP        L__LOOP11147
L__LOOP11364:
	JMP        L__LOOP11144
L__LOOP11147:
L__LOOP11146:
;MyProject.mbas,612 :: 		K=170
	LDI        R27, 170
	STS        _K+0, R27
	LDI        R27, 0
	STS        _K+1, R27
;MyProject.mbas,613 :: 		kk=255-k
	LDI        R27, 85
	STS        _kk+0, R27
	LDI        R27, 0
	STS        _kk+1, R27
;MyProject.mbas,614 :: 		do
L__LOOP11152:
;MyProject.mbas,616 :: 		PROGRAM9(K,dl2)
	PUSH       R3
	PUSH       R2
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM9+0
;MyProject.mbas,618 :: 		PROGRAM4(k,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM4+0
;MyProject.mbas,620 :: 		PROGRAM5(k,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM5+0
;MyProject.mbas,622 :: 		PROGRAM7(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM7+0
;MyProject.mbas,624 :: 		PROGRAM11(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM11+0
	POP        R2
	POP        R3
;MyProject.mbas,625 :: 		K=K+1
	LDS        R16, _K+0
	LDS        R17, _K+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _K+0, R16
	STS        _K+1, R17
;MyProject.mbas,626 :: 		kk=kk - 1
	LDS        R16, _kk+0
	LDS        R17, _kk+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _kk+0, R16
	STS        _kk+1, R17
;MyProject.mbas,627 :: 		if mode<>1 then
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__LOOP11365
	CPI        R16, 1
L__LOOP11365:
	BRNE       L__LOOP11366
	JMP        L__LOOP11158
L__LOOP11366:
;MyProject.mbas,628 :: 		break
	JMP        L__LOOP11154
L__LOOP11158:
;MyProject.mbas,631 :: 		loop until K >= 255
	LDS        R18, _K+0
	LDS        R19, _K+1
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__LOOP11367
	JMP        L__LOOP11155
L__LOOP11367:
	JMP        L__LOOP11152
L__LOOP11155:
L__LOOP11154:
;MyProject.mbas,632 :: 		K=190
	LDI        R27, 190
	STS        _K+0, R27
	LDI        R27, 0
	STS        _K+1, R27
;MyProject.mbas,633 :: 		kk=255-k
	LDI        R27, 65
	STS        _kk+0, R27
	LDI        R27, 0
	STS        _kk+1, R27
;MyProject.mbas,634 :: 		do
L__LOOP11160:
;MyProject.mbas,637 :: 		PROGRAM2(kk,dl2)
	PUSH       R3
	PUSH       R2
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _kk+0
	LDS        R3, _kk+1
	CALL       _PROGRAM2+0
;MyProject.mbas,641 :: 		PROGRAM6(k,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM6+0
;MyProject.mbas,644 :: 		PROGRAM11(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM11+0
	POP        R2
	POP        R3
;MyProject.mbas,645 :: 		K=K+10
	LDS        R16, _K+0
	LDS        R17, _K+1
	SUBI       R16, 246
	SBCI       R17, 255
	STS        _K+0, R16
	STS        _K+1, R17
;MyProject.mbas,646 :: 		kk=kk - 10
	LDS        R16, _kk+0
	LDS        R17, _kk+1
	SUBI       R16, 10
	SBCI       R17, 0
	STS        _kk+0, R16
	STS        _kk+1, R17
;MyProject.mbas,647 :: 		if mode<>1 then
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__LOOP11368
	CPI        R16, 1
L__LOOP11368:
	BRNE       L__LOOP11369
	JMP        L__LOOP11166
L__LOOP11369:
;MyProject.mbas,648 :: 		break
	JMP        L__LOOP11162
L__LOOP11166:
;MyProject.mbas,651 :: 		loop until K >= 255
	LDS        R18, _K+0
	LDS        R19, _K+1
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__LOOP11370
	JMP        L__LOOP11163
L__LOOP11370:
	JMP        L__LOOP11160
L__LOOP11163:
L__LOOP11162:
;MyProject.mbas,652 :: 		K=180
	LDI        R27, 180
	STS        _K+0, R27
	LDI        R27, 0
	STS        _K+1, R27
;MyProject.mbas,653 :: 		kk=255-180
	LDI        R27, 75
	STS        _kk+0, R27
	LDI        R27, 0
	STS        _kk+1, R27
;MyProject.mbas,654 :: 		do
L__LOOP11168:
;MyProject.mbas,655 :: 		PROGRAM1(k,dl2)
	PUSH       R3
	PUSH       R2
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM1+0
;MyProject.mbas,657 :: 		PROGRAM2(kk,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _kk+0
	LDS        R3, _kk+1
	CALL       _PROGRAM2+0
;MyProject.mbas,659 :: 		PROGRAM10(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM10+0
;MyProject.mbas,661 :: 		PROGRAM6(k,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM6+0
;MyProject.mbas,663 :: 		PROGRAM8(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM8+0
;MyProject.mbas,664 :: 		PROGRAM11(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM11+0
	POP        R2
	POP        R3
;MyProject.mbas,665 :: 		K=K+1
	LDS        R16, _K+0
	LDS        R17, _K+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _K+0, R16
	STS        _K+1, R17
;MyProject.mbas,666 :: 		kk=kk - 1
	LDS        R16, _kk+0
	LDS        R17, _kk+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _kk+0, R16
	STS        _kk+1, R17
;MyProject.mbas,667 :: 		if mode<>1 then
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__LOOP11371
	CPI        R16, 1
L__LOOP11371:
	BRNE       L__LOOP11372
	JMP        L__LOOP11174
L__LOOP11372:
;MyProject.mbas,668 :: 		break
	JMP        L__LOOP11170
L__LOOP11174:
;MyProject.mbas,670 :: 		loop until K >= 255
	LDS        R18, _K+0
	LDS        R19, _K+1
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__LOOP11373
	JMP        L__LOOP11171
L__LOOP11373:
	JMP        L__LOOP11168
L__LOOP11171:
L__LOOP11170:
;MyProject.mbas,672 :: 		end sub
L_end_LOOP11:
	POP        R5
	POP        R4
	RET
; end of _LOOP11

_loop22:

;MyProject.mbas,674 :: 		sub procedure loop22(dim k2 as integer)
;MyProject.mbas,675 :: 		K=k2
	PUSH       R4
	PUSH       R5
	STS        _K+0, R2
	STS        _K+1, R3
;MyProject.mbas,677 :: 		kk=255 -k
	LDI        R16, 255
	LDI        R17, 0
	SUB        R16, R2
	SBC        R17, R3
	STS        _kk+0, R16
	STS        _kk+1, R17
;MyProject.mbas,680 :: 		do
L__loop22177:
;MyProject.mbas,683 :: 		PROGRAM2(kk,dl2)
	PUSH       R3
	PUSH       R2
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _kk+0
	LDS        R3, _kk+1
	CALL       _PROGRAM2+0
;MyProject.mbas,687 :: 		PROGRAM6(k,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM6+0
;MyProject.mbas,691 :: 		PROGRAM12(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM12+0
	POP        R2
	POP        R3
;MyProject.mbas,693 :: 		K=K+3
	LDS        R16, _K+0
	LDS        R17, _K+1
	SUBI       R16, 253
	SBCI       R17, 255
	STS        _K+0, R16
	STS        _K+1, R17
;MyProject.mbas,694 :: 		kk=kk - 3
	LDS        R16, _kk+0
	LDS        R17, _kk+1
	SUBI       R16, 3
	SBCI       R17, 0
	STS        _kk+0, R16
	STS        _kk+1, R17
;MyProject.mbas,699 :: 		if mode<>2 then
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__loop22375
	CPI        R16, 2
L__loop22375:
	BRNE       L__loop22376
	JMP        L__loop22183
L__loop22376:
;MyProject.mbas,700 :: 		break
	JMP        L__loop22179
L__loop22183:
;MyProject.mbas,702 :: 		loop until K >= 255
	LDS        R18, _K+0
	LDS        R19, _K+1
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__loop22377
	JMP        L__loop22180
L__loop22377:
	JMP        L__loop22177
L__loop22180:
L__loop22179:
;MyProject.mbas,703 :: 		K=170
	LDI        R27, 170
	STS        _K+0, R27
	LDI        R27, 0
	STS        _K+1, R27
;MyProject.mbas,704 :: 		kk=255-170
	LDI        R27, 85
	STS        _kk+0, R27
	LDI        R27, 0
	STS        _kk+1, R27
;MyProject.mbas,705 :: 		do
L__loop22185:
;MyProject.mbas,706 :: 		if mode<>2 then
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__loop22378
	CPI        R16, 2
L__loop22378:
	BRNE       L__loop22379
	JMP        L__loop22191
L__loop22379:
;MyProject.mbas,707 :: 		break
	JMP        L__loop22187
L__loop22191:
;MyProject.mbas,710 :: 		PROGRAM9(K,dl2)
	PUSH       R3
	PUSH       R2
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM9+0
	POP        R2
	POP        R3
;MyProject.mbas,719 :: 		K=K+1
	LDS        R16, _K+0
	LDS        R17, _K+1
	MOVW       R18, R16
	SUBI       R18, 255
	SBCI       R19, 255
	STS        _K+0, R18
	STS        _K+1, R19
;MyProject.mbas,720 :: 		kk=kk - 1
	LDS        R16, _kk+0
	LDS        R17, _kk+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _kk+0, R16
	STS        _kk+1, R17
;MyProject.mbas,722 :: 		loop until K >= 255
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__loop22380
	JMP        L__loop22188
L__loop22380:
	JMP        L__loop22185
L__loop22188:
L__loop22187:
;MyProject.mbas,723 :: 		K=190
	LDI        R27, 190
	STS        _K+0, R27
	LDI        R27, 0
	STS        _K+1, R27
;MyProject.mbas,724 :: 		kk=255-190
	LDI        R27, 65
	STS        _kk+0, R27
	LDI        R27, 0
	STS        _kk+1, R27
;MyProject.mbas,725 :: 		do
L__loop22193:
;MyProject.mbas,726 :: 		if mode<>2 then
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__loop22381
	CPI        R16, 2
L__loop22381:
	BRNE       L__loop22382
	JMP        L__loop22199
L__loop22382:
;MyProject.mbas,727 :: 		break
	JMP        L__loop22195
L__loop22199:
;MyProject.mbas,739 :: 		PROGRAM11(K,dl2)
	PUSH       R3
	PUSH       R2
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM11+0
	POP        R2
	POP        R3
;MyProject.mbas,740 :: 		K=K+10
	LDS        R16, _K+0
	LDS        R17, _K+1
	MOVW       R18, R16
	SUBI       R18, 246
	SBCI       R19, 255
	STS        _K+0, R18
	STS        _K+1, R19
;MyProject.mbas,741 :: 		kk=kk - 10
	LDS        R16, _kk+0
	LDS        R17, _kk+1
	SUBI       R16, 10
	SBCI       R17, 0
	STS        _kk+0, R16
	STS        _kk+1, R17
;MyProject.mbas,742 :: 		loop until K >= 255
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__loop22383
	JMP        L__loop22196
L__loop22383:
	JMP        L__loop22193
L__loop22196:
L__loop22195:
;MyProject.mbas,743 :: 		K=180
	LDI        R27, 180
	STS        _K+0, R27
	LDI        R27, 0
	STS        _K+1, R27
;MyProject.mbas,744 :: 		kk=255-180
	LDI        R27, 75
	STS        _kk+0, R27
	LDI        R27, 0
	STS        _kk+1, R27
;MyProject.mbas,745 :: 		do
L__loop22201:
;MyProject.mbas,746 :: 		if mode<>2 then
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__loop22384
	CPI        R16, 2
L__loop22384:
	BRNE       L__loop22385
	JMP        L__loop22207
L__loop22385:
;MyProject.mbas,747 :: 		break
	JMP        L__loop22203
L__loop22207:
;MyProject.mbas,750 :: 		PROGRAM1(k,dl2)
	PUSH       R3
	PUSH       R2
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM1+0
;MyProject.mbas,752 :: 		PROGRAM2(kk,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _kk+0
	LDS        R3, _kk+1
	CALL       _PROGRAM2+0
;MyProject.mbas,754 :: 		PROGRAM10(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM10+0
;MyProject.mbas,756 :: 		PROGRAM6(k,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM6+0
;MyProject.mbas,758 :: 		PROGRAM8(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM8+0
	POP        R2
	POP        R3
;MyProject.mbas,760 :: 		K=K+1
	LDS        R16, _K+0
	LDS        R17, _K+1
	MOVW       R18, R16
	SUBI       R18, 255
	SBCI       R19, 255
	STS        _K+0, R18
	STS        _K+1, R19
;MyProject.mbas,761 :: 		kk=kk - 1
	LDS        R16, _kk+0
	LDS        R17, _kk+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _kk+0, R16
	STS        _kk+1, R17
;MyProject.mbas,763 :: 		loop until K >= 255
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__loop22386
	JMP        L__loop22204
L__loop22386:
	JMP        L__loop22201
L__loop22204:
L__loop22203:
;MyProject.mbas,765 :: 		end sub
L_end_loop22:
	POP        R5
	POP        R4
	RET
; end of _loop22

_loop33:

;MyProject.mbas,768 :: 		sub procedure loop33(dim k2 as integer)
;MyProject.mbas,769 :: 		K=k2
	PUSH       R4
	PUSH       R5
	STS        _K+0, R2
	STS        _K+1, R3
;MyProject.mbas,771 :: 		kk=255
	LDI        R27, 255
	STS        _kk+0, R27
	LDI        R27, 0
	STS        _kk+1, R27
;MyProject.mbas,774 :: 		do
L__loop33210:
;MyProject.mbas,785 :: 		PROGRAM12(K,dl2)
	PUSH       R3
	PUSH       R2
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM12+0
	POP        R2
	POP        R3
;MyProject.mbas,787 :: 		K=K+3
	LDS        R16, _K+0
	LDS        R17, _K+1
	SUBI       R16, 253
	SBCI       R17, 255
	STS        _K+0, R16
	STS        _K+1, R17
;MyProject.mbas,788 :: 		kk=kk - 3
	LDS        R16, _kk+0
	LDS        R17, _kk+1
	SUBI       R16, 3
	SBCI       R17, 0
	STS        _kk+0, R16
	STS        _kk+1, R17
;MyProject.mbas,793 :: 		if mode<>2 then
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__loop33388
	CPI        R16, 2
L__loop33388:
	BRNE       L__loop33389
	JMP        L__loop33216
L__loop33389:
;MyProject.mbas,794 :: 		break
	JMP        L__loop33212
L__loop33216:
;MyProject.mbas,796 :: 		loop until K >= 255
	LDS        R18, _K+0
	LDS        R19, _K+1
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__loop33390
	JMP        L__loop33213
L__loop33390:
	JMP        L__loop33210
L__loop33213:
L__loop33212:
;MyProject.mbas,797 :: 		K=170
	LDI        R27, 170
	STS        _K+0, R27
	LDI        R27, 0
	STS        _K+1, R27
;MyProject.mbas,798 :: 		kk=255-170
	LDI        R27, 85
	STS        _kk+0, R27
	LDI        R27, 0
	STS        _kk+1, R27
;MyProject.mbas,799 :: 		do
L__loop33218:
;MyProject.mbas,800 :: 		if mode<>3 then
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__loop33391
	CPI        R16, 3
L__loop33391:
	BRNE       L__loop33392
	JMP        L__loop33224
L__loop33392:
;MyProject.mbas,801 :: 		break
	JMP        L__loop33220
L__loop33224:
;MyProject.mbas,804 :: 		PROGRAM9(K,dl2)
	PUSH       R3
	PUSH       R2
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM9+0
	POP        R2
	POP        R3
;MyProject.mbas,813 :: 		K=K+1
	LDS        R16, _K+0
	LDS        R17, _K+1
	MOVW       R18, R16
	SUBI       R18, 255
	SBCI       R19, 255
	STS        _K+0, R18
	STS        _K+1, R19
;MyProject.mbas,814 :: 		kk=kk - 1
	LDS        R16, _kk+0
	LDS        R17, _kk+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _kk+0, R16
	STS        _kk+1, R17
;MyProject.mbas,816 :: 		loop until K >= 255
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__loop33393
	JMP        L__loop33221
L__loop33393:
	JMP        L__loop33218
L__loop33221:
L__loop33220:
;MyProject.mbas,817 :: 		K=190
	LDI        R27, 190
	STS        _K+0, R27
	LDI        R27, 0
	STS        _K+1, R27
;MyProject.mbas,818 :: 		kk=255-k
	LDI        R27, 65
	STS        _kk+0, R27
	LDI        R27, 0
	STS        _kk+1, R27
;MyProject.mbas,819 :: 		do
L__loop33226:
;MyProject.mbas,820 :: 		if mode<>3 then
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__loop33394
	CPI        R16, 3
L__loop33394:
	BRNE       L__loop33395
	JMP        L__loop33232
L__loop33395:
;MyProject.mbas,821 :: 		break
	JMP        L__loop33228
L__loop33232:
;MyProject.mbas,833 :: 		PROGRAM11(K,dl2)
	PUSH       R3
	PUSH       R2
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM11+0
	POP        R2
	POP        R3
;MyProject.mbas,834 :: 		K=K+10
	LDS        R16, _K+0
	LDS        R17, _K+1
	MOVW       R18, R16
	SUBI       R18, 246
	SBCI       R19, 255
	STS        _K+0, R18
	STS        _K+1, R19
;MyProject.mbas,835 :: 		kk=kk - 10
	LDS        R16, _kk+0
	LDS        R17, _kk+1
	SUBI       R16, 10
	SBCI       R17, 0
	STS        _kk+0, R16
	STS        _kk+1, R17
;MyProject.mbas,836 :: 		loop until K >= 255
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__loop33396
	JMP        L__loop33229
L__loop33396:
	JMP        L__loop33226
L__loop33229:
L__loop33228:
;MyProject.mbas,837 :: 		K=180
	LDI        R27, 180
	STS        _K+0, R27
	LDI        R27, 0
	STS        _K+1, R27
;MyProject.mbas,838 :: 		kk=255-k
	LDI        R27, 75
	STS        _kk+0, R27
	LDI        R27, 0
	STS        _kk+1, R27
;MyProject.mbas,839 :: 		do
L__loop33234:
;MyProject.mbas,840 :: 		if mode<>3 then
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__loop33397
	CPI        R16, 3
L__loop33397:
	BRNE       L__loop33398
	JMP        L__loop33240
L__loop33398:
;MyProject.mbas,841 :: 		break
	JMP        L__loop33236
L__loop33240:
;MyProject.mbas,844 :: 		PROGRAM1(k,dl2)
	PUSH       R3
	PUSH       R2
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM1+0
;MyProject.mbas,846 :: 		PROGRAM2(kk,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _kk+0
	LDS        R3, _kk+1
	CALL       _PROGRAM2+0
;MyProject.mbas,848 :: 		PROGRAM10(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM10+0
;MyProject.mbas,850 :: 		PROGRAM6(k,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM6+0
;MyProject.mbas,852 :: 		PROGRAM8(K,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _PROGRAM8+0
	POP        R2
	POP        R3
;MyProject.mbas,854 :: 		K=K+1
	LDS        R16, _K+0
	LDS        R17, _K+1
	MOVW       R18, R16
	SUBI       R18, 255
	SBCI       R19, 255
	STS        _K+0, R18
	STS        _K+1, R19
;MyProject.mbas,855 :: 		kk=kk - 1
	LDS        R16, _kk+0
	LDS        R17, _kk+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _kk+0, R16
	STS        _kk+1, R17
;MyProject.mbas,857 :: 		loop until K >= 255
	LDI        R16, 255
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__loop33399
	JMP        L__loop33237
L__loop33399:
	JMP        L__loop33234
L__loop33237:
L__loop33236:
;MyProject.mbas,859 :: 		end sub
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

;MyProject.mbas,862 :: 		sub procedure interrupt_ISR () org IVT_ADDR_INT0            ''// Interrupt rutine
;MyProject.mbas,865 :: 		SREG_I_bit = 0                                   '' // Disable Interrupts
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	IN         R27, SREG_I_bit+0
	CBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,868 :: 		INTF0_bit=0                                                  '  // Clear interrupt flag
	IN         R27, INTF0_bit+0
	CBR        R27, BitMask(INTF0_bit+0)
	OUT        INTF0_bit+0, R27
;MyProject.mbas,869 :: 		INT0_bit = 0
	IN         R27, INT0_bit+0
	CBR        R27, BitMask(INT0_bit+0)
	OUT        INT0_bit+0, R27
;MyProject.mbas,870 :: 		oldstate_3=0
	LDS        R27, _oldstate_3+0
	CBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
;MyProject.mbas,871 :: 		if (Button(PORTD, 2, 0.1, 0)) then    ' Detect logical one up key
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
	BRNE       L__interrupt_ISR401
	JMP        L__interrupt_ISR244
L__interrupt_ISR401:
;MyProject.mbas,872 :: 		oldstate_3 = 1                      ' Update flag
	LDS        R27, _oldstate_3+0
	SBR        R27, BitMask(_oldstate_3+0)
	STS        _oldstate_3+0, R27
L__interrupt_ISR244:
;MyProject.mbas,874 :: 		if (oldstate_3 and Button(PIND, 2,0.1, 1)) then
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
	BRNE       L__interrupt_ISR402
	JMP        L__interrupt_ISR247
L__interrupt_ISR402:
;MyProject.mbas,875 :: 		if (mode=4) then
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__interrupt_ISR403
	CPI        R16, 4
L__interrupt_ISR403:
	BREQ       L__interrupt_ISR404
	JMP        L__interrupt_ISR250
L__interrupt_ISR404:
;MyProject.mbas,876 :: 		mode=1
	LDI        R27, 1
	STS        _mode+0, R27
	LDI        R27, 0
	STS        _mode+1, R27
	JMP        L__interrupt_ISR251
;MyProject.mbas,877 :: 		else
L__interrupt_ISR250:
;MyProject.mbas,878 :: 		mode=mode+1
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _mode+0, R16
	STS        _mode+1, R17
;MyProject.mbas,879 :: 		end if
L__interrupt_ISR251:
;MyProject.mbas,881 :: 		case 1
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__interrupt_ISR405
	CPI        R16, 1
L__interrupt_ISR405:
	BREQ       L__interrupt_ISR406
	JMP        L__interrupt_ISR255
L__interrupt_ISR406:
;MyProject.mbas,882 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,883 :: 		inttostr(mode,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _mode+0
	LDS        R3, _mode+1
	CALL       _IntToStr+0
;MyProject.mbas,884 :: 		LCD_Out(2,9, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,885 :: 		LCD_Out(1,1, "Mode : Dancing")  ''Show on LCD
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
;MyProject.mbas,886 :: 		Delay_mS(100)
	LDI        R18, 3
	LDI        R17, 8
	LDI        R16, 120
L__interrupt_ISR256:
	DEC        R16
	BRNE       L__interrupt_ISR256
	DEC        R17
	BRNE       L__interrupt_ISR256
	DEC        R18
	BRNE       L__interrupt_ISR256
	JMP        L__interrupt_ISR252
L__interrupt_ISR255:
;MyProject.mbas,887 :: 		case 2
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__interrupt_ISR407
	CPI        R16, 2
L__interrupt_ISR407:
	BREQ       L__interrupt_ISR408
	JMP        L__interrupt_ISR260
L__interrupt_ISR408:
;MyProject.mbas,888 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,889 :: 		inttostr(mode,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _mode+0
	LDS        R3, _mode+1
	CALL       _IntToStr+0
;MyProject.mbas,890 :: 		LCD_Out(2,9, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,891 :: 		LCD_Out(1,1, "Mode : Clasic")  ''Show on LCD
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
;MyProject.mbas,892 :: 		Delay_mS(100)
	LDI        R18, 3
	LDI        R17, 8
	LDI        R16, 120
L__interrupt_ISR261:
	DEC        R16
	BRNE       L__interrupt_ISR261
	DEC        R17
	BRNE       L__interrupt_ISR261
	DEC        R18
	BRNE       L__interrupt_ISR261
	JMP        L__interrupt_ISR252
L__interrupt_ISR260:
;MyProject.mbas,893 :: 		case 3
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__interrupt_ISR409
	CPI        R16, 3
L__interrupt_ISR409:
	BREQ       L__interrupt_ISR410
	JMP        L__interrupt_ISR265
L__interrupt_ISR410:
;MyProject.mbas,894 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,895 :: 		inttostr(mode,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _mode+0
	LDS        R3, _mode+1
	CALL       _IntToStr+0
;MyProject.mbas,896 :: 		LCD_Out(2,9, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,897 :: 		LCD_Out(1,1, "Mode : warm")  ''Show on LCD
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
;MyProject.mbas,898 :: 		Delay_mS(100)
	LDI        R18, 3
	LDI        R17, 8
	LDI        R16, 120
L__interrupt_ISR266:
	DEC        R16
	BRNE       L__interrupt_ISR266
	DEC        R17
	BRNE       L__interrupt_ISR266
	DEC        R18
	BRNE       L__interrupt_ISR266
	JMP        L__interrupt_ISR252
L__interrupt_ISR265:
;MyProject.mbas,900 :: 		case 4
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__interrupt_ISR411
	CPI        R16, 4
L__interrupt_ISR411:
	BREQ       L__interrupt_ISR412
	JMP        L__interrupt_ISR270
L__interrupt_ISR412:
;MyProject.mbas,901 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,902 :: 		inttostr(mode,txt)
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDS        R2, _mode+0
	LDS        R3, _mode+1
	CALL       _IntToStr+0
;MyProject.mbas,903 :: 		LCD_Out(2,9, txt)  ''Show on LCD
	LDI        R27, #lo_addr(_txt+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_txt+0)
	MOV        R5, R27
	LDI        R27, 9
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _Lcd_Out+0
;MyProject.mbas,904 :: 		LCD_Out(1,1, "Mode : echolazier")  ''Show on LCD
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
;MyProject.mbas,905 :: 		Delay_mS(100)
	LDI        R18, 3
	LDI        R17, 8
	LDI        R16, 120
L__interrupt_ISR271:
	DEC        R16
	BRNE       L__interrupt_ISR271
	DEC        R17
	BRNE       L__interrupt_ISR271
	DEC        R18
	BRNE       L__interrupt_ISR271
	JMP        L__interrupt_ISR252
L__interrupt_ISR270:
L__interrupt_ISR252:
;MyProject.mbas,907 :: 		end select
L__interrupt_ISR247:
;MyProject.mbas,910 :: 		INT0_bit = 1
	IN         R27, INT0_bit+0
	SBR        R27, BitMask(INT0_bit+0)
	OUT        INT0_bit+0, R27
;MyProject.mbas,912 :: 		SREG_I_bit = 1
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,914 :: 		end sub
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

;MyProject.mbas,918 :: 		dim counter as byte
;MyProject.mbas,926 :: 		WHILE TRUE
L__Timer0Overflow_ISR275:
;MyProject.mbas,928 :: 		PORTB= 0X00
	LDI        R27, 0
	OUT        PORTB+0, R27
;MyProject.mbas,929 :: 		WEND
	JMP        L__Timer0Overflow_ISR275
;MyProject.mbas,930 :: 		end sub
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

;MyProject.mbas,933 :: 		main:
;MyProject.mbas,934 :: 		Lcd_Init()
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	CALL       _Lcd_Init+0
;MyProject.mbas,935 :: 		Lcd_Cmd(_LCD_CLEAR)               ' Clear display
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,936 :: 		Lcd_Cmd(_LCD_CURSOR_OFF)
	LDI        R27, 12
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;MyProject.mbas,937 :: 		Lcd_Out(1,1,"Waiting For ")
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
;MyProject.mbas,938 :: 		Lcd_Out(2,1,"To Be Pressed")
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
;MyProject.mbas,939 :: 		PWM_Initialize ()
	CALL       _PWM_Initialize+0
;MyProject.mbas,940 :: 		DDD2_bit = 0                                        ' set Button pin as input
	IN         R27, DDD2_bit+0
	CBR        R27, BitMask(DDD2_bit+0)
	OUT        DDD2_bit+0, R27
;MyProject.mbas,942 :: 		ISC00_bit = 1                                    '' // Set interrupts to be detected on rising edge
	IN         R27, ISC00_bit+0
	SBR        R27, BitMask(ISC00_bit+0)
	OUT        ISC00_bit+0, R27
;MyProject.mbas,944 :: 		SREG_I_bit = 0
	IN         R27, SREG_I_bit+0
	CBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,946 :: 		SREG_I_bit = 1
	IN         R27, SREG_I_bit+0
	SBR        R27, BitMask(SREG_I_bit+0)
	OUT        SREG_I_bit+0, R27
;MyProject.mbas,948 :: 		INT0_bit = 1
	IN         R27, INT0_bit+0
	SBR        R27, BitMask(INT0_bit+0)
	OUT        INT0_bit+0, R27
;MyProject.mbas,951 :: 		mode=1
	LDI        R27, 1
	STS        _mode+0, R27
	LDI        R27, 0
	STS        _mode+1, R27
;MyProject.mbas,957 :: 		while TRUE
L__main281:
;MyProject.mbas,964 :: 		case 1
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__main415
	CPI        R16, 1
L__main415:
	BREQ       L__main416
	JMP        L__main288
L__main416:
;MyProject.mbas,965 :: 		K=0
	LDI        R27, 0
	STS        _K+0, R27
	STS        _K+1, R27
;MyProject.mbas,966 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,967 :: 		LOOP11(k)
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _LOOP11+0
	JMP        L__main285
L__main288:
;MyProject.mbas,968 :: 		case 2  ''######## warm
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__main417
	CPI        R16, 2
L__main417:
	BREQ       L__main418
	JMP        L__main291
L__main418:
;MyProject.mbas,969 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,970 :: 		loop22(K)
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _loop22+0
	JMP        L__main285
L__main291:
;MyProject.mbas,971 :: 		case 3
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__main419
	CPI        R16, 3
L__main419:
	BREQ       L__main420
	JMP        L__main294
L__main420:
;MyProject.mbas,972 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,973 :: 		loop33(K)
	LDS        R2, _K+0
	LDS        R3, _K+1
	CALL       _loop33+0
	JMP        L__main285
L__main294:
;MyProject.mbas,974 :: 		case 4
	LDS        R16, _mode+0
	LDS        R17, _mode+1
	CPI        R17, 0
	BRNE       L__main421
	CPI        R16, 4
L__main421:
	BREQ       L__main422
	JMP        L__main297
L__main422:
;MyProject.mbas,975 :: 		Lcd_0()
	CALL       _Lcd_0+0
;MyProject.mbas,976 :: 		PROGRAM8(0,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	CLR        R2
	CLR        R3
	CALL       _PROGRAM8+0
	JMP        L__main285
L__main297:
;MyProject.mbas,978 :: 		PROGRAM8(0,dl2)
	LDS        R4, _dl2+0
	LDS        R5, _dl2+1
	CLR        R2
	CLR        R3
	CALL       _PROGRAM8+0
L__main285:
;MyProject.mbas,980 :: 		wend
	JMP        L__main281
L_end_main:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
