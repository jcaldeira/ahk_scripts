pwdLinux := "caldeira" ; Password Linux - Salto
pwdTACASCPE := "caldeira123" ; Password TACACS CPEs

#IfWinActive ahk_class PuTTYNG


;;;;;;;;;;;;;;;;; Password Linux - Salto
F1::
ControlSend,, {Blind}{Text}%pwdLinux%, ahk_class PuTTYNG
ControlSend,, {Enter}, ahk_class PuTTYNG
Return

;;;;;;;;;;;;;;;;; Password TACACS CPEs
F2::
ControlSend,, {Blind}{Text}%pwdTACASCPE%, ahk_class PuTTYNG
ControlSend,, {Enter}, ahk_class PuTTYNG
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
