;;;;;;;;;;;;;;;;; Symbols and descriptions
; ^ - Ctrl
; # - Windows
; + - Shift
; ! - Alt
; & - An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.

#IfWinActive ahk_exe notepad++.exe
;;;;;;;;;;;;;;;;; Datetime Stamp
F1::
FormatTime, currenttime, A_now, d/MM/yyyy HH:mm		; Inserts time and date (Ex. 29/05/2020 14:09)
SendInput, %currenttime%
Return
