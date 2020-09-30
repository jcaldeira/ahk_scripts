pwdLinux := "Y@!Xz65AomsK" ; Password Linux - Salto
pwdTACASCPE := "CLD@caldeira0" ; Password TACACS CPEs
pwdCASPMS := "ET16yGc4KkpnKMi" ; Password CA - SPMS

defaultCC := " - JCaldeira - Migração da CC com sucesso. Teste realizados com o técnico <<TECNICO>> e com <<RESP_LOCAL>> (responsável no local). <<EQUIPAMENTOS_NOS_ENTREGUES>>. <<FOTOS_FICHA>>"
defaultWU := " - JCaldeira - WU instalado com sucesso. Testado pelo técnico <<TECNICO>>. <<SURVEY>>"


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



#IfWinActive ahk_class Notepad++

;;;;;;;;;;;;;;;;; Nota CC
F1::
FormatTime, currenttime, A_now, dd/MM/yyyy HH:mm		; Datetime Stamp - Inserts time and date (Ex. 29/05/2020 14:09) - Tem de estar dentro do atalho pq se não não atualiza
ControlSend, Scintilla1, {Blind}{Text}%currenttime%%defaultCC%`n, ahk_class Notepad++
return

;;;;;;;;;;;;;;;;; Nota WU
F2::
FormatTime, currenttime, A_now, dd/MM/yyyy HH:mm		; Datetime Stamp - Inserts time and date (Ex. 29/05/2020 14:09) - Tem de estar dentro do atalho pq se não não atualiza
ControlSend, Scintilla1, {Blind}{Text}%currenttime%%defaultWU%`n, ahk_class Notepad++
Return



