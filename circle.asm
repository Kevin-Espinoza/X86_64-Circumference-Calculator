;*****************************************************************************************************************************
;  Program name: "X86_64 Circumference Calculator" 
;  The purpose of this program is to get user input for a radius, and output the circumference
;  of a circle.  Copyright (C) 2020 Kevin Espinoza      
;                                                              
;  This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  
;  version 3 as published by the Free Software Foundation.                                                                    
;  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         
;  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     
;  A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                            
;*****************************************************************************************************************************

;*****************************************************************************************************************************
;  Author information
;  Author name: Kevin Espinoza
;  Author email: k.espinoza1012@gmail.com
;  X86_64 Circumference Calculator
;
;  File name: circle.asm
;  Language: X86-64
;  Syntax: Intel
;  Assemble: nasm -f elf64 -l circle.lis -o circle.o circle.asm
;  Purpose: This is where all the arithmetic for Assignment 4 will be done. The purpose of this function is to  
;  take a user inputted radius and compute the circumference of a cirle. The final circumference will be 
;  returned to the driver function where it will be displayed in deciaml and hexadecimal.   
;******************************************************************************************************************************


extern scanf
extern printf
global circle
 
segment .data
    _2 dq 2.0
    pi dq 3.1415926535897931159
          
    string_Format db "%s", 0
    float_Format  db "%lf",0

    author_Message          db "This circle function is brought to you by Kevin Espinoza. ", 10, 0
    instruction_Message     db "Please enter the radius of a circle as a floating point number: ", 10, 0
    number_Recieved_Message db "The number %.8lf was received. ", 10, 0
    circumference_Message   db "The circumference of a circle with this radius is %9.19lf meters. ", 10, 0
    return_Message          db "The circumference will be returned to the main program. Please enjoy your circles. ", 10, 10, 0



segment .bss
; Empty


segment .text
circle:

;==================================== Back-up GPRs ====================================
    push rbp         ;Save a copy of the stack base pointer
    mov  rbp, rsp    ;We do this in order to be 100% cmpatible with C and C++.
    push rbx          ;Back up rbx
    push rcx          ;Back up rcx
    push rdx          ;Back up rdx
    push rsi          ;Back up rsi
    push rdi          ;Back up rdi
    push r8           ;Back up r8
    push r9           ;Back up r9
    push r10          ;Back up r10
    push r11          ;Back up r11
    push r12          ;Back up r12
    push r13          ;Back up r13
    push r14          ;Bck up r14
    push r15         ;Back up r15
    pushf             ;Back up rflags
;======================================================================================



; Print Author Message 
    mov qword rdi, string_Format           
    mov qword rsi, author_Message          ; "This circle function is brought to you by Kevin Espinoza."     
    mov qword rax, 0                       ; No data from the SSE will be printed
    call printf                            ; Call a library function to make the output     


; Print Instruction Message
    mov qword rdi, string_Format            ; Print string format to terminal
    mov qword rsi, instruction_Message      ; "Please enter the radius of a circle as a floating point number: "     
    mov qword rax, 0                        ; Call a library function to make the output                     
    call printf 


; Get user input for number
    mov rax, 0                  ; No data from the SSE will be printed
    mov rdi, float_Format       ; "%lf"
    mov rsi, rsp
    call scanf                  ; Call a library function to get user input
    movsd xmm15, [rsp]


; Print Number Recieved Message
    mov rax, 1                        ; Data from the SSE will be printed
    mov rdi, number_Recieved_Message  ; "The number %.8lf was received. "      
    movsd xmm0, xmm15
    call printf                       ; Call a library function to make the output


; Print Return Message
    mulsd xmm15, [pi]                 ; Multiply user input by pi
    mulsd xmm15, [_2]                 ; Multiply user input by 2
    mov rax, 1                        ; Data from the SSE will be printed
    mov rdi, circumference_Message    ; "The circumference of a circle with this radius is %9.19lf meters. "
    movsd xmm0, xmm15
    call printf                       ; Call a library function to make the output
    

; Print return message
    mov qword rax, 0             ; No data from the SSE will be printed
    mov rdi, string_Format       ; "%ls"
    mov rsi, return_Message      ; "The circumference will be returned to the main program. Please enjoy your circles." 
    call printf                  ; Call a library function to make the output


 
;==================================== Restore GPRs ====================================
    popf            ; Restore rflags
    pop r15         ; Restore r15
    pop r14         ; Restore r14
    pop r13         ; Restore r13
    pop r12         ; Restore r12
    pop r11         ; Restore r11
    pop r10         ; Restore r10
    pop r9          ; Restore r9
    pop r8          ; Restore r8
    pop rdi         ; Restore rdi
    pop rsi         ; Restore rsi
    pop rdx         ; Restore rdx
    pop rcx         ; Restore rcx
    pop rbx         ; Restore rbx
    pop rbp         ; Return rbp to point to the base of the activation record of the caller.
;======================================================================================


; Move circumference to proper register and return it to the driver function
movsd xmm0, xmm15  
ret
     
     