;;;;;;;;;;;;;;;;; Symbols and descriptions
; ^ - Ctrl
; # - Windows
; + - Shift
; ! - Alt
; & - An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.

pwd := "scml#CLD0"

;;;;;;;;;;;;;;;;; SSH Command
F1::
SendInput, {Blind}{Text}ssh jcaldeira@
SendInput,	^v{ENTER}
RETURN

; ----------------------------------

;;;;;;;;;;;;;;;;; Password
F2::
SendInput,  {Blind}{Text}%pwd%`n
RETURN

; ----------------------------------

;;;;;;;;;;;;;;;;; Check UP Geral
F3::
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

; ----------------------------------
