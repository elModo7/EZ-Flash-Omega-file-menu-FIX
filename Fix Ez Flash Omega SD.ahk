;@Ahk2Exe-SetName EZ Flash Omega menu file FIX
;@Ahk2Exe-SetDescription Fix ROMs not showing up in EZ Flash Menu
;@Ahk2Exe-SetVersion 1.0
;@Ahk2Exe-SetCopyright Copyright (c) 2020`, elModo7
;@Ahk2Exe-SetOrigFilename SD Fix Ez Flash Omega.exe
#NoEnv
#SingleInstance Force
SetBatchLines, -1
global contador
Gui +E0x10
Gui Font, s20 c0x0080C0
Gui Add, Text, x8 y21 w485 h47 +Center, Drag here your ROM folders
Gui, Font
Gui Add, StatusBar, vstatus, Ready
Gui, Show, w500 h100, EZ Flash OMEGA SD Fix
return

GuiDropFiles(GuiHwnd, FileArray, CtrlHwnd, X, Y) {
global
    for i, file in FileArray
    {
		SetWorkingDir, %file%
	    Loop, Files, *.*, R
		{
			contador++
		}
	}
    for i, file in FileArray
    {
		SetWorkingDir, %file%
	    Loop, Files, *.*, R
		{
			num++
			fichero := file "\" A_LoopFileName
			GuiControl,,status, % Round(num*100/contador) "% " fichero
			Run, attrib +A -R "%fichero%",, Hide
		}
	}
	MsgBox,,Success!, Your ROM files were patched successfully.
	contador := num := 0
	GuiControl,,status, Ready
}

GuiClose:
ExitApp