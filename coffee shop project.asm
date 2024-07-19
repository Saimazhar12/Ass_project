.model large
.stack 1000h
.data

;Welcome and menu messages
msg1 db 10,13,'                   ****************************************$'
msg2 db 10,13,'                   *                 Welcome              *$'
msg3 db 10,13,'                   *                    To                *$'
msg4 db 10,13,'                   *                    UMT               *$'
msg5 db 10,13,'                   *                 Coffee Shop          *$'
msg6 db 10,13,'                   ****************************************$'


msg7 db 10,13,'                    Menu---$'
msg8 db 10,13,'                    Enter Your Choice: $'
msg17 db 10,13,'                          Enter 1 to Display Menu: $'
msg18 db 10,13,'                            Pick Your Item: $'
msg19 db 10,13,'                            Enter Quantity: $'
msg20 db 10,13,'                            Invalid Input !! $'
msg21 db 10,13,'                            Total Price: $'
msg22 db 10,13,'                    1.Menu: $'
msg23 db 10,13,'                    2.Exit: $'     


;Menu Items
msg9  db 10,13,'                        1. Espresso - Rs.100$'
msg10 db 10,13,'                        2. Cappuccino - Rs.150$'
msg11 db 10,13,'                        3. Latte - Rs.200$'
msg12 db 10,13,'                        4. Mocha - Rs.250$'
msg13 db 10,13,'                        5. Black Coffee - Rs.80$'
msg14 db 10,13,'                        6. Tea - Rs.60$' 
msg15 db 10,13,'                        7. Chocolate Cake - Rs.120$'
msg16 db 10,13,'                        8. CheeseCake - Rs.150$'

;Variable for storing the total price
total dw 0

.code 
main proc

mov ax,@data
mov ds,ax

;Display welcome message
mov ah,09h
lea dx,msg1
int 21h
lea dx,msg2
int 21h
lea dx,msg3
int 21h
lea dx,msg4
int 21h
lea dx,msg5
int 21h
lea dx,msg6
int 21h

;New line
mov ah,02h
mov dl,0ah
int 21h
mov dl,0dh
int 21h

;Take input to start
mov ah,09h
lea dx,msg17
int 21h
mov ah,1
int 21h
mov bh,al
sub bh,48

cmp bh,1
je DisplayMenu
jmp Invalid

DisplayMenu:
;Display menu
mov ah,09h
lea dx,msg7
int 21h
lea dx,msg9
int 21h
lea dx,msg10
int 21h
lea dx,msg11
int 21h
lea dx,msg12
int 21h
lea dx,msg13
int 21h 
lea dx,msg14
int 21h
lea dx,msg15
int 21h
lea dx,msg16
int 21h

;Choose an item
lea dx,msg8
int 21h
mov ah,1
int 21h
mov bh,al
sub bh,48

;Compute total based on choice
cmp bh,1
je Item1

cmp bh,2
je Item2

cmp bh,3
je Item3

cmp bh,4
je Item4

cmp bh,5
je Item5

cmp bh,6
je Item6

cmp bh,7
je Item7

cmp bh,8
je Item8

jmp Invalid

Item1:
mov bl,100
jmp CalculateTotal

Item2:
mov bl,150
jmp CalculateTotal

Item3:
mov bl,200
jmp CalculateTotal

Item4:
mov bl,250
jmp CalculateTotal

Item5:
mov bl,80
jmp CalculateTotal

Item6:
mov bl,60
jmp CalculateTotal

Item7:
mov bl,120
jmp CalculateTotal

Item8:
mov bl,150
jmp CalculateTotal

CalculateTotal:
;Enter quantity and calculate total
lea dx,msg19
mov ah,09h
int 21h
mov ah,1
int 21h
sub al,48
mul bl
add [total], ax
jmp DisplayTotal

DisplayTotal:
;Display total price message
    lea dx, msg21
    mov ah, 09h
    int 21h

   
    mov ax, [total]
    mov bx, 10           
    mov cx, 0            

convert_loop:
    xor dx, dx           
    div bx              
    add dl, '0'         
    push dx             
    inc cx               
    test ax, ax          
    jnz convert_loop    

;Display converted number from stack
display_number:
    pop dx               
    mov ah, 02h
    int 21h              
    loop display_number  

;Display newline after total
    mov dl, 0dh
    mov ah, 2
    int 21h
    mov dl, 0ah
    int 21h

    jmp AfterTotal       

AfterTotal:
;Exit or menu
    lea dx, msg22
    mov ah, 09h
    int 21h
    lea dx, msg23
    mov ah, 09h
    int 21h
    lea dx, msg8
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, 48
    cmp al, 1
    je DisplayMenu
    cmp al, 2
    je Exit

    jmp Invalid

Invalid:
;Handle invalid input
    mov ah, 09h
    lea dx, msg20
    int 21h
    jmp Exit

Exit:
;Exit program
    mov ah, 4Ch
    int 21h
    

main endp
end main