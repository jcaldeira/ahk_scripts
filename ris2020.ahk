FormatTime, currenttime, A_now, d/MM/yyyy HH:mm		; Datetime Stamp - Inserts time and date (Ex. 29/05/2020 14:09)

pwdLinux := "*!f$GV5TN9yT" ; Password Linux - Salto
pwdTACASCPE := "CLD&caldeira0" ; Password TACACS CPEs

defaultCC := " - JCaldeira - Migração da CC com sucesso. Teste realizados com o técnico <<TECNICO>> e com <<RESP_LOCAL>> (responsável no local). <<EQUIPAMENTOS_NOS_ENTREGUES>>. <<FOTOS_FICHA>>"
defaultWU := " - JCaldeira - WU instalado com sucesso. Testado pelo técnico <<TECNICO>>. <<SURVEY>>"




#IfWinActive ahk_class PuTTYNG

;;;;;;;;;;;;;;;;; Password Linux - Salto
F1::
SendInput, {Blind}{Text}%pwdLinux%`n
Return

;;;;;;;;;;;;;;;;; Password TACACS CPEs
F2::
SendInput, {Blind}{Text}%pwdTACASCPEs%`n
Return

;;;;;;;;;;;;;;;;; Comandos obrigatórios no ínicio de cada sessão
F3::
SendInput, {Blind}{Text}term len 0`n
Sleep, 500
SendInput, {Blind}{Text}term mon`n
Sleep, 500
SendInput, {Blind}{Text}sh log`n
Sleep, 500
SendInput, {Blind}{Text}sh ip int b`n
Sleep, 500
SendInput, {Blind}{Text}sh bgp sum`n
Return



#IfWinActive ahk_class Notepad++

;;;;;;;;;;;;;;;;; Nota CC
F2::
ControlSend, Scintilla1, {Blind}{Text}%currenttime%%defaultCC%`n, ahk_class Notepad++
return

;;;;;;;;;;;;;;;;; Nota WU
F3::
ControlSend, Scintilla1, {Blind}{Text}%currenttime%%defaultWU%`n, ahk_class Notepad++
Return