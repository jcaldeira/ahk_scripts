;;;;;;;;;;;;;;;;; Symbols and descriptions
; ^ - Ctrl
; # - Windows
; + - Shift
; ! - Alt
; & - An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.

;;;;;;;;;;;;;;;;; Datetime Stamp
FormatTime, currenttime, A_now, d/MM/yyyy HH:mm		; Inserts time and date (Ex. 29/05/2020 14:09)



#IfWinActive ahk_exe PuTTYNG.exe

;;;;;;;;;;;;;;;;; Password Linux - Salto
F1::
SendRaw,*!f$GV5TN9yT
SendInput, {ENTER}
Return


;;;;;;;;;;;;;;;;; Password TACACS CPEs
F2::
SendRaw,CLD&caldeira0
SendInput, {ENTER}
Return




#IfWinActive ahk_exe notepad++.exe

;;;;;;;;;;;;;;;;; Nota CC
F2::
SendInput, %currenttime% - JCaldeira - Migração da CC com sucesso. Teste realizados com o técnico <<TECNICO>> e com <<RESP_LOCAL>> (responsável no local). <<FOTOS_FICHA>>
Return



;;;;;;;;;;;;;;;;; Nota WU
F3::
SendInput, %currenttime% - JCaldeira - WU instalado com sucesso. Testado pelo técnico <<TECNICO>>. <<SURVEY>>
Return