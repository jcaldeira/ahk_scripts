; Symbols and descriptions
; ^ - Ctrl
; # - Windows
; + - Shift
; ! - Alt
; & - An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.

; Dummy Menu 
F1::
SENDInput,	ssh jcaldeira@
;SLEEP,    250
SENDInput,	^v{ENTER}
RETURN

; ----------------------------------

; Password
F2::
SENDRaw,scml#CLD0
SENDInput,	{ENTER}
RETURN 

; ----------------------------------

; Root + p 3
root_p3:
SENDInput,	{CTRLDOWN}p{CTRLUP}
SENDInput,	p 3{ENTER}
RETURN

; Root + p 5
root_p5:
SENDInput,	{CTRLDOWN}p{CTRLUP}
SENDInput,	p 5{ENTER}
RETURN

; ----------------------------------

; Check 3G Status
chk_3g_status:
F4::
Gosub,	root_p3
SENDInput,	net cellular1/0{ENTER}
SENDInput,	net status{ENTER}
RETURN

; Check 3G Status (no root)
chk_3g_status_no_root:
SENDInput,	net cellular1/0{ENTER}
SENDInput,	net status{ENTER}
RETURN

; ----------------------------------

; Check routes
chk_routes:
Gosub,	root_p3
SENDInput,	pro ip{ENTER}
SENDInput,	dump{ENTER}
SENDInput,	n{ENTER}exit{ENTER}
RETURN

; Check routes (no root)
chk_routes_no_root:
SENDInput,	pro ip{ENTER}
SENDInput,	dump{ENTER}
SENDInput,	n{ENTER}exit{ENTER}
RETURN

; ----------------------------------

; Check port status
chk_port_status:
Gosub,	root_p3
SENDInput,	network ethernet0/0{ENTER}
SENDInput,	repeater-switch{ENTER}
SENDInput,	list status{ENTER}
SENDInput,	exit{ENTER}exit{ENTER}
RETURN

; Check port status (no root)
chk_port_status_no_root:
SENDInput,	network ethernet0/0{ENTER}
SENDInput,	repeater-switch{ENTER}
SENDInput,	list status{ENTER}
SENDInput,	exit{ENTER}exit{ENTER}
RETURN

; ----------------------------------

; Check DHCP leases
chk_dhcp_leases:
Gosub,	root_p3
SENDInput,	pro dh{ENTER}
SENDInput,	serv{ENTER}
SENDInput,	lea{ENTER}
SENDInput,	exit{ENTER}exit{ENTER}
RETURN

; Check DHCP leases (no root)
chk_dhcp_leases_no_root:
SENDInput,	pro dh{ENTER}
SENDInput,	serv{ENTER}
SENDInput,	lea{ENTER}
SENDInput,	exit{ENTER}exit{ENTER}
RETURN

; ----------------------------------

; Enable traces (ppp + cell)
en_traces:
F5::
Gosub,	root_p3
SLEEP,    500
SENDInput,	event{ENTER}
SLEEP,    500
SENDInput,	enable trace subsystem cell all{ENTER}
SLEEP,    500
SENDInput,	enable trace subsystem ppp all{ENTER}
SLEEP,    500
SENDInput,	view{ENTER}
RETURN

; Disables traces (ppp + cell)
dis_traces:
+F5::
Gosub,	root_p3
SLEEP,    500
SENDInput,	event{ENTER}
SLEEP,    500
SENDInput,	disable trace subsystem cell all{ENTER}
SLEEP,    500
SENDInput,	disable trace subsystem ppp all{ENTER}
SLEEP,    500
SendInput, hide{ENTER}
RETURN

; ----------------------------------

; Disable feature wrr-backup-wan in feature-conf (enable 3G)
dis_fe_wr:
+F6::
Gosub,	root_p5
SLEEP,    500
SENDInput,	fe wrr{ENTER}
SLEEP,    500
SENDInput,	pair 1 no active{ENTER}
SLEEP,    500
SENDInput,	pair 2 no active{ENTER}
SLEEP,    500
SENDInput,	pair 3 no active{ENTER}
RETURN

; Enable feature wrr-backup-wan in feature-conf (disable 3G)
en_fe_wr:
F6::
Gosub,	root_p5
SLEEP,    500
SENDInput,	fe wrr{ENTER}
SLEEP,    500
SENDInput,	pair 1 active{ENTER}
SLEEP,    500
SENDInput,	pair 2 active{ENTER}
SLEEP, 	50000
SENDInput,	pair 3 active{ENTER}
RETURN

; ----------------------------------

; Separator '-'
F12::
SENDInput,	{ENTER 2}
SENDInput,	{- 25}
SENDInput,	{ENTER}
RETURN



; ######################################### MAIN FUNCTIONS ##########################################
; Check UP Geral
F3::
Gosub,  root_p3
Gosub,	chk_routes_no_root
SLEEP,    500
SENDInput,     net atm{ENTER}phy{ENTER}his{ENTER}exi{ENTER}exi{ENTER}
SLEEP,    500
SENDInput,	device atm{ENTER}yes{ENTER}no{ENTER}yes{ENTER}
SLEEP,    500
Gosub,	chk_port_status_no_root
SLEEP,    500
Gosub,	chk_dhcp_leases_no_root
SLEEP,    500
Gosub, chk_3g_status_no_root
SENDInput,     exit{ENTER}
SLEEP,    500
SENDInput,     pro bgp{ENTER}summ{ENTER}
SLEEP,    500
SENDInput,     exit{ENTER}last{ENTER}
RETURN

; ----------------------------------

; Enable traces (ppp + cell) + Disable feature wrr-backup-wan (enable 3G) + Check 3G Status
F7::
Gosub,  root_p3
Gosub, en_traces
Gosub, dis_fe_wr
Gosub, chk_3g_status
RETURN

; Disable traces (ppp + cell) + enable feature wrr-backup-wan (disable 3G)
+F7::
Gosub,  root_p3
Gosub, dis_traces
Gosub, en_fe_wr
RETURN
