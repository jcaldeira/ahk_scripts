; Symbols and descriptions
; ^ - Ctrl
; # - Windows
; + - Shift
; ! - Alt
; & - An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.

; Dummy Menu 
F1::
SENDInput,	ssh jcaldeira@
RETURN



; Password
F2::
SENDRaw,scml#CLD0
SENDInput,	{ENTER}
RETURN 



; Check 3G Status
chk_3g_status:
F4::
SENDInput,	{CTRLDOWN}p{CTRLUP}
SENDInput,	p 3{ENTER}net cellular1/0{ENTER}net status{ENTER}
RETURN



; Enable traces (ppp + cell)
en_traces:
F5::
SENDInput,	{CTRLDOWN}p{CTRLUP}
SLEEP,    250
SENDInput,	p 3{ENTER}
SLEEP,    250
SENDInput,	event{ENTER}
SLEEP,    250
SENDInput,	enable trace subsystem cell all{ENTER}
SLEEP,    250
SENDInput,	enable trace subsystem ppp all{ENTER}
SLEEP,    250
SENDInput,	view{ENTER}
RETURN



; Disables traces (ppp + cell)
dis_traces:
+F5::
; SENDInput,	{CTRLDOWN}p{CTRLUP}
; SLEEP,    250
; SENDInput,	p 3{ENTER}
; SLEEP,    250
; SENDInput,	event{ENTER}
; SLEEP,    250
; SENDInput,	disable trace subsystem cell all{ENTER}
; SLEEP,    250
; SENDInput,	disable trace subsystem ppp all{ENTER}
; SLEEP,    250
SendInput, hide{ENTER}
RETURN



; Disable feature wrr-backup-wan in feature-conf (enable 3G)
dis_fe_wr:
+F6::
SENDInput,	{CTRLDOWN}p{CTRLUP}
SENDInput,	p 5{ENTER}fe wrr{ENTER}
SLEEP,    250
SENDInput,	pair 1 no active{ENTER}
SLEEP,    250
SENDInput,	pair 2 no active{ENTER}
SLEEP,    250
SENDInput,	pair 3 no active{ENTER}
RETURN



; Enable feature wrr-backup-wan in feature-conf (disable 3G)
en_fe_wr:
F6::
SENDInput,	{CTRLDOWN}p{CTRLUP}
SLEEP,    250
SENDInput,	p 5{ENTER}fe wrr{ENTER}
SLEEP,    250
SENDInput,	pair 1 active{ENTER}
SLEEP,    250
SENDInput,	pair 2 active{ENTER}
SLEEP, 	25000
SENDInput,	pair 3 active{ENTER}
RETURN



; Separator '-'
F12::
SENDInput,	{ENTER 2}
SENDInput,	{- 25}
SENDInput,	{ENTER}
RETURN

; ######################################### MAIN FUNCTIONS ##########################################
; Check UP Geral
F3::
SENDInput,	{CTRLDOWN}p{CTRLUP}
SENDInput,    p 3{ENTER}conf{ENTER}
SLEEP,    500
SENDInput,     pro ip{ENTER}dump{ENTER}n{ENTER}exit{ENTER}
SLEEP,    500
SENDInput,     net atm{ENTER}phy{ENTER}his{ENTER}exi{ENTER}exi{ENTER}
SLEEP,    500
SENDInput,	device atm{ENTER}yes{ENTER}no{ENTER}no{ENTER}
SLEEP,    500
SENDInput,     network ethernet0/0{ENTER}repeater-switch{ENTER}list status{ENTER}exit{ENTER}exit{ENTER}
SLEEP,    500
SENDInput,	pro dh{ENTER}serv{ENTER}lea{ENTER}exit{ENTER}exit{ENTER}
SLEEP,    500
Gosub, chk_3g_status
SENDInput,     exit{ENTER}
SLEEP,    500
SENDInput,     pro bgp{ENTER}summ{ENTER}
SLEEP,    500
SENDInput,     exit{ENTER}last{ENTER}
RETURN


; Enable traces (ppp + cell) + Disable feature wrr-backup-wan (enable 3G) + Check 3G Status
F7::
Gosub, en_traces
Gosub, dis_fe_wr
Gosub, chk_3g_status
RETURN



; Disable traces (ppp + cell) + enable feature wrr-backup-wan (disable 3G)
+F7::
Gosub, dis_traces
Gosub, en_fe_wr
RETURN
