; ==============================================================================
; AHK Script: English to Arabic Layout Fixer
; Description: Converts selected text from English keyboard layout to Arabic.
;              Useful when you forget to switch languages before typing.
;
; Usage:
;   1. Highlight the incorrect English text (e.g., "lpl]") or all of the text, it will only change the Arabic letters.
;   2. Press the shortcut (Middle Mouse Button).
;   3. The text is replaced with Arabic (e.g., "محمد").
; ==============================================================================

; -------------------------------------------------------
; HOTKEY CONFIGURATION
; -------------------------------------------------------

	; This defines the shortcut as holding Middle Mouse (MButton) and pressing Insert (Ins).
MButton::

	; Call the function with the mapping pairs (Arabic Letter, English Letter)
	; The function arguments are arranged as: "ArabicChar", "EnglishKey", "ArabicChar", "EnglishKey"...
ReplaceSelectedText("ض","q","ص","w","ث","e","ق","r","ف","t","غ","y","ع","u","ه","i","خ","o","ح","p","ج","[","د","]","ش","a","س","s","ي","d","ب","f","ل","g","ا","h","ت","j","ن","k","م","l","ك",";","ط","'","ئ","z","ء","x","ؤ","c","ر","v","لا","b","ى","n","ة","m","ز",".","و",",","ظ","/","ذ",Chr(0x60))
return


; -------------------------------------------------------
; CORE FUNCTION
; -------------------------------------------------------

	; This function defines the variables that catch the passed arguments.
	; q=Arabic, qq=English, w=Arabic, ww=English, etc.
	; The long list of repeated letters (ppp, pppp) handles punctuation keys like [, ], ;, ', etc.
ReplaceSelectedText(q,qq,w,ww,e,ee,r,rr,t,tt,y,yy,u,uu,i,ii,o,oo,p,pp,ppp,pppp,ppppp,pppppp,a,aa,s,ss,d,dd,f,ff,g,gg,h,hh,j,jj,k,kk,l,ll,lll,llll,lllll,llllll,z,zz,x,xx,c,cc,v,vv,b,bb,n,nn,m,mm,mmm,mmmm,mmmmm,mmmmmm,mmmmmmm,mmmmmmmm,qqq,qqqq) {

    ; 1. Backup and Clear Clipboard
    clipboard := ""        ; Empty the clipboard to ensure we catch new text
    Sleep 10               ; Short delay for stability
    Send, ^c               ; Send Ctrl+C to copy selected text
    ClipWait 0             ; Wait up to 0.5s for text to appear in clipboard

    ; 2. Error Handling
    if ErrorLevel          ; If ClipWait failed (no text selected), exit
    {
        return
    }

    if (clipboard = "")    ; Double check if clipboard is empty
    {
       return
    }

    	; 3. Perform Replacements
    	; The function swaps the English character (%qq%) with the Arabic character (%q%)
    	; 'All' ensures every instance of the letter in the selected text is swapped.
    
    ; -- Row 1 (QWERTY...) --
    StringReplace, clipboard, clipboard, %qq%, %q%, All  ; q -> ض
    StringReplace, clipboard, clipboard, %ww%, %w%, All  ; w -> ص
    StringReplace, clipboard, clipboard, %ee%, %e%, All  ; e -> ث
    StringReplace, clipboard, clipboard, %rr%, %r%, All  ; r -> ق
    StringReplace, clipboard, clipboard, %tt%, %t%, All  ; t -> ف
    StringReplace, clipboard, clipboard, %yy%, %y%, All  ; y -> غ
    StringReplace, clipboard, clipboard, %uu%, %u%, All  ; u -> ع
    StringReplace, clipboard, clipboard, %ii%, %i%, All  ; i -> ه
    StringReplace, clipboard, clipboard, %oo%, %o%, All  ; o -> خ
    StringReplace, clipboard, clipboard, %pp%, %p%, All  ; p -> ح
    
    	; -- Brackets and Punctuation (Row 1) --
    StringReplace, clipboard, clipboard, %pppp%, %ppp%, All      ; [ -> ج
    StringReplace, clipboard, clipboard, %pppppp%, %ppppp%, All  ; ] -> د

    	; -- Row 2 (ASDFG...) --
    StringReplace, clipboard, clipboard, %aa%, %a%, All  ; a -> ش
    StringReplace, clipboard, clipboard, %ss%, %s%, All  ; s -> س
    StringReplace, clipboard, clipboard, %dd%, %d%, All  ; d -> ي
    StringReplace, clipboard, clipboard, %ff%, %f%, All  ; f -> ب
    StringReplace, clipboard, clipboard, %gg%, %g%, All  ; g -> ل
    StringReplace, clipboard, clipboard, %hh%, %h%, All  ; h -> ا
    StringReplace, clipboard, clipboard, %jj%, %j%, All  ; j -> ت
    StringReplace, clipboard, clipboard, %kk%, %k%, All  ; k -> ن
    StringReplace, clipboard, clipboard, %ll%, %l%, All  ; l -> م
    
    	; -- Punctuation (Row 2) --
    StringReplace, clipboard, clipboard, %llll%, %lll%, All      ; ; -> ك
    StringReplace, clipboard, clipboard, %llllll%, %lllll%, All  ; ' -> ط

    	; -- Row 3 (ZXCVB...) --
    StringReplace, clipboard, clipboard, %zz%, %z%, All  ; z -> ئ
    StringReplace, clipboard, clipboard, %xx%, %x%, All  ; x -> ء
    StringReplace, clipboard, clipboard, %cc%, %c%, All  ; c -> ؤ
    StringReplace, clipboard, clipboard, %vv%, %v%, All  ; v -> ر
    StringReplace, clipboard, clipboard, %bb%, %b%, All  ; b -> لا
    StringReplace, clipboard, clipboard, %nn%, %n%, All  ; n -> ى
    StringReplace, clipboard, clipboard, %mm%, %m%, All  ; m -> ة

    	; -- Punctuation (Row 3 & Tilde) --
    StringReplace, clipboard, clipboard, %mmmm%, %mmm%, All          ; . -> ز
    StringReplace, clipboard, clipboard, %mmmmmm%, %mmmmm%, All      ; , -> و
    StringReplace, clipboard, clipboard, %mmmmmmmm%, %mmmmmmm%, All  ; / -> ظ
    StringReplace, clipboard, clipboard, %qqqq%, %qqq%, All          ; ` -> ذ

    	; 4. Output Result
    if (clipboard = "")
    {
        return
    }
    else
    {
        Send, ^v ; Paste the modified text back over the selection
        return
    }

return
}