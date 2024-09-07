org 100h           ; Set starting address

; Load two 16-bit values into AX and BX
mov ax, 0012h      ; Load AX with 0012h (first number)
mov bx, 0012h      ; Load BX with 0012h (second number)

; Multiply AX by BX
mul bx             ; Multiply AX by BX, result in DX:AX

; Move the lower 16 bits of the result (AX) into BX
mov bx, ax         ; BX now holds the result's lower 16 bits

; --- Convert and print the high nibble of BH (BX high byte) ---
mov ah, bh         ; Move BH (high byte of BX) to AH
shr ah, 4          ; Shift right to isolate the high nibble
add ah, 30h        ; Convert to ASCII '0'-'9'
cmp ah, 39h        ; Compare with '9'
jle print_high_nibble ; If less than or equal to '9', skip next step
add ah, 7          ; Adjust to ASCII 'A'-'F' if needed

print_high_nibble:
mov dl, ah         ; Move the ASCII value to DL
mov ah, 02h        ; Prepare for output (DOS function 02h)
int 21h            ; Print the high nibble of BH

; --- Convert and print the low nibble of BH (BX high byte) ---
mov ah, bh         ; Move BH back to AH
and ah, 0fh        ; Mask the high nibble, keep the low nibble
add ah, 30h        ; Convert to ASCII '0'-'9'
cmp ah, 39h        ; Compare with '9'
jle print_low_nibble ; If less than or equal to '9', skip next step
add ah, 7          ; Adjust to ASCII 'A'-'F' if needed

print_low_nibble:
mov dl, ah         ; Move the ASCII value to DL
mov ah, 02h        ; Prepare for output
int 21h            ; Print the low nibble of BH

; --- Convert and print the high nibble of BL (BX low byte) ---
mov ah, bl         ; Move BL (low byte of BX) to AH
shr ah, 4          ; Shift right to isolate the high nibble
add ah, 30h        ; Convert to ASCII '0'-'9'
cmp ah, 39h        ; Compare with '9'
jle print_high_nibble2 ; If less than or equal to '9', skip next step
add ah, 7          ; Adjust to ASCII 'A'-'F' if needed

print_high_nibble2:
mov dl, ah         ; Move the ASCII value to DL
mov ah, 02h        ; Prepare for output
int 21h            ; Print the high nibble of BL

; --- Convert and print the low nibble of BL (BX low byte) ---
mov ah, bl         ; Move BL back to AH
and ah, 0fh        ; Mask the high nibble, keep the low nibble
add ah, 30h        ; Convert to ASCII '0'-'9'
cmp ah, 39h        ; Compare with '9'
jle print_low_nibble2 ; If less than or equal to '9', skip next step
add ah, 7          ; Adjust to ASCII 'A'-'F' if needed

print_low_nibble2:
mov dl, ah         ; Move the ASCII value to DL
mov ah, 02h        ; Prepare for output
int 21h            ; Print the low nibble of BL

; --- Terminate the program ---
mov ah, 4Ch        ; DOS terminate function
int 21h            ; Terminate the program