.model large
.stack 1000h
.data

; Welcome and menu messages
a1 db 10,13,'                   **************$'
a2 db 10,13,'                   *                 Welcome              *$'
a3 db 10,13,'                   *                    To                *$'
a4 db 10,13,'                   *                    UMT               *$'
a5 db 10,13,'                   *                 Coffee Shop          *$'
a6 db 10,13,'                   **************$'
a7 db 10,13,'                    Menu---$'
a8 db 10,13,'                    Enter Your Choice: $'
a19 db 10,13,'                          Enter 1 to Display Menu: $'
a34 db 10,13,'                            Pick Your Item: $'
a35 db 10,13,'                            Enter Quantity: $'
a36 db 10,13,'                            Invalid Input !! $'
a37 db 10,13,'                            Total Price: $'
a38 db 10,13,'                    1.Menu: $'
a39 db 10,13,'                    2.Exit: $'

; Menu Items
a9  db 10,13,'                        1. Espresso - Rs.100$'
a10 db 10,13,'                        2. Cappuccino - Rs.150$'
a11 db 10,13,'                        3. Latte - Rs.200$'
a12 db 10,13,'                        4. Mocha - Rs.250$'
a13 db 10,13,'                        5. Black Coffee - Rs.80$'
a14 db 10,13,'                        6. Tea - Rs.60$' 
a15 db 10,13,'                        7. Chocolate Cake - Rs.120$'
a16 db 10,13,'                        8. CheeseCake - Rs.150$'

; Variable for storing the total price
total dw 0

.code
main proc

mov ax,@data
mov ds,ax

; Display welcome message
mov ah,9
lea dx,a1
int 21h
lea dx,a2
int 21h
lea dx,a3
int 21h
lea dx,a4
int 21h
lea dx,a5
int 21h
lea dx,a6
int 21h

; New line
mov ah,2
mov dl,0ah
int 21h
mov dl,0dh
int 21h

; Take input to start
mov ah,9
lea dx,a19
int 21h
mov ah,1
int 21h
mov bh,al
sub bh,48

cmp bh,1
je DisplayMenu
jmp Invalid

DisplayMenu:
; Display menu
mov ah,9
lea dx,a7
int 21h
lea dx,a9
int 21h
lea dx,a10
int 21h
lea dx,a11
int 21h
lea dx,a12
int 21h
lea dx,a13
int 21h 
lea dx,a14
int 21h
lea dx,a15
int 21h
lea dx,a16
int 21h

; Choose an item
lea dx,a8
int 21h
mov ah,1
int 21h
mov bh,al
sub bh,48

; Compute total based on choice
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
; Enter quantity and calculate total
lea dx,a35
mov ah,9
int 21h
mov ah,1
int 21h
sub al,48
mul bl
add [total], ax
jmp DisplayTotal

DisplayTotal:
    ; Display total price message
    lea dx, a37
    mov ah, 9
    int 21h

    ; Load total and convert to string
    mov ax, [total]
    mov bx, 10           ; divisor for conversion
    mov cx, 0            ; counter for digits

convert_loop:
    xor dx, dx           ; clear dx for div
    div bx               ; divide ax by 10, result in ax, remainder in dx
    add dl, '0'          ; convert remainder to ASCII
    push dx              ; push ASCII character onto stack
    inc cx               ; increase digit count
    test ax, ax          ; check if quotient is zero
    jnz convert_loop     ; continue loop if not zero

    ; Display converted number from stack
display_number:
    pop dx               ; pop characters off the stack in reverse order (LIFO)
    mov ah, 2
    int 21h              ; display character
    loop display_number  ; loop for the number of characters

    ; Display newline after total
    mov dl, 0dh
    mov ah, 2
    int 21h
    mov dl, 0ah
    int 21h

    jmp AfterTotal       ; Continue with the rest of the program

AfterTotal:
    ; Exit or menu
    lea dx, a38
    mov ah, 9
    int 21h
    lea dx, a39
    mov ah, 9
    int 21h
    lea dx, a8
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h
    sub al, 48
    cmp al, 1
    je DisplayMenu
    cmp al, 2
    je Exit

    jmp Invalid

Invalid:
    ; Handle invalid input
    mov ah, 9
    lea dx, a36
    int 21h
    jmp Exit

Exit:
    ; Exit program
    mov ah, 4Ch
    int 21h
    ret

main endp
end main