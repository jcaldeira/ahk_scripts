pwdLinux := "VQCt^@1P2NaR" ; Password Linux - Salto Altice
pwdTACASCPE := "CLD@caldeira0" ; Password TACACS CPEs
pwdCASPMS := "Tr!pl3x%48" ; Password CA - SPMS
pwdTACASSPMS := "CoN9m2%wVn^G" ; Password Linux - Salto SPMS
pwdRootSPMS := "1qaz2wsx3edc" ; Password Root Linux - Salto SPMS (Todas)

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

;;;;;;;;;;;;;;;;; Password Linux - Salto SPMS
F3::
SendInput, {Blind}{Text}%pwdTACASSPMS%`n
Return

;;;;;;;;;;;;;;;;; Password Linux - Salto SPMS
F4::
SendInput, {Blind}{Text}%pwdRootSPMS%`n
Return

;;;;;;;;;;;;;;;;; Comandos obrigatórios no ínicio de cada sessão
F5::
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
F6::
SendInput, {Blind}{Text}ping 100.64.101.1 source%A_Space%
SendInput, ^+v
SendInput, {Blind}{Text}%A_Space%repeat 1000 size 1000`n
Sleep 20000
SendInput, {Blind}{Text}ping 10.0.19.254 source%A_Space%
SendInput, ^+v
SendInput, {Blind}{Text}%A_Space%repeat 1000 size 1000`n
Return

;;;;;;;;;;;;;;;;; Validações PRESI
F7::
SendInput, {Blind}{Text}sh run | sec Gestao`n`n`n
SendInput, {Blind}{Text}sh run | sec snmp`n`n`n
SendInput, {Blind}{Text}sh run | sec vty`n`n`n
Return

;;;;;;;;;;;;;;;;; Criar crypto key p/ SSH
F9::
SendInput, {Blind}{Text}conf t`n
SendInput, {Blind}{Text}crypto key generate rsa general-keys modulus 2048`n
SendInput, {Blind}{Text}line vty 0 15`n
SendInput, {Blind}{Text}transport input ssh`n
SendInput, {Blind}{Text}end`n
Return

;;;;;;;;;;;;;;;;; Normalização SWs PRESI
F10::
SendInput, {Blind}{Text}conf t`n
SendInput, {Blind}{Text}aaa authorization exec default group tacacs+ local`n
SendInput, {Blind}{Text}aaa authorization commands 15 default group tacacs+ local`n
SendInput, {Blind}{Text}aaa accounting exec default start-stop group tacacs+`n
SendInput, {Blind}{Text}aaa accounting commands 15 default start-stop group tacacs+`n
SendInput, {Blind}{Text}clock summer-time PT recurring last Sun Mar 1:00 last Sun Oct 2:00`n
SendInput, {Blind}{Text}service nagle`n
SendInput, {Blind}{Text}service timestamps log datetime localtime`n
SendInput, {Blind}{Text}line vty 0 15`n
SendInput, {Blind}{Text}transport input ssh`n
SendInput, {Blind}{Text}exit`n
Sleep 1000
SendInput, {Blind}{Text}no snmp-server group spms2020_ro v3 auth`n
SendInput, {Blind}{Text}no snmp-server host 10.254.111.180 version 3 auth spms2020_ro`n
SendInput, {Blind}{Text}no snmp-server host 10.206.50.10 version 3 auth snmpv3_group`n
SendInput, {Blind}{Text}no snmp-server host 10.206.50.11 version 3 auth snmpv3_group `n
SendInput, {Blind}{Text}no snmp-server host 10.206.50.12 version 3 auth snmpv3_group `n
SendInput, {Blind}{Text}no snmp-server host 10.206.50.9 version 3 auth snmpv3_group `n
SendInput, {Blind}{Text}no snmp-server host 10.254.111.180 version 3 auth snmpv3_group`n
SendInput, {Blind}{Text}no snmp-server host 10.254.111.181 version 3 auth snmpv3_group `n
Sleep 1000
SendInput, {Blind}{Text}snmp-server host 10.206.50.10 version 3 auth snmpv3`n
SendInput, {Blind}{Text}snmp-server host 10.206.50.11 version 3 auth snmpv3`n
SendInput, {Blind}{Text}snmp-server host 10.206.50.12 version 3 auth snmpv3 `n
SendInput, {Blind}{Text}snmp-server host 10.206.50.9 version 3 auth snmpv3 `n
SendInput, {Blind}{Text}snmp-server host 10.254.111.180 version 3 auth snmpv3`n
Sleep 1000
SendInput, {Blind}{Text}ip access-list standard Gestao_SNMP`n
SendInput, {Blind}{Text}permit 10.254.111.181`n
SendInput, {Blind}{Text}permit 10.254.111.180`n
SendInput, {Blind}{Text}permit 10.206.50.12`n
SendInput, {Blind}{Text}permit 10.206.50.10`n
SendInput, {Blind}{Text}permit 10.206.50.11`n
SendInput, {Blind}{Text}permit 10.206.50.9`n
SendInput, {Blind}{Text}end`n
Return

;;;;;;;;;;;;;;;;; SNMP Traps
F11::
SendInput, {Blind}{Text}conf t`n
SendInput, {Blind}{Text}snmp-server enable traps vlancreate`n
SendInput, {Blind}{Text}snmp-server enable traps vlandelete`n
SendInput, {Blind}{Text}snmp-server enable traps port-security`n
SendInput, {Blind}{Text}snmp-server enable traps envmon fan shutdown supply temperature status`n
SendInput, {Blind}{Text}snmp-server enable traps syslog`n
SendInput, {Blind}{Text}snmp-server enable traps vlan-membership`n
SendInput, {Blind}{Text}snmp-server enable traps errdisable`n
SendInput, {Blind}{Text}end`n
Return

;;;;;;;;;;;;;;;;; Remover group spms2020_ro - PRESI
F12::
SendInput, {Blind}{Text}conf t`n
SendInput, {Blind}{Text}no snmp-server group spms2020_ro v3 auth`n
SendInput, {Blind}{Text}no snmp-server host 10.254.111.180 version 3 auth spms2020_ro`n
SendInput, {Blind}{Text}end`n
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
