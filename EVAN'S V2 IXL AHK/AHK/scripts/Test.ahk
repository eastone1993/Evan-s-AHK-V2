#SingleInstance, force 
#Persistent

;----------------------------------- REDACTOR -------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----------------------------------- REDACTOR -------------------------------------------------------------------------------------------------------------

alpha_arr := ["0","1","a","b","c","d","e","f","g","h","i","2","3","A","B","C","D","E","F","G","H","I","4","5","j","k","l","m","n","o","p","q","6","7","J","K","L","M","N","O","P","Q","8","9","r","s","t","u","v","w","x","y","z"," ","!","R","S","T","U","V","W","X","Y","Z","@","#","$","%","^","&","*","(",")","-","_","+","=","`","~","{","}","[","]","\","|",";",":","'",",",".","/","?",">","<"] 

^+a::
Send ^c
sleep 250
string := Clipboard
array := []
Random, rand, 1, 93
;MsgBox rand: %rand%
Loop, Parse, string
{
  alpha_coord := GetIndexOf(A_LoopField, alpha_arr)
  code_coord := alpha_coord - rand 
  if (code_coord < 1)
    code_coord := code_coord + 94
  array.push(alpha_arr[code_coord])
}
array.push(alpha_arr[rand])
;MsgBox % Join("", array)
op := Join("", array)
Clipboard := op
Send ^v
return 
    
;----------------------------------- TRANSLATOR -------------------------------------------------------------------------------------------------------------
^!a::
Send ^c 
sleep 250
string := Clipboard
array := []
;key := asc(SubStr(string, 0))-94
key_char := SubStr(string, 0)
;MsgBox key_char: %key_char%
key_val := GetIndexOf(key_char, alpha_arr) 
;MsgBox key_val: %key_val%
newstring := SubStr(string, 1, -1)
;MsgBox newstring: %newstring%

Loop, Parse, newstring
{
  ;MsgBox % A_LoopField
  alpha_coord := GetIndexOf(A_LoopField, alpha_arr)
  ;MsgBox alpha_coord: %alpha_coord%
  code_coord := alpha_coord + key_val
  ;MsgBox code_coord: %code_coord%
  if (code_coord > 94)
  {
    code_coord := code_coord - 94
    ;MsgBox code_coord_mod: %code_coord%
  }
  ;MsgBox % alpha_arr[code_coord]
  array.push(alpha_arr[code_coord])
} 
op := Join("", array)
MsgBox % op 
return 


Join(s,p*) {
  static _:="".base.Join:=Func("Join")
  for k,v in p
  {
    if isobject(v)
      for k2, v2 in v
        o.=s v2
    else
      o.=s v
  }
  return SubStr(o,StrLen(s)+1)
}

GetIndexOf(e, arr) {
  for index, elem in arr
  {
    if (elem == e)
      return A_Index 
  }
  return 0
}
/*
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
*/
/*
^+r::
Send ^x
copy := Clipboard
sleep 100
send {tab}
sleep 100
send ^c
sleep 100 
Send %copy%
sleep 100
Send +{tab}
sleep 100
Send ^v 
Send {tab}
sleep 50
send {tab}
sleep 50
send {enter}
return 
*/


/*
:*?:y::er 
:*?:ame::erm 
:*?:or::er 
:*?:an::ern
:*?:on::ern  
:*?:e::er 
:*?:i::er
:*?:u::err
*/
/*
^+t::
Send, ^t
FormatTime, CurrentDateTime,, M/dd/yy
date := CurrentDateTime
Variable := "https://ixl.my.salesforce.com/500/e?/&cas7=Closed&cas11=Phone&cas14=PT : " . date
ClipWait
Clipboard := Variable
Send, ^v
Send {Enter}
sleep, 2000
Send {Enter}
Send, ^l
sleep, 3000
Send, ^c
RegExMatch(Clipboard, ".com\/(.*)", code)
Clipboard := "https://ixl.my.salesforce.com/00T/e?title=Call&what_id=" . code1 . "&followup=1&tsk6=%0APhone%20Number:%20%0AName:%0AUsername:%20%0AE-mail:%20%0AIssue:%20%0AResolution:%20&tsk5=Call&retURL=%2F" . code1
Send, ^l
Send, ^v
Send, {Enter}
Return
*/

;----------------------------------- FETCH -------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;-------------------------------------------------------------------------------------------------------------------------------------------------------
/*:?*:xx::

MovePosX := A_ScreenWidth/2
MovePosY := A_ScreenHeight/2

WinGetActiveTitle, derp 
Clipboard = 
Send, ^+{Left}
Send ^c 

fet := Clipboard

winactivate ahk_exe chrome.exe


Loop, 100
{
   WinGetTitle, Title, A  ;get active window title
   if(InStr(Title, "Fetch")>0)
   {
      GOTO, FETCH ; Terminate the loop
   }
   Send ^{Tab}
   Sleep, 50
}

Exit 

FETCH:
winactivate ahk_exe chrome.exe
MPY := MovePosY - 264
MouseClick, left, %MovePosX%, %MPY%

Send, ^+{Home}
Send, {BackSpace}
sleep 100
;Send, %fet%
Send, ^v
Send, {enter}
sleep 250

MouseClick, left, %MovePosX%, %MovePosY%

Loop, 100
{
    WinGetActiveTitle, herp
    ;MsgBox %herp% : %derp%
    if(InStr(herp, derp)>0)
    {
        break 
    }
    Send ^{tab}
    Sleep, 50
}

Send, ^v

return 
*/