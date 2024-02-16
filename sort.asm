.386
.model flat
.code
public _sort
_sort proc


; create  Assembly sortting code for sorting the character from largest to smallest
;assembly sort
push ebp									; 
mov  ebp, esp								;
mov  esi, [ebp +8]							;
mov  ebx, 1									; Ebx  hold I and let it equal to 1
mov  ch,  0									; ch use as a flag 
mov  cl,  0									; cl use as a flag				

; first sortting phase

firstloop:	
			cmp ebx, [ebp +12]				;
			jae secondSort					; jump to second sortting routine.
			mov edi, ebx					; EDI holds J, move I into J

secondloop:
			mov ch, 0						; set ch to zero
			mov cl, 0						; set cl to zero
			cmp edi, 0						; compare J to zero 
			jbe Endfirstloop				; if it is greater than zero contiune in the loop
			mov al, [esi +edi]				; move the value in J at at current iteration into al
			mov ah, [esi +edi -1]			; move the previous value of J into ah
			cmp al, 61h						; compares al with 'a'	
			jge convertional				; jump to convertions routine for if al is greater than 'a'
loc1:		cmp ah, 61h						; compares ah with 'a'	
			jge convertionaH				; jump to convertions routine if al is greater than 'a'
loc2:		cmp ah, al						; compare ah to al
			jbe Endfirstloop				; jump down to swaploop if the above condtion ah is less than or equal al is ture

			

Swaploop:
			cmp ch, 1						; check if ch is 1
			je restoreh						; if ch is 1 jump to subroutine for changing ah back to a uppercase character
loc3:		mov [esi+edi], ah				; copy value of ah into current itation of J
			cmp cl, 1						; check if cl is 1 
			je restorel						; if cl is 1 jump to subroutine for changing al back to uppercase character
loc4:		mov [esi+edi-1], al				; copy value of al into -1 itation of current J
			sub edi, 1						; 
			jmp secondloop					; go back to the secondloop  

Endfirstloop:

			add ebx, 1						; add 1 to i 
			jmp firstloop					; return to the first loop
		

;convertions of letter to uppercase for easy sorting of mathcing letters,
convertional: 
			sub al, 32						; take 32 from varaible to convert to uppercase
			mov cl, 1						; set flag bit to 1
			jmp loc1						; jump back to loc 1 where subroutine first jump out and move on 

convertionaH:
			sub ah, 32						; take 32 from varaible to convert to uppercase
			mov ch, 1						; set flag bit to 1
			jmp loc2						; jump back to loc 2 where subroutine first jump out and move on 

restoreh:
			add ah, 32						; add 32 to the varaible to convert back to lowercase
			mov ch, 0						; change the check flag back to zero
			jmp loc3						; jump back to the loop to location marked loc3

restorel:
			add al, 32						; this is the same as the code above
			mov cl, 0						; set cl back to zero
			jmp loc4						; jump back to the loop to location marked loc4

;second sortting phase to push all special characters before 0 to the bottom of the stack 

secondSort:									
			mov ebx, 0						; restart the counter
			jmp loop1						; jump to the start of the loop for the second sortting phase

loop1:
			cmp ebx, [ebp +12]				; 
			jae thirdsort					; jump to the third sort for speical character between "Z" and "a"
			mov edi, ebx					; EDI holds J, move I into J

loop2:		
			cmp edi, 0						; compare J to zero 
			jbe loop3						; if it is greater than zero contiune in the loop
			mov ah, [esi +edi]				; move the value in J at at current itartion into al
			mov al, [esi +edi -1]			; copy value of al into -1 itation of current J
			cmp al, 30h						; compares al with zero	
			jge loop3						; jump to loop3 if ah is greater al						

swapv2:	
			mov [esi+edi], al				; copy value of al into current itation of J
			mov [esi+edi-1], ah				; copy value of ah into -1 itation of current J
			sub edi, 1						;
			jmp loop2						; go back to the secondloop  

loop3:
			add ebx, 1
			jmp loop1

;third sortting phase to push all special characters between "Z" and "a" to the bottom of the stack 

thirdsort:									
			mov ebx, 0						; restart the counter
			jmp lp1							; jump to the start of the first loop of the third sortting phase
lp1:
			cmp ebx, [ebp +12]
			jae finish						; jump to finish to restore certian veriable before ending assembly sortting routine and pass all varibles back to the main.cpp file for any finial manimpuation 
			mov edi, ebx					; EDI holds J, move I into J

lp2:		
			cmp edi, 0						; compare J to zero 
			jbe lp3							; if it is greater than zero contiune in the loop
			mov ah, [esi +edi]				; move the value in J at at current itartion into al
			mov al, [esi +edi -1]			;
			cmp al, 39h						; compare al with 39hex = "Z"
			jbe lp3							; if it is less than 39hex jump to lp3 if not skip and move on to the next line
			cmp al, 40h						; compares al with 40hex = "a"	
			jge lp3							; jump to Swaploop if ah is greater al

swapv3:	
			mov [esi+edi], al				; copy value of ah into current itation of J
			mov [esi+edi-1], ah				; copy value of al into -1 itation of current J
			sub edi, 1						;
			jmp lp2							; go back to the secondloop  

lp3:
			add ebx, 1						; add one to the counter
			jmp lp1							; jump back to the start of the sortting loop


finish: 
		pop ebp								; restore ebp back to the regsiter
		pop ebx						
		pop edi

ret
_sort endp
end
