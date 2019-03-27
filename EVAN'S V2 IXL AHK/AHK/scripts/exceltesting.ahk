#SingleInstance, force 
#persistent 

try XL := ComObjActive("Excel.Application") ;handle to running Excel app

Catch {
	MsgBox "no existing Excel object: Need to create one"
	XL := ComObjCreate("Excel.Application")
}
XL.Visible := 1 ;1=Visible/Default 0=hidden
MsgBox % "is an object?" IsObject(XL)


