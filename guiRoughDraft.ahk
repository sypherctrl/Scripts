/*
<hotkey>::<action>>
^ = CTRL
! = ALT
+ = SHIFT
# = WIN KEY

; Special keys (f-keys, etc) Wrap in {}
{F1} {F2} {F3}
*/

; ----------------------------------
; HOTKEYS 
; ----------------------------------

F12::OpenCalc()

; Press Ctrl+Shift+Esc  → open Task Manager (same as Windows)
^+Esc::OpenTaskMgr()

; ----------------------------------
; FUNCTIONS
; ----------------------------------

OpenCalc() {
	Run("calc.exe")
}

OpenTaskMgr() {
	Run("taskmgr.exe")
}

AltTabOnce() {
    ; Alt+Tab 1x (switch to previous window)
    Send("!{Tab}")
}

FullscreenToggle() {
    ; Alt+Enter (common fullscreen toggle)
    Send("!{Enter}")
}


; ----------------------------------
;  GUI
; ----------------------------------

g := Gui("+AlwaysOnTop +ToolWindow", "Game Utility Pad")
g.MarginX := 10
g.MarginY := 10

btnCalc := g.Add("Button", "x10 y10  w180 h30", "Open Calculator")
btnCalc.OnEvent("Click", (*) => OpenCalc())

btnTM := g.Add("Button", "x10 y50  w180 h30", "Open Task Manager")
btnTM.OnEvent("Click", (*) => OpenTaskMgr())

btnAltTab := g.Add("Button", "x10 y90  w180 h30", "Alt+Tab Once")
btnAltTab.OnEvent("Click", (*) => AltTabOnce())

btnFS := g.Add("Button", "x10 y130 w180 h30", "Alt+Enter (Fullscreen)")
btnFS.OnEvent("Click", (*) => FullscreenToggle())

g.OnEvent("Close", (*) => ExitApp())
g.Show()
