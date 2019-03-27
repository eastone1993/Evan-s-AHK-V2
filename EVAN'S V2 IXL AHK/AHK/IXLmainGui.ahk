#SingleInstance, force 
#NoTrayIcon
#Persistent
#include %A_ScriptDir%\lib\GUILibrary.ahk 

SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
DetectHiddenWindows, On
SetTitleMatchMode, 2

EnvSet, fpath, %A_WorkingDir% 

IniRead, fsr, settings.ini, Settings, sendright 
IniRead, fnew_window, settings.ini, Settings, newwindow 
IniRead, fsm, settings.ini, Settings, subman 
IniRead, fsf, settings.ini, Settings, salesforce 

EnvSet, sr, %fsr% 
EnvSet, new_window, %fnew_window% 
EnvSet, sm, %fsm% 
EnvSet, sf, %fsf% 

Gui, +Resize 
Gui, Add, Tab3, , General|Personal|Search Settings

Gui, Tab, 1
BuildButton("mainscript", "Main Script", 55, 50, 205, 30)
BuildTap("CustomAHK", "Custom AHK", 55, 90, 205, 30)
BuildTap("splitfile", "Splitfile", 55, 130, 205, 30)
BuildTap("copyGUI", "Display Copy Macros", 55, 210, 205, 30)

Gui, Tab, 2
BuildTap("Spam", "Spam", 55, 50, 205, 30)
BuildTap("Cypher", "Cypher", 55, 90, 205, 30)
BuildButton("Test", "Test Script", 55, 130, 205, 30)
BuildButton("exceltesting", "Excel Testing", 55, 170, 205, 30)

Gui, Tab, 3
Gui, Add, Text,, Search Settings
Gui, Add, Radio, vSendRight0 gSEND_RIGHT_ON, Send right ON
Gui, Add, Radio, vSendRight1 gSEND_RIGHT_OFF, Send right OFF 
  
Gui, Add, Text,, 
Gui, Add, Text,,Triforce search options
Gui, Add, Radio, vNewWindow0 gNEW_WINDOW_ON, Create new window when searching 
Gui, Add, Radio, vNewWindow1 gNEW_WINDOW_OFF, Create new tab when searching
Gui, Add, Text,, 
Gui, Add, Text,,SubmanSearch for e-mail?
Gui, Add, Radio, vSubman0 gSUBMAN_SEARCH_ON, Subman search for e-mail included
Gui, Add, Radio, vSubman1 gSUBMAN_SEARCH_OFF, Don't use Subman for e-mail search
Gui, Add, Text,,
Gui, Add, Text,,SalesForce Search for Account number?
Gui, Add, Radio, vSalesForce0 gSALESFORCE_ON, SalesForce search for Account Number included
Gui, Add, Radio, vSalesForce1 gSALESFORCE_OFF, Don't include SalesForce for Account Number search 

Gui, Tab 
Gui, Add, Button, x10 y350 vReloadButton gRELOAD_ON, Reload 
Gui, Add, Radio, vOnTop gTOP_ON, AHK window always displayed 
Gui, Add, Radio, Checked vOnBottom gTOP_OFF, AHK window not always displayed 

;logic for settings selection on startup 
if (sr=1)
    GuiControl,,SendRight0, 1
else 
    GuiControl,,SendRight1, 1 

if (new_window=1)
    GuiControl, ,NewWindow0, 1 
else 
    GuiControl, ,NewWindow1, 1 

if (sm=1)
    GuiControl,,Subman0, 1
else 
    GuiControl,,Subman1, 1

if (sf=1)
    GuiControl,,SalesForce0, 1
else 
    GuiControl,,SalesForce1, 1

Gui, Show, w320 h450, IXL AHK 

scriptArray := ["CustomAHK", "mainscript", "auxillary\CypherGUI", "copyGUI", "splitfile", "Test", "exceltesting"]

return 
;----------------------------------- GENERAL TAB -------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----------------------------------- CUSTOM -------------------------------------------------------------------------------------------------------------
CustomAHKOn:
{
	Tap("CustomAHK", "\scripts")
	return
}
;----------------------------------- MAIN SCRIPT -------------------------------------------------------------------------------------------------------------
mainscriptOn:
{
	OnButton("mainscript", "\scripts")
	return
}
mainscriptOff:
{
	OffButton("mainscript", "\scripts")
	return 
}
;----------------------------------- SPLIT FILE  -------------------------------------------------------------------------------------------------------------
splitfileON:
{
    Tap("splitfile", "\scripts")
    return 
}
;----------------------------------- COPY MACROS DISPLAY -------------------------------------------------------------------------------------------------------------
copyGUIOn:
{
	Tap("copyGUI", "\scripts")
	return
}
;----------------------------------- PERSONAL TAB -------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----------------------------------- SPAM -------------------------------------------------------------------------------------------------------------
SpamOn:
{
    InputBox, str, Enter what you would like to say
    if ErrorLevel
        Exit 
    InputBox, num, Enter number of times 
    if ErrorLevel
        Exit 
    InputBox, rest, Enter how many seconds between spams
    if ErrorLevel 
        Exit 
    MsgBox, 4, Spam %str% %num% times for %rest% seconds?
    IfMsgBox, Yes 
    {
        tim := rest * 1000
        sleep 10000 
        loop, %num% 
        {
            sleep %tim%
            send %str% 
            send {enter}
        } 
    }   
    IfMsgBox, No 
        Exit 
    return      
}
;----------------------------------- CYPHER -------------------------------------------------------------------------------------------------------------
CypherOn:
{
    Tap("Cypher", "\scripts")
    return 
}
;----------------------------------- TEST BUTTON -------------------------------------------------------------------------------------------------------------
TestOn:
{
    OnButton("Test", "\scripts")
    return
}

TestOff:
{
    OffButton("Test", "\scripts")
    return 
}
;----------------------------------- EXCEL TESTING -------------------------------------------------------------------------------------------------------------
exceltestingOn:
{
    OnButton("exceltesting", "\scripts")
    return 
}

exceltestingOff:
{
    OffButton("exceltesting", "\scripts")
    return
}
;----------------------------------- SETTINGS TAB  -------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----------------------------------- SEND RIGHT SETTING -------------------------------------------------------------------------------------------------------------
SEND_RIGHT_ON:
{
    EnvSet, sr, 1  
    CheckForScript()
    return
}
SEND_RIGHT_OFF:
{
    EnvSet, sr, 0
    CheckForScript()
    return  
}
;----------------------------------- NEW WINDOW SETTING -------------------------------------------------------------------------------------------------------------
NEW_WINDOW_ON:
{
    EnvSet, new_window, 1
    CheckForScript()  
    return
}
NEW_WINDOW_OFF:
{
    EnvSet, new_window, 0 
    CheckForScript()
    return 
}
;----------------------------------- SUBMAN SEARCH SETTING  -------------------------------------------------------------------------------------------------------------
SUBMAN_SEARCH_ON:
{
    EnvSet, sm, 1
    CheckForScript()
    return
}
SUBMAN_SEARCH_OFF:
{
    EnvSet, sm, 0 
    CheckForScript()
    return 
}
;----------------------------------- SALES FORCE SEARCH SETTING -------------------------------------------------------------------------------------------------------------
SALESFORCE_ON:
{
    EnvSet, sf, 1
    CheckForScript()  
    return 
}
SALESFORCE_OFF:
{
    EnvSet, sf, 0  
    CheckForScript()
    return 
}
;----------------------------------- NO TAB -------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----------------------------------- RELOAD -------------------------------------------------------------------------------------------------------------
RELOAD_ON:
{
	SubmitSettings()
    ExitAllArray("\scripts", ".ahk", scriptArray)
	Reload 
	return 
}
;----------------------------------- WINDOW PRIORITY CONTROLS -------------------------------------------------------------------------------------------------------------
TOP_ON:
{
    Gui, +AlwaysOnTop
    return
}
TOP_OFF:
{
    WinSet, AlwaysOnTop, Off 
    return 
}
;------------------------------------------------------------------------------------------------------------------------------------------------
GuiClose:
SubmitSettings()
ExitAllArray("\scripts", ".ahk", scriptArray)
ExitApp
;----------------------------------- FUNCTIONS -------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;------------------------------------------------------------------------------------------------------------------------------------------------
CheckForScript() {
	if WinExist("mainscript.ahk")
	{
		Tap("searchkey", "\scripts\auxillary")
		return 
	}
}

SubmitSettings() {
    Gui, Submit 
    IniWrite, %sr%, settings.ini, Settings, sendright 
    IniWrite, %new_window%, settings.ini, Settings, newwindow 
    IniWrite, %sm%, settings.ini, Settings, subman 
    IniWrite, %sf%, settings.ini, Settings, salesforce 
    return 
}