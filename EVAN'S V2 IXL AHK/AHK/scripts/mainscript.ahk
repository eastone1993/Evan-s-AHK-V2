#Persistent
#SingleInstance, force 
#Include %A_WorkingDir%\lib\ixlsearch.ahk 
#IfWinNotExist, `%A_ScriptDir`%\auxillary\CopyMacros.ahk
{
	Run, %A_ScriptDir%\auxillary\CopyMacros.ahk  
}
#IfWinNotExist, `%A_ScriptDir`%\auxillary\ExcelHotkeys.ahk 
{
	Run, %A_ScriptDir%\auxillary\ExcelHotkeys.ahk 
}
#IfWinNotExist, `%A_ScriptDir`%\auxillary\searchkey.ahk 
{
  Run, %A_ScriptDir%\auxillary\searchkey.ahk 
}

OnExit("ExitFunc")

ExitFunc() {
	DetectHiddenWindows, On 
	WinClose, %A_ScriptDir%\auxillary\CopyMacros.ahk ahk_class AutoHotkey
	WinClose, %A_ScriptDir%\auxillary\ExcelHotkeys.ahk ahk_class AutoHotkey 
  WinClose, %A_ScriptDir%\auxillary\searchkey.ahk ahk_class AutoHotkey
	return 
}

;MsgBox, New Window: %nw%   sr:%sendr%   sm:%subm%   sf:%sfor%

;----------------------------------- SPELL CORRECT -------------------------------------------------------------------------------------------------------------
::signin::sign-in
:*?:sign in::sign-in 
:*?:recieve::receive 
::setup::set-up
::checkin::check-in
:*?:email::e-mail
:*?:seperate::separate
:*?:reccommend::recommend 
::ixl::IXL 
::teh::the 
::id::ID 
::ok::okay 
::managment::management 
:*?:neccessary::necessary
:*:alot::a lot 
::can not::cannot 
::math::Math 
::ela::ELA
::science::Science 
::social studies::Social Studies 
::spanish::Spanish 
:?*:login::sign-in
::Thanks::Thank you
::i::I

;----------------------------------- DATE FUNCTION -------------------------------------------------------------------------------------------------------------
:R*?:ddd::
FormatTime, CurrentDateTime,, MM/dd/yyyy
SendInput %CurrentDateTime% + ES--------------------------------------------------------------------------{enter}{enter}{enter}{enter}{Up}{Up}
Return
;----------------------------------- SEARCH FUNCTIONS -------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----------------------------------- PHONE NUMBER SEARCH -------------------------------------------------------------------------------------------------------------
^+p::
Clipboard := 
Send ^c 
ClipWait 
contents := Clipboard 
contentsTrimmed = %contents%
winactivate ahk_exe chrome.exe 
SFSearch(contentsTrimmed, nw)
return 
;----------------------------------- TRIFORCE SEARCH -------------------------------------------------------------------------------------------------------------
;Triforce search was moved to an outside script to allow the reloading of itself 
;----------------------------------- GOOGLE SEARCH -------------------------------------------------------------------------------------------------------------
^+f::
Clipboard = 
Send ^c
ClipWait
contents := Clipboard
winactivate ahk_exe chrome.exe
Send ^t
sleep, 250
Send, ^v
Send, {enter}
Return
;----------------------------------- SHORTCUT SEARCH -------------------------------------------------------------------------------------------------------------
^+d::
; Identifies selected text as username or e-mail and searches for account
; Start off empty to allow ClipWait to detect when the text has arrived.
Clipboard =
Send ^c
; Wait for the clipboard to contain text.
ClipWait
contents := Clipboard
contentsTrimmed = %contents%
winactivate ahk_exe chrome.exe
Send, ^t
Variable := "https://secure.quia.com/servlets/quia.internal.userInfo.UserInfo?logicModule=1&email=" . contentsTrimmed
Clipboard := Variable
Send, ^v
Send, {enter}
Clipboard := email
Return
;----------------------------------- FETCH -------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;-------------------------------------------------------------------------------------------------------------------------------------------------------
:?*:xx::

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
;----------------------------------- AHK CODING SCRIPTS -------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----------------------------------- HEADERS -------------------------------------------------------------------------------------------------------------
:*:x;::;-----------------------------------  -------------------------------------------------------------------------------------------------------------{ctrl}{Left 110}
:*:;;::;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
:*:xtempheader::
(

Name: <FIRSTNAME> <LASTNAME>
Username: <USERNAME>
Initials: <INITIALS> 
Senior Specialist/Coordinator: <SENIORSPECIALIST>
Roster File Path: C:\Users\<USERNAME>\Desktop\Rosters

    )
:*:xspecheader::
(

Name: <FIRSTNAME> <LASTNAME>
Username: <USERNAME>
Initials: <INITIALS> 
Assistant: <ASSISTANT>
Roster File Path: C:\Users\<USERNAME>\Desktop\Rosters

    )

:*:x/::/*{enter}{enter}*/{Up}
;----------------------------------- HTML CODE -------------------------------------------------------------------------------------------------------------
:?*:xhtml::<{!}DOCTYPE html>
:*?:<div::<div></div>{Left 6}
:*?:<h1::<h1></h1>{Left 5} 
:*?:<h2::<h2></h2>{Left 5}
:*?:<h3::<h3></h3>{Left 5}
:*?:<h4::<h4></h4>{Left 5}
:?*:<p::<p></p>{Left 4}
:?*:<ul::<ul></ul>{Left 5}
:?*:<li>::<li></li>{Left 5}
:?*:<ol::<ol></ol>{Left 5}
:?*:<html::<html>{Enter 2}</html>{Up 1}
:?*:<head::<head>{Enter 2}</head>{Up 1}
:?*:<title::<title></title>{Left 8}
:?*:<style::<style></style>{Left 8}

:?*:<a href::<a href="" target=""></a>{Left 16}
:?*:<img src::<img src="" />{Left 4}
:?*:<video::<video src="" width="" height=""></video>{Left 29}

;----------------------------------- DEBUGGING HOTKEYS -------------------------------------------------------------------------------------------------------------
^+k::
msgbox % "my ahk version: " A_AhkVersion
return 

:?*:xget::
WinGetActiveTitle, act 
MsgBox % act 
return 

CoordMode, Caret, Screen

:?*:xslack::
WinActivate, Slack
return

:?*:xtest::
InputBox, win, Enter an active window to open
if ErrorLevel
{
    Exit 
}
WinActivate, %win%  
MsgBox, %win% activated
return 

^+y::
   ; MovePosX:=A_CaretX +100  ; Adjust 5 pixels to the right of A_CaretX position
    ;MovePosY:=A_CaretY +200 ; Adjust 10 Pixels above A_CaretY position
    MovePosX := A_ScreenWidth/2
    MovePosY := A_ScreenHeight/2
    MouseMove, %MovePosX% , %MovePosY%
Return
;-----------------------------------EOH-------------------------------------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;-----------------------------------EOH-------------------------------------------------------------------------------------------------------------
;END_OF_HEADER
::xwait::
(
Thanks for reaching out! It is fine if you can't send in your roster until school starts, however there are a few things I would like to mention:

1. Your account may go on hold. This isn't a major problem, the hold will be automatically lifted once you submit your initial student roster.
2. If you wait until school start s to send in your roster, it could take up to a week for us to process your request. This is due to the heightened amount of business expected to occur at the beginning of the school year.

Please let me know if you have any questions. I look forward to hearing back from you!
)


::xebest::
(
Is this the best e-mail to reach you by?

I look forward to hearing back from you! 
)


::xaddteacher::
(
To add teachers roster via upload:

   1. Sign-in to your IXL admin account
   2. Go to 'Upload Roster' or https://www.ixl.com/admin/upload-roster
   3. Follow the directions on screen to upload a teacher roster.

Note that the roster file must be in excel, and include the teachers' first and last names, as well as their e-mail address.

To add teachers manually:

   1. Sign-in to your IXL admin account.
   2. Go to 'Account Management' and then 'Teachers'
   3. From here, click 'Add Teachers'

From here, you can add teachers and decide what subjects will be available to them, as well as their usernames etc.
)


::xactkey::
(
Your subscription's activation instructions can be found on your License Information page. To find this page, please do the following:

   1. Sign-in to your IXL admin account.
   2. Go to Account Management.
   3. Click on 'License Info'

From here, you can see various pieces of information about your subscription. In the Subscription information section, underneath your school's renewal date, you will find the set-up for Teacher accounts that have already been using IXL. You can simply e-mail them the Activation Instructions, and it will send your subscription's activation key, along with instructions on how to correctly set-up their account.
)


::xguides::
(
Administrator Quick-start - (https://www.ixl.com/userguides/IXLQuickStart_Administrator.pdf)
Frequently Asked Questions - (https://www.ixl.com/help-center/School-administrators/665924)
Teacher Quick-start Guide - (https://www.ixl.com/userguides/IXLQuickStart_SiteRoster.pdf)
Upload Roster Quick-start Guide - (https://www.ixl.com/userguides/IXLQuickStart_UploadRoster.pdf)
IXL's Professional Learning - (https://www.ixl.com/community/professional-development/services)
)


::xeric::
(
My name is Eric, I am your school's IXL Account Specialist.
)


::xericsig::
(
Eric 
IXL Account Services Specialist
E-mail: ericv@ixl.com
Direct: 984-229-9433
)


::xhelp::
(
Forrest has been assisting me in setting up accounts for the upcoming school year. 
)


::btw::
(
by the way
)


::idk::
(
i don't know
)


::idc::
(
i don't care
)


::ikr::
(
I know, right?
)


::xvideos::
(
We have some great introductory videos in our Inspiration section: https://www.ixl.com/inspiration/videos . For a more in-depth look, we have archived webinars to help you explore and implement IXL in your classroom: https://www.ixl.com/inspiration/archived-webinars .
)


::xclass::
(
https://www.ixl.com/help-center/Class-rosters/1274193-can-i-organize-my-students-into-classes-and-view-ixl-analytics-for-individual-classes-/1274193
)


::xacces_rem::
(
You can access your admin account by following this link: 
)


::xinfo::
(
https://www.ixl.com/admin/license
)


::year to year::
(
year-to-year
)


::xaddadmin::
(
You can add admins by going to the 'Administrators' page of your own admin account, then clicking 'Add new admin.' This will allow you to give each person their own admin username as well. Please note that some usernames may be already in use on other subscriptions.
)


::xoutreach::
(
My name is Evan, I am your school's IXL Account Coordinator. I'm reaching out to see if you need any assistance with setting up for the new school year.

I look forward to hearing back from you!
)


::xgabi::
(
My name is Evan, I am an Account Coordinator with IXL. I am assisting Gabriella with your subscription. 
)


::xcustom::
(
1. Sign-in to your admin account.
2. Go to the Students page under the Account management tab.
3. Click in the Custom Label column for a student.
4. Select the 'XXX' label.
5. Click 'Save'.
)


::tro::
(
Thank you for reaching out.
)


::ihte::
(
I hope this e-mail finds you well. 
)


::lmk::
(
Please let me know if you have any questions. 
)


::tfyr::
(
Thank you for your reply. 
)


::gq::
(
Great question!
)


::ifhb::
(
I look forward to hearing back from you!
)


::xchkin::
(
I'm just reaching out to check-in on how your IXL account set-up is going.
)


::xevan::
(
My name is Evan, I am your school's IXL Account Specialist.
)


::xsi::
(
Please submit a complete student roster with the following student information in separate columns of an Excel spreadsheet:
   
   - First Name
   - Last Name
   - Student ID
   - Grade Level
   - Teacher last name or e-mail

Please note that all students' first name, last name, ID, and grade are required. 
)


::xwelcome::
(
Welcome to IXL! My name is Evan, I am your school's IXL Account Specialist. I will be assisting you in getting your students and teachers started with the program. 

To get started, using an Excel spreadsheet, please compile a roster with the following information in separate columns:

    - First name
    - Last name
    - Student ID number
    - Grade level
    - Teacher name  

If a student is associated with more than one teacher, please list each additional teacher separated by a semi-colon. 

Additionally, I will need a roster of all teachers using IXL this year containing the following information: 

    - First name 
    - Last name 
    - E-mail 

If a teacher has a trial account, please exclude them from the teacher list. I will send instructions on how to merge their trial account once the subscription is activated. 

Once the file is ready, please submit it to our secure uploading page using the following link: https://www.ixl.com/admin/upload-roster

I look forward to hearing from you and helping you get started with IXL!
)


::xfileupload::
(
https://www.ixl.com/admin/upload-roster
)


::xti::
(
Additionally, I will need a roster of all teachers using IXL this year containing the following information: 

    - First name 
    - Last name 
    - E-mail 
)


::xhold::
(
I hope this e-mail finds you well. I wanted to check-in and see if you had any questions regarding the information we need to create accounts for your students. Since we have not received a student list, your account has automatically gone on hold. Once you upload your list and create student accounts, the hold on your account will be lifted, and your students will be able to practice right away!

I look forward to hearing from you and helping you get started with IXL!
)


::xacces::
(
You can access your account and reset the password by following this link: 
)


::xadmin::
(
To create an admin account, you will need to do the following: 

     1. Sign-in to your own admin account. 
     2. Go to Account Management. 
     3. Go to the "Administrators" page. 
     4. Click on "Add new administrator."
     5. Type in the new admin's information and click submit. 

Please note that an admin account is different from a teacher account, and the two cannot be combined. 
)


::cmp::
(
completed
)


::xtake::
(
I will be taking over for Chris in assisting with your subscription. 
)


::xlausd::
(
Per LAUSD Policy, no student data can be directly sent to IXL, so we would need to begin the process of Auto-Rostering through the district if you wanted to update your subscription with new rosters.



Before we begin that process, I'll need to know how the district should filter your data to fit within your subscription. They can filter by grade, class enrollment, and/or teacher roster based on the information in your SIS. You can let me know how students should be filtered in this e-mail.
)

