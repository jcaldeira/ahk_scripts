#IfWinActive ahk_class Notepad++

;;;;;;;;;;;;;;;;; Datetime Stamp
F5::
FormatTime, currenttime, A_now, dd/MM/yyyy HH:mm		; Inserts time and date (Ex. 29/05/2020 14:09)
ControlSend,  Scintilla1, {Blind}{Text}%currenttime%, ahk_class Notepad++ ; Envia para o notepad++
Return
