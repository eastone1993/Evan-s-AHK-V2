#SingleInstance, force 
#NoTrayIcon

#IfWinNotExist, `%A_ScriptDir`%\auxillary\CypherGUI.ahk 
{
    Run, %A_ScriptDir%\auxillary\CypherGUI.ahk 
    ExitApp
} 

#IfWinExist, `%A_ScriptDir`%\auxillary\CypherGUI.ahk 
{
	ExitApp 
}