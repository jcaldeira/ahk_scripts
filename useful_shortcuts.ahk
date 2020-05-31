#IfWinActive ahk_class Notepad++

;;;;;;;;;;;;;;;;; Datetime Stamp
F1::
FormatTime, currenttime, A_now, d/MM/yyyy HH:mm		; Inserts time and date (Ex. 29/05/2020 14:09)
ControlSend,  Scintilla1, %currenttime% ; Envia para o notepad++
Return
