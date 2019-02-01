#SingleInstance, force 
#Persistent

^+b::

WinGet, ActiveControlList, ControlList, A

Loop, Parse, ActiveControlList, `n
{
    ControlGetText, theText, %A_LoopField%
    FileAppend, Control#: %a_index%`tClassNN:%A_LoopField%`tControlText:%theText%`n, %A_Desktop%\controls.txt
}
MsgBox, Done!
return

^+m::
ControlSend, , hello {enter}, ahk_class Chrome_WidgetWin_1
MsgBox, done
return 

