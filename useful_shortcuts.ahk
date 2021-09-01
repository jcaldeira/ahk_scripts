pwdAlticeDominio := "GSVj6c*6^" ; Password Altice - Domínio
pwdNetQ := "3ARACq9%oT%P" ; Password NetQ

;;;;;;;;;;;;;;;;; Win + E
;#E::
;FilesTitle := "Files ahk_class ApplicationFrameWindow ahk_exe ApplicationFrameHost.exe"
;FilesLocation := USERPROFILE . "\AppData\Local\Microsoft\WindowsApps\files.exe"
;    if WinExist(FilesTitle) {
;        WinActivate % FilesTitle     ; Set focus
;        SendInput ^t                    ; Send CTRL + t shortcut to open a new tab
;    } else {
;        Run % FilesLocation          ; Start Files
;        WinWait % FilesTitle         ; Wait for it ...
;        WinActivate % FilesTitle     ; Set focus
;    }
;Return

#IfWinActive ahk_exe ONENOTE.EXE

;;;;;;;;;;;;;;;;; Datetime Stamp
;F5::
;FormatTime, currenttime, A_now, dd/MM/yyyy HH:mm	; Inserts time and date (Ex. 29/05/2020 ;14:09)
;ControlSend,  Scintilla1, {Blind}{Text}%currenttime%, ahk_class Notepad++ ; Envia para o notepad++
;Return


;;;;;;;;;;;;;;;;; Datetime Stamp General
F5::
FormatTime, currenttime, A_now, HH:mm dd/MM/yyyy	; Inserts time and date (Ex. 14:09 29/05/2020)
SendInput, {Blind}{Text}%currenttime% -%A_Space%
Return


;;;;;;;;;;;;;;;;; Separator '-'
F12::
SendInput, {Blind}{Text}`n
Sleep 500
SendInput, {▬ 52}
SendInput, {Blind}{Text}`n
Return


#IfWinActive ahk_exe chrome.exe

;;;;;;;;;;;;;;;;; Password NetQ
F2::
SendInput, {Blind}{Text}%pwdNetQ%`n
Return


#IfWinActive ahk_exe TrGUI.exe

;;;;;;;;;;;;;;;;; Password Altice - Domínio
F1::
SendInput, {Blind}{Text}%pwdAlticeDominio%`n
Return
