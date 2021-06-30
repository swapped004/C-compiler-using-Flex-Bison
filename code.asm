.MODEL SMALL
.STACK 100H
.DATA
print_var dw ?
ret_temp dw ?
	a1_1 dw ?
	b1_1 dw ?
	c1_1 dw 3 dup(?)
	t0 dw ?
	t1 dw ?
	t2 dw ?
	t4 dw ?
	t5 dw ?
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


	MOV t0,2
	MOV ax,3
	ADD t0,ax
	MOV ax,1
	MOV dx,t0
	MUL dx
	MOV t1,ax
	MOV ax,t1
	XOR dx,dx
	MOV bx,3
	DIV bx
	MOV t2,dx
	MOV ax,t2
	MOV a1_1,ax
	MOV ax,1
	CMP ax,5
	JL L0
	MOV cx,0
	JMP L1
L0:
	MOV cx,1
L1:
	MOV t3,cx
	MOV ax,t3
	MOV b1_1,ax
	MOV bx,0
	ADD bx,bx
	MOV ax,2
	MOV c1_1[bx],ax
main endp
