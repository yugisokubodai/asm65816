arch snes.cpu
lorom

//7E05E0: char ID

//button
org $00C063
	JML newcode

//###########
org $B08010

newcode:
	PHX
	LDA $7E05E0
	TAX
	PHP
	JSR (move,x)
return:
	PLP
	PLX
	LDA $E2
	BIT #$1000
	BEQ _C0AD
	JML $00C06A

_C0AD:
	JML $00C0AD


move:
	dw thunder
	dw tiger
	dw ninja
	dw lip
	dw shogun
	dw gold
	dw silver
	dw zed
	
thunder:
	LDA $E2
	CMP #$0030
	BNE +
	LDA #$0030
	STA $7E06A0
	LDA #$008A
	STA $7E1A00	
	BRA end_thunder
+
	CMP #$0010
	BNE +
	LDA #$0003
	STA $7E1A00
	BRA end_thunder
+
	CMP #$0410
	BNE +
	LDA #$0008
	STA $7E1A00
	BRA end_thunder
+
	CMP #$0020
	BNE +
	LDA #$0004
	STA $7E1A00
	BRA end_thunder
+
	CMP #$2000
	BNE +
	LDA #$008A
	STA $7E1A00
	BRA end_thunder
+
end_thunder:
	RTS
tiger:
	LDA $E2
	CMP #$0030
	BNE +
	LDA #$0030
	STA $7E06A0
	LDA #$008A
	STA $7E1A00	
	BRA end_tiger
+
	CMP #$0020	//L
	BNE +
	LDA #$0004
	STA $7E1A00
	BRA end_tiger
+
	CMP #$0010	//R
	BNE +
	LDA #$0002
	STA $7E1A00
	BRA end_tiger
+
	CMP #$2000  //select
	BNE +
	LDA #$008A
	STA $7E1A00
+
end_tiger:	
	RTS
	
ninja:
	LDA $E2
	CMP #$0030
	BNE +
	LDA #$0030
	STA $7E06A0
	LDA #$008A
	STA $7E1A00	
	BRA end_ninja
+
	CMP #$0020	//L
	BNE +
	LDA #$0008
	STA $7E1A00
	BRA end_ninja
+
	CMP #$0010		//R
	BNE +
	LDA #$0007
	STA $7E1A00
	BRA end_ninja
+
	CMP #$2000
	BNE +
	LDA #$008A
	STA $7E1A00
+
end_ninja:
	RTS
	
lip:
	LDA $E2
	CMP #$0030
	BNE +
	LDA #$008A
	STA $7E1A00
	LDA #$0030
	STA $7E06A0
	BRA end_lip
+
end_lip:
	RTS
	
shogun:
	RTS

gold:
	RTS

silver:
	RTS
	
zed:
	LDA $E2
	CMP #$0030
	BNE +
	LDA #$0030
	STA $7E06A0
	LDA #$008A
	STA $7E1A00	
	BRA end_zed
+
	CMP #$0010
	BNE +
	LDA #$0002		//nage
	STA $7E1A00
	BRA end_zed
+
	CMP #$0020
	BNE +
	LDA #$0011	//kakushi
	STA $7E1A00
	BRA end_zed
+
	CMP #$0410
	BNE +
	LDA #$0005	//hand2
	STA $7E1A00
	BRA end_zed
+
	CMP #$0420
	BNE +
	LDA #$0008	//thunder
	STA $7E1A00
	BRA end_zed
+
	CMP #$0120
	BNE +
	LDA #$0009	//thunder 2
	STA $7E1A00
	BRA end_zed
+
	CMP #$0220
	BNE +
	LDA #$0004	//hand
	STA $7E1A00
	BRA end_zed
+
	CMP #$0110
	BNE +
	LDA #$4040
	STA $7E1A00
	BRA end_zed
+
end_zed:
	RTS
	