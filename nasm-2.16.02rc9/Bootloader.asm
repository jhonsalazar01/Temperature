bits 16
org 0x7c00
     start:
          mov ah, 42h	;interrupción 13h con parámetro ah=42h lee sector de un disco
          mov dl, 80h	;referencia a disco (0 primer disco, 0x80 UBS)
          mov si, readData	;apuntador a datos de lectura
          int 13h
          jnc 8000h	;salto a la dirección de memoria donde se realiza la carga del kernel
          jmp start 	;salta a inicio si hay error		
ret

readData :	
     db 10h		;tamaño de estructura
     db 0		;inicio sector relativo (por defecto 0)
     dw 800		;cantidad de sectores
     dd 8000h		;dirección de memoria kernel (Double Word 32 bits)
     dq 3		;sector inicial a leer (Quadruple Word 64 bits)

times 510-($-$$) db 0	;limpiar memoria en 0
dw 0AA55h		;firmar sector 0