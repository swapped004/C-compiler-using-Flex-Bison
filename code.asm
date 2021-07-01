.MODEL SMALL
.STACK 100H
.DATA
print_var dw ?
ret_temp dw ?
	a1_1 dw ?
	t0 dw ?
	a1_2 dw ?
	b1_2 dw ?
	x1_2 dw ?
	t1 dw ?
	t2 dw ?
	t3 dw ?
	a1_3 dw ?
	b1_3 dw ?
	t4 dw ?
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
f PROC
	PUSH ax
	PUSH bx
	PUSH cx
	PUSH dx
	PUSH bp
	MOV bp,sp
;return 2*a;
	MOV ax,2
	MOV dx,[bp+12]
	MUL dx
	MOV t0,ax
	MOV ax,t0
	MOV ret_temp,ax
;a=9;
	MOV ax,9
	MOV [bp+12],ax
	POP bp
	POP dx
	POP cx
	POP bx
	POP ax
	RET 2
f endp
g PROC
	PUSH ax
	PUSH bx
	PUSH cx
	PUSH dx
	PUSH bp
	MOV bp,sp
;int x;
;x=f(a)+a+b;
	PUSH [bp+14]
	CALL f
	MOV ax,ret_temp
	MOV t1,ax
	MOV ax,t1
	ADD ax,[bp+14]
	MOV t2,ax
	MOV ax,t2
	ADD ax,[bp+12]
	MOV t3,ax
	MOV ax,t3
	MOV x1_2,ax
;return x;
	MOV ax,x1_2
	MOV ret_temp,ax
	POP bp
	POP dx
	POP cx
	POP bx
	POP ax
	RET 2
g endp
main proc
	mov ax,@data
	mov ds,ax


;int a,b;
;a=1;
	MOV ax,1
	MOV a1_3,ax
;b=2;
	MOV ax,2
	MOV b1_3,ax
;a=g(a,b);
	PUSH a1_3
	PUSH b1_3
	CALL g
	MOV ax,ret_temp
	MOV t4,ax
	MOV ax,t4
	MOV a1_3,ax
;printf(a);
	MOV ax,a1_3
	MOV print_var,ax
	CALL print
;return 0;
	MOV ax,0
	MOV ret_temp,ax
	MOV AH,4CH
	INT 21H
ENDP main
END main
