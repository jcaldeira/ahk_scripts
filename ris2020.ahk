;;;;;;;;;;;;;;;;; Symbols and descriptions
; ^ - Ctrl
; # - Windows
; + - Shift
; ! - Alt
; & - An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.



#IfWinActive ahk_exe mRemoteNG.exe

;;;;;;;;;;;;;;;;; Password Linux - Salto
F1::
SendRaw,*!f$GV5TN9yT{ENTER}
SendInput, {ENTER}
Return


;;;;;;;;;;;;;;;;; Password TACACS CPEs
F2::
SendRaw,CLD&caldeira0
SendInput, {ENTER}
Return
