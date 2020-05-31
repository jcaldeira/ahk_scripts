;;;;;;;;;;;;;;;;; Symbols and descriptions
; ^ - Ctrl
; # - Windows
; + - Shift
; ! - Alt
; & - An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.

pwd := "scml#CLD0"

#IfWinActive ahk_class PuTTYNG

;;;;;;;;;;;;;;;;; SSH Command
F1::
SendInput, {Blind}{Text}ssh jcaldeira@
SendInput, ^v{ENTER}
Return

; ----------------------------------

;;;;;;;;;;;;;;;;; Password
F2::
SendInput, {Blind}{Text}%pwd%`n
Return

; ----------------------------------

;;;;;;;;;;;;;;;;; Root + p 3
root_p3:
SendInput, ^p
Sleep, 500
SendInput, {Blind}{Text}p 3`n
Return

; Root + p 5
root_p5:
SendInput, ^p
Sleep, 500
SendInput, {Blind}{Text}p 5`n
Return

; ----------------------------------

;;;;;;;;;;;;;;;;; Check 3G Status
chk_3g_status:
!F4::
Gosub, root_p3
Sleep, 500
SendInput, {Blind}{Text}net cellular1/0`n
Sleep, 500
SendInput, {Blind}{Text}net status`n
Return

;;;;;;;;;;;;;;;;; Check 3G Status (no root)
chk_3g_status_no_root:
SendInput, {Blind}{Text}net cellular1/0`n
Sleep, 500
SendInput, {Blind}{Text}net status`n
Return

; ----------------------------------

;;;;;;;;;;;;;;;;; Check routes
chk_routes:
F4::
Gosub, root_p3
Sleep, 500
SendInput, {Blind}{Text}pro ip`n
Sleep, 500
SendInput, {Blind}{Text}dump`n
Sleep, 500
SendInput, {Blind}{Text}n`n
Sleep, 500
SendInput, {Blind}{Text}exit`n
Return

;;;;;;;;;;;;;;;;; Check routes (no root)
chk_routes_no_root:
SendInput, {Blind}{Text}pro ip`n
Sleep, 500
SendInput, {Blind}{Text}dump`n
Sleep, 500
SendInput, {Blind}{Text}n`nexit`n
Return

; ----------------------------------

;;;;;;;;;;;;;;;;; Check port status
chk_port_status:
^F4::
Gosub, root_p3

SendInput, {Blind}{Text}network ethernet0/0`n
Sleep, 500
SendInput, {Blind}{Text}repeater-switch`n
Sleep, 500
SendInput, {Blind}{Text}list status`n
Sleep, 500
SendInput, {Blind}{Text}exit`n
Sleep, 500
SendInput, {Blind}{Text}exit`n
Return

;;;;;;;;;;;;;;;;; Check port status (no root)
chk_port_status_no_root:
SendInput, {Blind}{Text}network ethernet0/0`n
Sleep, 500
SendInput, {Blind}{Text}repeater-switch`n
Sleep, 500
SendInput, {Blind}{Text}list status`n
Sleep, 500
SendInput, {Blind}{Text}exit`n
Sleep, 500
SendInput, {Blind}{Text}exit`n
Return

; ----------------------------------

;;;;;;;;;;;;;;;;; Check DHCP leases
chk_dhcp_leases:
+F4::
Gosub, root_p3
Sleep, 500
SendInput, {Blind}{Text}pro dh`n
Sleep, 500
SendInput, {Blind}{Text}serv`n
Sleep, 500
SendInput, {Blind}{Text}lea`n
Sleep, 500
SendInput, {Blind}{Text}exit`n
Sleep, 500
SendInput, {Blind}{Text}exit`n
Return

;;;;;;;;;;;;;;;;; Check DHCP leases (no root)
chk_dhcp_leases_no_root:
SendInput, {Blind}{Text}pro dh`n
Sleep, 500
SendInput, {Blind}{Text}serv`n
Sleep, 500
SendInput, {Blind}{Text}lea`n
Sleep, 500
SendInput, {Blind}{Text}exit`n
Sleep, 500
SendInput, {Blind}{Text}exit`n
Return

; ----------------------------------

;;;;;;;;;;;;;;;;; Enable traces (ppp + cell)
en_traces:
Gosub, root_p3
Sleep, 500
SendInput, {Blind}{Text}event`n
Sleep, 500
SendInput, {Blind}{Text}enable trace subsystem cell all`n
Sleep, 500
SendInput, {Blind}{Text}enable trace subsystem ppp all`n
Sleep, 500
SendInput, {Blind}{Text}view`n
Return

;;;;;;;;;;;;;;;;; Disables traces (ppp + cell)
dis_traces:
Gosub, root_p3
Sleep, 500
SendInput, {Blind}{Text}event`n
Sleep, 500
SendInput, {Blind}{Text}disable trace subsystem cell all`n
Sleep, 500
SendInput, {Blind}{Text}disable trace subsystem ppp all`n
Sleep, 500
SendInput, hide`n
Return

; ----------------------------------

;;;;;;;;;;;;;;;;; Disable feature wrr-backup-wan in feature-conf (enable 3G)
dis_fe_wr:
Gosub, root_p5
Sleep, 500
SendInput, {Blind}{Text}fe wrr`n
Sleep, 500
SendInput, {Blind}{Text}pair 1 no active`n
Sleep, 500
SendInput, {Blind}{Text}pair 2 no active`n
Sleep, 500
SendInput, {Blind}{Text}pair 3 no active`n
Return

;;;;;;;;;;;;;;;;; Enable feature wrr-backup-wan in feature-conf (disable 3G)
en_fe_wr:
Gosub, root_p5
Sleep, 500
SendInput, {Blind}{Text}fe wrr`n
Sleep, 500
SendInput, {Blind}{Text}pair 1 active`n
Sleep, 500
SendInput, {Blind}{Text}pair 2 active`n
Sleep, 20000
SendInput, {Blind}{Text}pair 3 active`n
Return

; ----------------------------------

;;;;;;;;;;;;;;;;; Check ADSL history
chk_adsl_history:
F7::
Gosub, root_p3
SendInput, {Blind}{Text}net atm`n
Sleep, 500
SendInput, {Blind}{Text}phy`n
Sleep, 500
SendInput, {Blind}{Text}his`n
Sleep, 500
SendInput, {Blind}{Text}exi`n
Sleep, 500
SendInput, {Blind}{Text}exi`n
Return

;;;;;;;;;;;;;;;;; Check ADSL history (no root)
chk_adsl_history_no_root:
SendInput, {Blind}{Text}net atm`n
Sleep, 500
SendInput, {Blind}{Text}phy`n
Sleep, 500
SendInput, {Blind}{Text}his`n
Sleep, 500
SendInput, {Blind}{Text}exi`n
Sleep, 500
SendInput, {Blind}{Text}exi`n
Return

; ----------------------------------

;;;;;;;;;;;;;;;;; Check ADSL statistics
chk_adsl_stats:
!F7::
Gosub, root_p3
Sleep, 500
SendInput, {Blind}{Text}device atm`n
Sleep, 500
SendInput, {Blind}{Text}yes`n
Sleep, 500
SendInput, {Blind}{Text}no`n
Sleep, 500
SendInput, {Blind}{Text}yes`n
Return

;;;;;;;;;;;;;;;;; Check ADSL statistics (no root)
chk_adsl_stats_no_root:
SendInput, {Blind}{Text}device atm`n
Sleep, 500
SendInput, {Blind}{Text}yes`n
Sleep, 500
SendInput, {Blind}{Text}no`n
Sleep, 500
SendInput, {Blind}{Text}yes`n
Return

; ----------------------------------

;;;;;;;;;;;;;;;;; Check BGP summary
chk_bgp_sum:
F6::
Gosub, root_p3
Sleep, 500
SendInput, {Blind}{Text}pro bgp`n
Sleep, 500
SendInput, {Blind}{Text}summ`n
Return

;;;;;;;;;;;;;;;;; Check BGP summary (no root)
chk_bgp_sum_no_root:
SendInput, {Blind}{Text}pro bgp`n
Sleep, 500
SendInput, {Blind}{Text}summ`n
Return

; ----------------------------------

;;;;;;;;;;;;;;;;; Ping tests
F9::
;ClipSaved := ClipboardAll
SendInput, {Blind}{Text}ping%A_Space%
SendInput, ^v
SendInput, {Blind}{Text}%A_Space%repeat%A_Space%4
Sleep 500
SendInput, {Blind}{Text}`n
Sleep, 5000
SendInput, {Blind}{Text}ping%A_Space%10.8.10.50%A_Space%so%A_Space%
SendInput, ^v
SendInput, {Blind}{Text}%A_Space%repeat%A_Space%4
Return

; ----------------------------------

;;;;;;;;;;;;;;;;; Separator '-'
F12::
SendInput, {Blind}{Text}`n`n
SendInput, {- 25}
SendInput, {Blind}{Text}`n
Return



; ######################################### MAIN FUNCTIONS ##########################################
;;;;;;;;;;;;;;;;; Check UP Geral Teldat
F3::
Gosub, root_p3
SendInput, {Blind}{Text}conf`n
Gosub, chk_routes_no_root
Gosub, chk_adsl_history_no_root
Gosub, chk_adsl_stats_no_root
Gosub, chk_port_status_no_root
Gosub, chk_dhcp_leases_no_root
Gosub, chk_3g_status_no_root
SendInput, {Blind}{Text}exit`n
Sleep, 500
Gosub, chk_bgp_sum_no_root
SendInput, {Blind}{Text}exit`n
Sleep, 500
SendInput, {Blind}{Text}last`n
Return

; ----------------------------------

;;;;;;;;;;;;;;;;; Enable traces (ppp + cell) + Disable feature wrr-backup-wan (enable 3G) + Check 3G Status
F8::
Gosub, en_traces
Gosub, dis_fe_wr
Gosub, chk_3g_status
Return

;;;;;;;;;;;;;;;;; Disable traces (ppp + cell) + enable feature wrr-backup-wan (disable 3G)
!F8::
Gosub, dis_traces
Gosub, en_fe_wr
Return

; ----------------------------------

;;;;;;;;;;;;;;;;; Check UP Geral Cisco
!F3::
SendInput, {Blind}{Text}term len 0`n
Sleep, 500
SendInput, {Blind}{Text}sh ver`n`n`n`n`n
Sleep, 500
SendInput, {Blind}{Text}sh ip int b`n`n`n`n`n
Sleep, 500
SendInput, {Blind}{Text}sh mac addr int gi0/1/0`n`n`n`n`n
Sleep, 500
SendInput, {Blind}{Text}sh ip route `n`n`n`n`n
Sleep, 500
SendInput, {Blind}{Text}sh ip bgp sum `n`n`n`n`n
Sleep, 500
SendInput, {Blind}{Text}sh ip dhcp binding`n`n`n`n`n
Sleep, 500
SendInput, {Blind}{Text}sh cel 0/2/0 radio `n`n`n`n`n
Sleep, 500
SendInput, {Blind}{Text}sh cel 0/2/0 profile `n`n`n`n`n
Sleep, 500
SendInput, {Blind}{Text}sh log`n`n`n`n`n
Return