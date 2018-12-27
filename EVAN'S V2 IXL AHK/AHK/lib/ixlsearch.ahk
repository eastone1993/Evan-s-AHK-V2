#SingleInstance, force 
#NoTrayIcon

OpenNewWindow() { ;ensures that new window is created properly when called 
	run, "chrome.exe" ;opens new window
	;sleep 500 ;give time to open window
	WinWait, New Tab,, 1 ;waits 2 seconds to see if new window is opened
	if ErrorLevel { ;if 2 seconds passes and no window has been opened, retry 
		i := i+1 ;iteration
		if (i<=5) { ;iterates no more than 5 times
			OpenNewWindow() ;try again 
		}
		else {
			MsgBox, Search unexpectedly failed. Try again. 
			exit ;after 5 times exit thread  
		}
	}
	else { ;continue 
		return 
	}
}

NewWindowSetting(Byref new_window) {
    if(new_window = true)
    { 
        OpenNewWindow()
        winactivate ahk_exe chrome.exe
        sleep 500
        new_window := false 
        return    
    }
    else if(new_window = false)
    {
        winactivate ahk_exe chrome.exe 
        Send, ^t
        sleep 100
        return 
    }
}

SendRightSearchSetting(Byref sr) {
    if (sr = true)
    {
        sleep 250
        Send, #+{Right} 
    }
    return 
}

SFSearch(Byref contents, Byref new_window) {
    NewWindowSetting(new_window)
    var1 := "https://ixl.my.salesforce.com/_ui/search/ui/UnifiedSearchResults?searchType=2&sen=0JZ&sen=001&sen=02s&sen=068&sen=003&sen=00T&sen=00U&sen=005&sen=500&sen=00O&str=" . contents
    var2 := var1 . "&isdtp=vw&isWsVw=true&nonce=02541659de9dde0d96e44d154840e14be6f2bb3fcc1022859c569e3e55629581&sfdcIFrameOrigin=https%3A%2F%2Fixl.my.salesforce.com"
    ClipWait
    Clipboard := var2
    sleep, 500 ;wait for page to load
    Send, ^v
    Send, {enter}
    Clipboard := contents 
    return 
}

SubmanSearch(Byref contents, Byref new_window) {
    NewWindowSetting(new_window)
    sleep 150
    Clipboard := "https://secure.quia.com/actions/subManager/search/sub"
    Send, ^v
    Send, {enter}
    Clipboard :=
    sleep, 1500 ;wait for page to load
    Clipboard := contents
    clipwait 
    Send {Tab 10} ;tab down for the win
    sleep 100
    Send, ^v
    Send, {enter}
    return 
}

SubmanAccountSearch(Byref contents, Byref new_window) {
    NewWindowSetting(new_window)
    Variable := "https://secure.quia.com/actions/subManager/account/view/" . contents
    ClipWait    
    Clipboard := Variable
    sleep, 500
    Send, ^v
    Send, {enter}
    return 
}

QuiaSearch(Byref contents, Byref new_window) {
    NewWindowSetting(new_window)
    Variable := "https://secure.quia.com/servlets/quia.internal.userInfo.UserInfo?logicModule=1&email=" . contents
    ClipWait
    Clipboard := Variable
    Send, ^v
    Send, {enter}
    Clipboard := contents
    return 
}

IXLSearchSetting(Byref thing, Byref new_window, Byref sr, Byref sm, Byref sf) {
    
    new_window_setting := new_window ;saves new_window's mode 
    if RegExMatch(thing, "[\w-_.]+@(?:\w+(?::\d+)?\.){1,3}(?:\w+\.?){1,2}", contents) {
        QuiaSearch(contents, new_window)
        SFSearch(contents, new_window)
        ;MsgBox, subman 
        if(sm = true)
        {
            ;MsgBox, subman runs 
            SubmanSearch(contents, new_window)

        }
        ;MsgBox, No subman 
        ;send right setting 
        SendRightSearchSetting(sr)
    }
    else 
    {
        Length := StrLen(thing)
        ;MsgBox, %thing% %Length%
        if (Length=8) ;CASE NUMBERS ARE 8 DIGITS ALWAYS
        {
            SFSearch(thing, new_window)
            MsgBox, case number 
        }
        else ;ACCOUNT NUMBER WITHOUT PREFIX
        {
            if(sf = true)
            { 
                SFSearch(thing, new_window)
            }
            SubmanAccountSearch(thing, new_window)
        }

        ;send right setting 
        SendRightSearchSetting(sr)
    }

    new_window := new_window_setting ;sets new_window to original mode 

    return 

}

