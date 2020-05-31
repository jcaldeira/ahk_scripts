pwdLinux := "caldeira" ; Password Linux - Salto
pwdTACASCPEs := "caldeira123" ; Password TACACS CPEs

; DetectHiddenWindows, On
; WinShow, PuTTYNG

; #IfWinActive ahk_exe PuTTYNG.exe

;;;;;;;;;;;;;;;;; Password Linux - Salto
F1::
SendInput, {Blind}{Text}%pwdLinux%`n
Return

;;;;;;;;;;;;;;;;; Password TACACS CPEs
F2::
SendInput, {Blind}{Text}%pwdTACASCPEs%`n
Return


; #IfWinActive ahk_class Notepad++


; ;;;;;;;;;;;;;;;;; Password Linux - Salto
; F1::
; ControlSend,Scintilla1, {Blind}{Text}%pwdLinux%, ahk_class Notepad++
; ControlSend,Scintilla1, {Enter}, ahk_class Notepad++
; Return

; ;;;;;;;;;;;;;;;;; Password TACACS CPEs
; F2::
; ControlSend,Scintilla1, {Blind}{Text}%pwdTACASCPE%, ahk_class Notepad++
; ControlSend,Scintilla1, {Enter}, ahk_class Notepad++
; Return
