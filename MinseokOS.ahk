; ==========================
; MinseokOS AutoHotkey 리팩토링 버전 (모든 기능 포함)
; 모드 시스템: Default / Document / Number / Document+Number
; ==========================
;추가 패치 : hotstrings 기능 추가.

mode := "Document"

;hotstrings
::;exc::
FormatTime, Today,, yyyy-MM-dd
SendInput, %Today%.daily.excalidraw
Return

::;bok::
FormatTime, Today,, yyyy-MM-dd
SendInput, %Today%.daily.booknote.md
Return

::;ahk::
SendInput, autohotkey
Return

::;not::
SendInput, notion
Return

; ==========================
; 모드 전환 단축키
; ==========================

#If (mode = "Default")
!z:: mode := "Document", ShowMode("문서모드 (1)")
!h:: mode := "Number", ShowMode("숫자모드 (3)")
#If

#If (mode = "Document")
!z:: mode := "Default", ShowMode("기본모드 (4)")
!h:: mode := "Document, Number", ShowMode("문서+숫자모드 (2)")
#If

#If (mode = "Document, Number")
!z:: mode := "Number", ShowMode("숫자모드 (3)")
!h:: mode := "Document", ShowMode("문서모드 (1)")
#If

#If (mode = "Number")
!z:: mode := "Document, Number", ShowMode("문서+숫자모드 (2)")
!h:: mode := "Default", ShowMode("기본모드 (4)")
#If

ShowMode(label) {
    ToolTip, 🧠 현재 모드: %label%
    SetTimer, RemoveToolTip, -1500
    return
}

RemoveToolTip() {
    ToolTip
    return
}

; ==========================
; Document & Document, Number 모드 공통 키
; ==========================

#If (mode = "Document" || mode = "Document, Number")

!i:: Send {Up}
!k:: Send {Down}
!j:: Send {Left}
!l:: Send {Right}
+!i:: Send +{Up}
+!k:: Send +{Down}
+!j:: Send +{Left}
+!l:: Send +{Right}
^!j:: Send ^{Left}
^!l:: Send ^{Right}
+^!j:: Send ^+{Left}
+^!l:: Send ^+{Right}
+^!i:: Send ^+{Up}
+^!k:: Send ^+{Down}

!u:: Send {Home}
!o:: Send {End}
+!u:: Send +{Home}
+!o:: Send +{End}

!e:: Send {Up}
!d:: Send {Down}
!s:: Send {Left}
!f:: Send {Right}
^!s:: Send ^{Left}
^!f:: Send ^{Right}
+^!s:: Send ^+{Left}
+^!f:: Send ^+{Right}
+^!e:: Send ^+{Up}
+!d:: Send +{Down}
+!e:: Send +{Up}
+!s:: Send +{Left}
+!f:: Send +{Right}

!w:: Send {Home}
!r:: Send {End}
!a:: Send {Backspace}
!q:: Send {Delete}
!t:: Send #+s
!g:: Send {Enter}
^!g:: Send ^{Enter}
+!w:: Send +{Home}
+!r:: Send +{End}
+!t:: Send +{PgUp}
+!g:: Send +{PgDn}

!Space:: Send {Enter}
^!Space:: Send ^{Enter}
+!Space:: Send +{Enter}

!v:: Send +{F6}
!c:: Send {F6}

!n:: Send ^#{Left}
!m:: Send ^#{Right}

^+b::Send ^b
^+b Up::Send ^+h

!x:: Send {Escape}

^y::
Send ^t
Sleep 500
Send ^{space}
Sleep 500
Send ^h
Return

!,:: Send !{Left}
!.:: Send !{Right}
#!i:: Send #{Up}
#!k:: Send #{Down}
#!j:: Send #{Left}
#!l:: Send #{Right}

!1::
Send ^/
Sleep 300
Send 1
Sleep 300
Send {Down}
Sleep 300
Send {Enter}
Return

!2::
Send ^/
Sleep 300
Send 2
Sleep 300
Send {Down}
Sleep 300
Send {Enter}
Return

!3::
Send ^/
Sleep 300
Send 3
Sleep 300
Send {Down}
Sleep 300
Send {Enter}
Return

!4::Send ^+4
!5::Send ^+5
!6::Send ^+6
!7::Send ^+7
!8::Send ^+8
!9::Send ^+9
#If

; ==========================
; Number & Document, Number 공통 숫자패드
; ==========================

#If (mode = "Number" || mode = "Document, Number")
!n:: Send 0
!m:: Send 1
!,:: Send 2
!.:: Send 3
!j:: Send 4
!k:: Send 5
!l:: Send 6
!u:: Send 7
!i:: Send 8
!o:: Send 9
#If