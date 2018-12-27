#Persistent
#SingleInstance, force 
#NoTrayIcon
SetWorkingDir, %A_ScriptDir%
DetectHiddenWindows, On
SetTitleMatchMode, 2
WinClose, C:\Users\estone\AppData\Local\Programs\Python\Python37\python.exe ahk_class AutoHotkey

Gui, Show, h550 w600
Gui, Add, Edit, x10 y10 w580 r30 vCypherText
Gui, Add, Button, x95 y450 w200 h50 vCypher gCYPHER, Cypher!
Gui, Add, Button, x305 y450 w200 h50 vDeCypher gDECYPHER, DeCypher!

EnvGet, FileContents, INTERCOM 
GuiControl,, CypherText, %FileContents%

return 

CYPHER:
{
	Gui, Submit, NoHide 
	EnvSet, INTERCOM, %CypherText%
	Run, C:\Users\estone\AppData\Local\Programs\Python\Python37\python CesarCy.py  
	ExitApp 
	return 
}

DECYPHER:
{
	Gui, Submit, NoHide 
	EnvSet, INTERCOM, %CypherText%
	Run, C:\Users\estone\AppData\Local\Programs\Python\Python37\python DeCy.py
	ExitApp 
	return 
}

GuiClose:
ExitApp 