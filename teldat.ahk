;;;;;;;;;;;;;;;;; Symbols and descriptions
; ^ - Ctrl
; # - Windows
; + - Shift
; ! - Alt
; & - An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.

;;;;;;;;;;;;;;;;; Dummy Menu 
F1::
SENDInput,	ssh jcaldeira@
SENDInput,	^v{ENTER}
RETURN

; ----------------------------------

;;;;;;;;;;;;;;;;; Password
F2::
SENDRaw,scml#CLD0
SENDInput,	{ENTER}
RETURN 

; ----------------------------------

;;;;;;;;;;;;;;;;; Root + p 3
root_p3:
SENDInput,	^p
SENDInput,	p 3{ENTER}
RETURN

; Root + p 5
root_p5:
SENDInput,	^p
SENDInput,	p 5{ENTER}
RETURN

; ----------------------------------

;;;;;;;;;;;;;;;;; Check 3G Status
chk_3g_status:
!F4::
Gosub,		root_p3
SENDInput,	net cellular1/0{ENTER}
SENDInput,	net status{ENTER}
RETURN

;;;;;;;;;;;;;;;;; Check 3G Status (no root)
chk_3g_status_no_root:
SENDInput,	net cellular1/0{ENTER}
SENDInput,	net status{ENTER}
RETURN

; ----------------------------------

;;;;;;;;;;;;;;;;; Check routes
chk_routes:
F4::
Gosub,		root_p3
SENDInput,	pro ip{ENTER}
SENDInput,	dump{ENTER}
SENDInput,	n{ENTER}
SENDInput,	exit{ENTER}
RETURN

;;;;;;;;;;;;;;;;; Check routes (no root)
chk_routes_no_root:
SENDInput,	pro ip{ENTER}
SENDInput,	dump{ENTER}
SENDInput,	n{ENTER}exit{ENTER}
RETURN

; ----------------------------------

;;;;;;;;;;;;;;;;; Check port status
chk_port_status:
^F4::
Gosub,		root_p3
SENDInput,	network ethernet0/0{ENTER}
SENDInput,	repeater-switch{ENTER}
SENDInput,	list status{ENTER}
SENDInput,	exit{ENTER}
SENDInput,	exit{ENTER}
RETURN

;;;;;;;;;;;;;;;;; Check port status (no root)
chk_port_status_no_root:
SENDInput,	network ethernet0/0{ENTER}
SENDInput,	repeater-switch{ENTER}
SENDInput,	list status{ENTER}
SENDInput,	exit{ENTER}
SENDInput,	exit{ENTER}
RETURN

; ----------------------------------

;;;;;;;;;;;;;;;;; Check DHCP leases
chk_dhcp_leases:
+F4::
Gosub,		root_p3
SENDInput,	pro dh{ENTER}
SENDInput,	serv{ENTER}
SENDInput,	lea{ENTER}
SENDInput,	exit{ENTER}
SENDInput,	exit{ENTER}
RETURN

;;;;;;;;;;;;;;;;; Check DHCP leases (no root)
chk_dhcp_leases_no_root:
SENDInput,	pro dh{ENTER}
SENDInput,	serv{ENTER}
SENDInput,	lea{ENTER}
SENDInput,	exit{ENTER}
SENDInput,	exit{ENTER}
RETURN

; ----------------------------------

;;;;;;;;;;;;;;;;; Enable traces (ppp + cell)
en_traces:
Gosub,		root_p3
SLEEP,		500
SENDInput,	event{ENTER}
SLEEP,		500
SENDInput,	enable trace subsystem cell all{ENTER}
SLEEP,		500
SENDInput,	enable trace subsystem ppp all{ENTER}
SLEEP,		500
SENDInput,	view{ENTER}
RETURN

;;;;;;;;;;;;;;;;; Disables traces (ppp + cell)
dis_traces:
Gosub,		root_p3
SLEEP,		500
SENDInput,	event{ENTER}
SLEEP,		500
SENDInput,	disable trace subsystem cell all{ENTER}
SLEEP,		500
SENDInput,	disable trace subsystem ppp all{ENTER}
SLEEP,		500
SendInput,	hide{ENTER}
RETURN

; ----------------------------------

;;;;;;;;;;;;;;;;; Disable feature wrr-backup-wan in feature-conf (enable 3G)
dis_fe_wr:
Gosub,		root_p5
SLEEP,		500
SENDInput,	fe wrr{ENTER}
SLEEP,		500
SENDInput,	pair 1 no active{ENTER}
SLEEP,		500
SENDInput,	pair 2 no active{ENTER}
SLEEP,		500
SENDInput,	pair 3 no active{ENTER}
RETURN

;;;;;;;;;;;;;;;;; Enable feature wrr-backup-wan in feature-conf (disable 3G)
en_fe_wr:
Gosub,		root_p5
SLEEP,		500
SENDInput,	fe wrr{ENTER}
SLEEP,		500
SENDInput,	pair 1 active{ENTER}
SLEEP,		500
SENDInput,	pair 2 active{ENTER}
SLEEP,		50000
SENDInput,	pair 3 active{ENTER}
RETURN

; ----------------------------------

;;;;;;;;;;;;;;;;; Check ADSL history
chk_adsl_history:
F7::
Gosub,		root_p3
SENDInput,	net atm{ENTER}
SENDInput,	phy{ENTER}
SENDInput,	his{ENTER}
SENDInput,	exi{ENTER}
SENDInput,	exi{ENTER}
RETURN

;;;;;;;;;;;;;;;;; Check ADSL history (no root)
chk_adsl_history_no_root:
SENDInput,	net atm{ENTER}
SENDInput,	phy{ENTER}
SENDInput,	his{ENTER}
SENDInput,	exi{ENTER}
SENDInput,	exi{ENTER}
RETURN

; ----------------------------------

;;;;;;;;;;;;;;;;; Check ADSL statistics
chk_adsl_stats:
!F7::
Gosub,		root_p3
SENDInput,	device atm{ENTER}
SENDInput,	yes{ENTER}
SENDInput,	no{ENTER}
SENDInput,	yes{ENTER}
RETURN

;;;;;;;;;;;;;;;;; Check ADSL statistics (no root)
chk_adsl_stats_no_root:
SENDInput,	device atm{ENTER}
SENDInput,	yes{ENTER}
SENDInput,	no{ENTER}
SENDInput,	yes{ENTER}
RETURN

; ----------------------------------

;;;;;;;;;;;;;;;;; Check BGP summary
chk_bgp_sum:
F6::
Gosub,		root_p3
SENDInput,	pro bgp{ENTER}
SENDInput,	summ{ENTER}
RETURN

;;;;;;;;;;;;;;;;; Check BGP summary (no root)
chk_bgp_sum_no_root:
SENDInput,	pro bgp{ENTER}
SENDInput,	summ{ENTER}
RETURN

; ----------------------------------

;;;;;;;;;;;;;;;;; Ping tests
F9::
;ClipSaved := ClipboardAll
SENDInput,	ping%A_Space%^v{ENTER}
SLEEP,		4200
SENDInput,	^c
SLEEP,		1000
SENDInput,	ping%A_Space%10.8.10.50%A_Space%so%A_Space%^v
RETURN

; ----------------------------------

;;;;;;;;;;;;;;;;; Separator '-'
F12::
SENDInput,	{ENTER 2}
SENDInput,	{- 25}
SENDInput,	{ENTER}
RETURN



; ######################################### MAIN FUNCTIONS ##########################################
;;;;;;;;;;;;;;;;; Check UP Geral
F3::
Gosub,		root_p3
SENDInput,	conf{ENTER}
Gosub,		chk_routes_no_root
SLEEP,		500
Gosub,		chk_adsl_history_no_root
SLEEP,		500
Gosub,		chk_adsl_stats_no_root
SLEEP,		500
Gosub,		chk_port_status_no_root
SLEEP,		500
Gosub,		chk_dhcp_leases_no_root
SLEEP,		500
Gosub,		chk_3g_status_no_root
SENDInput,	exit{ENTER}
SLEEP,		500
Gosub,		chk_bgp_sum_no_root
SLEEP,		500
SENDInput,	exit{ENTER}
SLEEP,		500
SENDInput,	last{ENTER}
RETURN

; ----------------------------------

;;;;;;;;;;;;;;;;; Enable traces (ppp + cell) + Disable feature wrr-backup-wan (enable 3G) + Check 3G Status
F8::
Gosub,	root_p3
Gosub,	en_traces
Gosub,	dis_fe_wr
Gosub,	chk_3g_status
RETURN

;;;;;;;;;;;;;;;;; Disable traces (ppp + cell) + enable feature wrr-backup-wan (disable 3G)
!F8::
Gosub,	root_p3
Gosub,	dis_traces
Gosub,	en_fe_wr
RETURN
