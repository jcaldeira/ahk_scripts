pwdLinux := "VQCt^@1P2NaR" ; Password Linux - Salto
pwdTACASCPE := "CLD@caldeira0" ; Password TACACS CPEs
pwdCASPMS := "Tr!pl3x%48" ; Password CA - SPMS

defaultCC := " - jcaldeira - Instalação da CC com sucesso. Teste realizados com o técnico _TECNICO_ e com _RESP_LOCAL_ (responsável no local)."
defaultAvaria := "Contacto por parte do OMG1 para confirmar operacionalidade dos circuitos."


#IfWinActive ahk_class Chrome_WidgetWin_1

;;;;;;;;;;;;;;;;; Password Password CA - SPMS
F1::
SendInput, {Blind}{Text}%pwdCASPMS%`n
Return


#IfWinActive ahk_class PuTTYNG

;;;;;;;;;;;;;;;;; Password Linux - Salto
F1::
SendInput, {Blind}{Text}%pwdLinux%`n
Return

;;;;;;;;;;;;;;;;; Password TACACS CPEs
F2::
SendInput, {Blind}{Text}%pwdTACASCPE%`n
Return

;;;;;;;;;;;;;;;;; Comandos obrigatórios no ínicio de cada sessão
F3::
SendInput, {Blind}{Text}term len 0`n
;Sleep, 500
SendInput, {Blind}{Text}term mon`n
;Sleep, 500
SendInput, {Blind}{Text}sh log`n
;Sleep, 500
SendInput, {Blind}{Text}sh ip int b`n
;Sleep, 500
SendInput, {Blind}{Text}sh bgp sum`n
Return

;;;;;;;;;;;;;;;;; Teste PINGs
F4::
SendInput, {Blind}{Text}ping 100.64.101.1 source%A_Space%
SendInput, ^+v
SendInput, {Blind}{Text}%A_Space%repeat 1000 size 1000`n
Sleep 20000
SendInput, {Blind}{Text}ping 10.0.19.254 source%A_Space%
SendInput, ^+v
SendInput, {Blind}{Text}%A_Space%repeat 1000 size 1000`n
Return


#IfWinActive João Pedro Cordeiro @ Portugal Telecom

;;;;;;;;;;;;;;;;; Nota CC
F1::
FormatTime, currenttime, A_now, dd/MM/yyyy HH:mm		; Datetime Stamp - Inserts time and date (Ex. 29/05/2020 14:09) - Tem de estar dentro do atalho pq se não não atualiza
; ControlSend, Scintilla1, {Blind}{Text}%currenttime%%defaultCC%`n, ahk_class Notepad++
SendInput, {Blind}{Text}%currenttime%%defaultCC%`n
return

;;;;;;;;;;;;;;;;; Nota Avaria
F3::
; ControlSend, Scintilla1, {Blind}{Text}%defaultAvaria%`n, ahk_class Notepad++
SendInput, {Blind}{Text}%defaultAvaria%`n
Return
