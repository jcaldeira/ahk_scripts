pwdLinux := "caldeira" ; Password Linux - Salto
pwdTACASCPE := "caldeira123" ; Password TACACS CPEs

; DetectHiddenWindows, On
; WinShow, PuTTYNG

; #IfWinActive ahk_exe PuTTYNG.exe

;;;;;;;;;;;;;;;;; Password Linux - Salto
F1::
WinGetTitle, windowtitle
; MsgBox, %windowtitle%
ControlSend,, {Blind}{Text}%pwdLinux%,  - PuTTY
ControlSend,, {Enter},  - PuTTY
Return

;;;;;;;;;;;;;;;;; Password TACACS CPEs
F2::
ControlSend,, {Blind}{Text}%pwdTACASCPE%, ahk_exe PuTTYNG.exe
ControlSend,, {Enter}, ahk_exe PuTTYNG.exe
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
