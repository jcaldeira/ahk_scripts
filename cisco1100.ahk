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

;;;;;;;;;;;;;;;;; Check UP Geral
F3::
SENDInput,	terminal length 0{ENTER}
SENDInput,	sh version {SPACE 2}{ENTER 6}
SENDInput,	sh ip interface brief {ENTER 6}
SENDInput,  sh mac address-table int gi0/1/0 {ENTER 6}
SENDInput,	sh ip route {ENTER 6}
SENDInput,	sh ip bgp summary {ENTER 6}
SENDInput,	sh ip dhcp binding {SPACE 3}{ENTER 6}
SENDInput,	sh cel 0/2/0 radio {ENTER 6}
SENDInput,	sh cel 0/2/0 profile {ENTER 6}
SENDInput,	sh log {SPACE 3}{ENTER 6}
RETURN

; ----------------------------------
