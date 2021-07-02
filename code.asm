.MODEL SMALL
.STACK 100H
.DATA
print_var dw ?
ret_temp dw ?
	a1_1 dw ?
	b1_1 dw ?
	c1_1 dw ?
	i1_1 dw ?
	t0 dw ?
	t1 dw ?
	t2 dw ?
	t3 dw ?
.CODE
print PROC
	push ax
	push bx
	push cx
	push dx
	mov ax, print_var
	mov bx, 10
	mov cx, 0
printLabel1:
	mov dx, 0
	div bx
	push dx
	inc cx
	cmp ax, 0
	jne printLabel1
	printLabel2:
	mov ah, 2
	pop dx
	add dl, '0'
	int 21h
	dec cx
	cmp cx, 0
	jne printLabel2
	mov dl, 0Ah
	int 21h
	mov dl, 0Dh
	int 21h
	pop dx
	pop cx
	pop bx
	pop ax
	ret
print endp
main proc
	mov ax,@data
	mov ds,ax


;int
;a,b,c,i;

;b=0;

	MOV ax,0
	MOV b1_1,ax
;c=1;

	MOV ax,1
	MOV c1_1,ax
;for(i=0;i<4;i++){
;a=3;
;while
;(a--){
;b++;
;}
;}

	MOV ax,0
	MOV i1_1,ax
L4:
	MOV ax,i1_1
	CMP ax,4
	JL L0
	MOV cx,0
	JMP L1
L0:
	MOV cx,1
L1:
	MOV t0,cx
	CMP t0,0
	JE L5
;a=3;

	MOV ax,3
	MOV a1_1,ax
;while
;(a--){
;b++;
;}

L2:
	MOV ax,a1_1
	MOV t2,ax
	DEC a1_1
	CMP t2,0
	JE L3
;b++;

	MOV ax,b1_1
	MOV t3,ax
	INC b1_1
	JMP L2
L3:
	MOV ax,i1_1
	MOV t1,ax
	INC i1_1
	JMP L4
L5:
;printf(a);

	MOV ax,a1_1
	MOV print_var,ax
	CALL print
;printf(b);

	MOV ax,b1_1
	MOV print_var,ax
	CALL print
;printf(c);

	MOV ax,c1_1
	MOV print_var,ax
	CALL print
	MOV AH,4CH
	INT 21H
ENDP main
END main
