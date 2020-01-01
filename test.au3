#include <GDIPlus.au3>
#include "_ImageSearchEX.au3"
$port='21503'

;click
;RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' shell input tap 825 428', "", @SW_HIDE)
;send text
;RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' shell input text "nghiahsgs"', "", @SW_HIDE)

;chup man hinh
;RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' shell screencap -p /sdcard/screen.png', "", @SW_HIDE)
;RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' pull /sdcard/screen.png "C:\Users\nghiahsgs\Desktop\abd bai 2\tmp\screen.png"', "", @SW_HIDE)


;MsgBox(0,0,0)
























_GDIPlus_Startup()
$Bitmap = _GDIPlus_BitmapCreateFromFile(@ScriptDir & '\tmp\0.png')
$hBitmap = _GDIPlus_BitmapCreateHBITMAPFromBitmap($Bitmap)

_searchClick('bg')


_GDIPlus_BitmapDispose($Bitmap)
_WinAPI_DeleteObject($hBitmap)

_GDIPlus_Shutdown()


Func _searchClick($name)
	;Searching for the image
	Local $aCoords = _ImageSearchAreaEX(@ScriptDir & '\image\' & $name & '.bmp', $hBitmap, 0, 0, @DesktopWidth, @DesktopHeight, 10)

	If IsArray($aCoords) Then
		;ConsoleWrite(@MDAY & '/' & @MON & ' ' & @HOUR & ':' & @MIN & ':' & @SEC & ' "' & $name & '" found at ' & $aCoords[0] & "," & $aCoords[1] & @CRLF)
		;FileWrite(@ScriptDir & '/log-' & $port & '.txt', @MDAY & '/' & @MON & ' ' & @HOUR & ':' & @MIN & ':' & @SEC & ' "' & $name & '" found at ' & $aCoords[0] & "," & $aCoords[1] & @CRLF)
		MsgBox(0,0,'co')
		MsgBox(0,0,$aCoords[0])
		MsgBox(0,0,$aCoords[1])
		;Run(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' shell input tap ' & $aCoords[0] & ' ' & $aCoords[1], "", @SW_HIDE)
	Else
		MsgBox(0,0,'khong')
		Sleep(200)
	EndIf
EndFunc   ;==>_searchClick
$port='21503'




MsgBox(0,0,0)

#RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' shell screencap -p | perl -pe "binmode(STDOUT);s/\r\n/\n/g" > "' & @ScriptDir & '\tmp\' & $port & '.png"', "", @SW_HIDE)
#RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' shell screencap -p /sdcard/screen.png| perl -pe "binmode(STDOUT);s/\r\n/\n/g" > "' & @ScriptDir & '\tmp\' & $port & '.png"', "", @SW_HIDE)

for $i=0 to 5
	RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' shell screencap -p /sdcard/screen.png', "", @SW_HIDE)
	RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' pull /sdcard/screen.png "C:\Users\nghiahsgs\Desktop\abd bai 2\tmp\'&$i&'.png"', "", @SW_HIDE)
	#MsgBox(0,0,$i)
	Sleep(1000)
Next
#cs

;adb -s ip shell tap
RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' shell input tap 511 153', "", @SW_HIDE)
Sleep(1000)
RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' shell input tap 325 68', "", @SW_HIDE)
Sleep(1000)
RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' shell input text bird', "", @SW_HIDE)
Sleep(1000)
RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' shell input keyevent 66', "", @SW_HIDE)
#ce