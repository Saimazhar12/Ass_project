.model large
.stack 1000h
.data
welcome_1 dw 10,13,'                --------------------------------------- $'
welcome_2 dw 10,13,'                --               WELCOME             -- $'
welcome_3 dw 10,13,'                --                  TO               -- $'
welcome_4 dw 10,13,'                --        RESTAURENT MANAGEMENT      -- $'
welcome_5 dw 10,13,'                --                SYSTEM             -- $'
welcome_6 dw 10,13,'                --------------------------------------- $'

schedule_display dw 10,13,      'ENTER 1 FOR THE SCHEDULE: $'
breakfast dw 10,13,'    1-Breakfast $'
lunch dw 10,13,'    2-Lunch $'
dinner dw 10,13,'    3-Dinner $'
choice dw 10,13,'ENTER YOUR CHOICE: $'
pick dw 10,13,'PICK UP YOUR ITEM: $'
quantity dw 10,13,'ENTER QUANTITY: $'
total_price dw 10,13,'TOTAL PRICE: $'
continue dw 10,13,'ENTER "1" TO CONTINUE OR ENTER "2" TO EXIT $'
return dw 10,13,'     1-RETURN $'
exit dw 10,13,'     2-EXIT $'
wrong_input dw 10,13,'INVALID INPUT$'
schedule1 dw 10,13,'SCHEDULE $'


;BREAKFAST MENU
breakfast_menu1 db 10,13,'                  ***      Breakfast List      ***$'
breakfast_menu2 db 10,13,'                       1.PARATHA+DAAL              50 RS $'
breakfast_menu3 db 10,13,'                       2.PARATHA+VEGETABLE         50 RS $'
breakfast_menu4 db 10,13,'                       3.PARATHA+FRIED EGG         50 RS $'
breakfast_menu5 db 10,13,'                       4.PARATHA+CHICKEN CURRY     50 RS $'
breakfast_menu6 db 10,13,'                       5.CHICKEN PARAHTA           50 RS $'
breakfast_menu7 db 10,13,'                       6.NEHARI+NAAN               50 RS $'

;LUNCH MENU
lunch_menu1 db 10,13,'                  ***        Lunch List        ***$'
lunch_menu2 db 10,13,'                       1.BEEF BIRYANI              100 RS $'
lunch_menu3 db 10,13,'                       2.CHICKEN BIRYANI           100 RS $'
lunch_menu4 db 10,13,'                       3.CHICKEN KARAHI            100 RS $'
lunch_menu5 db 10,13,'                       4.RICE + FISH CURRY         100 RS $'
lunch_menu6 db 10,13,'                       5.RICE+CHICKEN CURRY        100 RS $'
lunch_menu7 db 10,13,'                       6.RICE+BEAF CURRY           100 RS $'

;DINNER MENU
dinner_menu1 db 10,13,'                  ***        Dinner List       ***$'
dinner_menu2 db 10,13,'                       1.SHINWARI KARAHI+NAAN      200 RS$'
dinner_menu3 db 10,13,'                       2.CHAPLI KABAB+NAAN         200 RS$'
dinner_menu4 db 10,13,'                       3.KABULI PULAO              200 RS$'
dinner_menu5 db 10,13,'                       4.LAMB NAMKEEN TIKKA        200 RS$'
dinner_menu6 db 10,13,'                       5.ROSH                      200 RS$'
dinner_menu7 db 10,13,'                       6.DAMPUKHT                  200 RS$'
.code                                                                   

    main proc
        mov ax,@data
        mov ds,ax
        
        ;FOR WELCOME PAGE
        mov ah,09
        lea dx,welcome_1
        int 21h
        lea dx,welcome_2
        int 21h
        lea dx,welcome_3
        int 21h
        lea dx,welcome_4
        int 21h
        lea dx,welcome_5
        int 21h
        lea dx,welcome_6
        int 21h
        
        ;FOR NEW LINE
        mov ah,02
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        ;FOR NEW LINE
        mov ah,02
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        ;FOR SCHEDULE
        mov ah,09
        lea dx,schedule_display
        int 21h
        mov ah,01
        int 21h
        mov bh,al
        sub bh,48
        
        cmp bh,1
        JE schedule
        
        jmp invalid
        
        
        schedule:
        ;FOR NEW LINE
        mov ah,02
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        ;FOR NEW LINE
        mov ah,02
        mov dl,10
        int 21h
        mov dl,13
        int 21h
         
        
         
        ;FOR BREAKFAST/LUNCH/DINNER DISPLAY
        mov ah,09
        lea dx,schedule1
        int 21h
        lea dx,Breakfast
        int 21h
        lea dx,Lunch
        int 21h
        lea dx,Dinner
        int 21h 
        
        ;FOR NEW LINE
        mov ah,02
        mov dl,10
        int 21h
        mov dl,13
        int 21h 
         
        ;FOR DISPLAYING CHOICE 
        mov ah,09
        lea dx,choice
        int 21h
        mov ah,01
        int 21h
        mov bh,al
        sub bh,48
        
        cmp bh,1
        JE @BREAKFAST
        
        cmp bh,2
        JE @LUNCH
        
        cmp bh,3
        
        JE @DINNER
        
        JMP invalid
        
        
        ;LABEL FOR BREAKFAST
        
        @BREAKFAST:
        ;FOR NEW LINE
        mov ah,02
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        ;FOR NEW LINE
        mov ah,02
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        ;FOR DISPLAYING BREAKFAST MENU
        mov ah,09
        lea dx,breakfast_menu1
        int 21h
        lea dx,breakfast_menu2
        int 21h
        lea dx,breakfast_menu3
        int 21h
        lea dx,breakfast_menu4
        int 21h
        lea dx,breakfast_menu5
        int 21h
        lea dx,breakfast_menu6
        int 21h
        lea dx,breakfast_menu7
        int 21h
        
        ;FOR PICKING ITEM FROM MENU
        mov ah,09
        lea dx,pick
        int 21h
        
        mov ah,01
        int 21h
        
        mov bh,al
        
        sub bh,48
        
        cmp bh,1
        JE breakfast_bill
        
        cmp bh,2
        JE breakfast_bill
        
        cmp bh,3
        JE breakfast_bill
        
        cmp bh,4
        JE breakfast_bill
        
        cmp bh,5
        JE breakfast_bill
        
        cmp bh,6
        JE breakfast_bill
        
        jmp invalid
        
        
        ;LABEL FOR LUNCH
        
        @LUNCH:
        ;FOR NEW LINE
        mov ah,02
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        ;FOR NEW LINE
        mov ah,02
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        ;FOR DISPLAYING LUNCH MENU
        mov ah,09
        lea dx,lunch_menu1
        int 21h
        lea dx,lunch_menu2
        int 21h
        lea dx,lunch_menu3
        int 21h
        lea dx,lunch_menu4
        int 21h
        lea dx,lunch_menu5
        int 21h
        lea dx,lunch_menu6
        int 21h
        lea dx,lunch_menu7
        int 21h
        
        ;TO PICK ITEM FROM MENU
        mov ah,09
        lea dx,pick
        int 21h
        
        mov ah,01
        int 21h
        
        mov bh,al
        
        sub bh,48
        
        cmp bh,1
        JE lunch_bill
        
        cmp bh,2
        JE lunch_bill
        
        cmp bh,3
        JE lunch_bill
        
        cmp bh,4
        JE lunch_bill
        
        cmp bh,5
        JE lunch_bill
        
        cmp bh,6
        JE lunch_bill
        
        jmp invalid
        
        
        ;LABEL FOR DINNER
        
        @DINNER:
        ;FOR NEW LINE
        mov ah,02
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        ;FOR NEW LINE
        mov ah,02
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        ;FOR DISPLAYING LUNCH MENU
        mov ah,09
        lea dx,dinner_menu1
        int 21h
        lea dx,dinner_menu2
        int 21h
        lea dx,dinner_menu3
        int 21h
        lea dx,dinner_menu4
        int 21h
        lea dx,dinner_menu5
        int 21h
        lea dx,dinner_menu6
        int 21h
        lea dx,dinner_menu7
        int 21h
        
        ;FOR PICKING ITEMS FROM MENU
        mov ah,09
        lea dx,pick
        int 21h
        
        mov ah,01
        int 21h
        
        mov bh,al
        
        sub bh,48
        
        cmp bh,1
        JE dinner_bill
        
        cmp bh,2
        JE dinner_bill
        
        cmp bh,3
        JE dinner_bill
        
        cmp bh,4
        JE dinner_bill
        
        cmp bh,5
        JE dinner_bill
        
        cmp bh,6
        JE dinner_bill
        
        jmp invalid
        
        
        
        ;FOR BREAKFAST BILL
        breakfast_bill:
        mov bl,5
        ;FOR DISPLAYING QUANTITY STRING
        mov ah,09
        lea dx,quantity
        int 21h
        
        mov ah,01
        int 21h
        
        sub al,48
        mul bl
        aam         ;SPLIT THE MULTIPLICATION RESULT
        
        mov cx,ax
        
        add ch,48
        add cl,48
        
        ;FOR TOTAL PRICE
        mov ah,09
        lea dx,total_price
        int 21h
        
        mov ah,02
        mov dl,ch
        int 21h
        
        mov dl,cl
        int 21h
        
        mov dl,'0'
        int 21h
        
        ;DISPLAYING RS
        mov ah,02
        mov dl,82
        int 21h
        mov dl,83
        int 21h
        
         mov ah,02
        mov dl,10
        int 21h
        mov dl,13
        int 21h 
        
        ;FOR DISPLAYING EXIT/CONTINUE STRINGS
        mov ah,09h
        lea dx,return
        int 21h
        lea dx,exit
        int 21h
        
        
        mov ah,09
        lea dx,continue
        int 21h
        
        mov ah,01
        int 21h
        mov bh,al
        
        sub bh,48
        
        cmp bh,1
        JE schedule
        
        cmp bh,2
        JE @exit
        
        jmp invalid
        
        
        jmp @exit
        
        lunch_bill:
        mov bl,10
        ;FOR DISPLAYING QUANTITY STRING
        mov ah,09
        lea dx,quantity
        int 21h
        
        mov ah,01
        int 21h
        
        sub al,48
        mul bl
        aam         ;SPLIT THE MULTIPLICATION RESULT
        
        mov cx,ax
        
        add ch,48
        add cl,48
        
        mov ah,09
        lea dx,total_price
        int 21h
        
        mov ah,02
        mov dl,ch
        int 21h
        
        mov dl,cl
        int 21h
        
        mov dl,'0'
        int 21h
        
        ;DISPLAYING RS
        mov ah,02
        mov dl,82
        int 21h
        mov dl,83
        int 21h
        
        ;NEW LINE
        mov ah,02
        mov dl,10
        int 21h
        mov dl,13
        int 21h 
        
        mov ah,09h
        lea dx,return
        int 21h
        lea dx,exit
        int 21h
        
        
        mov ah,09
        lea dx,continue
        int 21h
        
        mov ah,01
        int 21h
        mov bh,al
        
        sub bh,48
        
        cmp bh,1
        JE schedule
        
        cmp bh,2
        JE @exit
        
        jmp invalid
        
        
        jmp @exit
        
        dinner_bill:
        mov bl,20
        ;FOR DISPLAYING QUANTITY STRING
        mov ah,09
        lea dx,quantity
        int 21h
        
        mov ah,01
        int 21h
        
        sub al,48
        mul bl
        aam         ;SPLIT THE MULTIPLICATION RESULT
        
        mov cx,ax
        
        add ch,48
        add cl,48
        
        mov ah,09
        lea dx,total_price
        int 21h
        
        mov ah,02
        mov dl,ch
        int 21h
        
        mov dl,cl
        int 21h
        
        mov dl,'0'
        int 21h 
        
        
        ;DISPLAYING RS
        mov ah,02
        mov dl,82
        int 21h
        mov dl,83
        int 21h
        
        ;FOR NEW LINE
        mov ah,02
        mov dl,10
        int 21h
        mov dl,13
        int 21h 
        
        mov ah,09h
        lea dx,return
        int 21h
        lea dx,exit
        int 21h
        
        
        mov ah,09
        lea dx,continue
        int 21h
        
        mov ah,01
        int 21h
        mov bh,al
        
        sub bh,48
        
        cmp bh,1
        JE schedule
        
        cmp bh,2
        JE @exit
        
        jmp invalid
        
     
        jmp @exit
        
        
        
        invalid:
        mov ah,02
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        
        mov ah,02
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        mov ah,09
        lea dx,wrong_input
        int 21h
        
        jmp @exit
        
        
        @exit:
        mov ah,4ch 
        int 21h
            
    main endp
    end