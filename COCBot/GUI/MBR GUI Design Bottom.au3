; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file creates the bottom panel
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: GKevinOD (2014)
; Modified ......: DkEd, Hervidero (2015), CodeSlinger69 (2017)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once

Global $g_hBtnStart = 0, $g_hBtnStop = 0, $g_hBtnPause = 0, $g_hBtnResume = 0, $g_hBtnSearchMode = 0, $g_hBtnMakeScreenshot = 0, $g_hBtnHide = 0, $g_hBtnEmbed = 0, _
	   $g_hChkBackgroundMode = 0, $g_hLblDonate = 0, $g_hBtnAttackNowDB = 0, $g_hBtnAttackNowLB = 0, $g_hBtnAttackNowTS = 0
Global $g_hPicTwoArrowShield = 0, $g_hLblVersion = 0, $g_hPicArrowLeft = 0, $g_hPicArrowRight = 0
Global $g_hGrpVillage = 0
Global $g_hLblResultGoldNow = 0, $g_hLblResultGoldHourNow = 0, $g_hPicResultGoldNow = 0, $g_hPicResultGoldTemp = 0
Global $g_hLblResultElixirNow = 0, $g_hLblResultElixirHourNow = 0, $g_hPicResultElixirNow = 0, $g_hPicResultElixirTemp = 0
Global $g_hLblResultDENow = 0, $g_hLblResultDEHourNow = 0, $g_hPicResultDENow = 0, $g_hPicResultDETemp = 0
Global $g_hLblResultTrophyNow = 0, $g_hPicResultTrophyNow = 0, $g_hLblResultRuntimeNow = 0, $g_hPicResultRuntimeNow = 0, $g_hLblResultBuilderNow = 0, $g_hPicResultBuilderNow = 0
Global $g_hLblResultAttackedHourNow = 0, $g_hPicResultAttackedHourNow = 0, $g_hLblResultGemNow = 0, $g_hPicResultGemNow = 0, $g_hLblResultSkippedHourNow = 0, $g_hPicResultSkippedHourNow = 0
Global $g_hLblVillageReportTemp = 0, $g_hBtnTestVillage = 0
Global $ModSupportConfig = 0

Func CreateBottomPanel()
   Local $sTxtTip = ""
   ;~ ------------------------------------------------------
   ;~ Lower part visible on all Tabs
   ;~ ------------------------------------------------------

   ;~ Buttons
   Local $y_bottom = 0 ; 515
   Local $x = 10, $y = $y_bottom + 10
   GUICtrlCreateGroup("https://mybot.run " & GetTranslated(602,0, "- freeware bot -"), $x - 5, $y - 10, 190, 108)
	   $g_hBtnStart = GUICtrlCreateButton(GetTranslated(602,1, "Start Bot"), $x, $y + 2 +5, 90, 40-5)
		   _GUICtrlSetTip(-1, GetTranslated(602,30, "Use this to START the bot."))
		   GUICtrlSetOnEvent(-1, "btnStart")
		   If $g_bBtnColor then GUICtrlSetBkColor(-1, 0x5CAD85)
		   GUICtrlSetState(-1, $GUI_DISABLE)
	   $g_hBtnStop = GUICtrlCreateButton(GetTranslated(602,2, "Stop Bot"), -1, -1, 90, 40-5)
		   _GUICtrlSetTip(-1, GetTranslated(602,31, "Use this to STOP the bot (or ESC key)."))
		   If $g_bBtnColor then GUICtrlSetBkColor(-1, 0xDB4D4D)
		   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hBtnPause = GUICtrlCreateButton(GetTranslated(602,3, "Pause"), $x + 90, -1, 90, 40-5)
		   _GUICtrlSetTip(-1, GetTranslated(602,4, "Use this to PAUSE all actions of the bot until you Resume (or Pause/Break key)."))
		   If $g_bBtnColor then GUICtrlSetBkColor(-1,  0xFFA500)
		   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hBtnResume = GUICtrlCreateButton(GetTranslated(602,5, "Resume"), -1, -1, 90, 40-5)
		   _GUICtrlSetTip(-1, GetTranslated(602,6, "Use this to RESUME a paused Bot (or Pause/Break key)."))
		   If $g_bBtnColor then GUICtrlSetBkColor(-1,  0xFFA500)
		   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hBtnSearchMode = GUICtrlCreateButton(GetTranslated(602,7, "Search Mode"), -1, -1, 90, 40-5)
		   _GUICtrlSetTip(-1, GetTranslated(602,8, "Does not attack. Searches for a Village that meets conditions."))
		   GUICtrlSetOnEvent(-1, "btnSearchMode")
		   If $g_bBtnColor then GUICtrlSetBkColor(-1,  0xFFA500)
		   GUICtrlSetState(-1, $GUI_DISABLE)
	   $g_hBtnMakeScreenshot = GUICtrlCreateButton(GetTranslated(602,9, "Photo"), $x , $y + 45, 40, -1)
		   _GUICtrlSetTip(-1, GetTranslated(602,10, "Click here to take a snaphot of your village and save it to a file."))
		   If $g_bBtnColor then GUICtrlSetBkColor(-1, 0x5CAD85)
	   $g_hBtnHide = GUICtrlCreateButton(GetTranslated(602,11, "Hide"), $x + 40, $y + 45, 50, -1)
		   _GUICtrlSetTip(-1, GetTranslated(602,12, "Use this to move the Android Window out of sight.") & @CRLF & _
						      GetTranslated(602,13, "(Not minimized, but hidden)"))
		   If $g_bBtnColor Then GUICtrlSetBkColor(-1, 0x22C4F5)
		   GUICtrlSetState(-1, $GUI_DISABLE)
	   $g_hBtnEmbed = GUICtrlCreateButton(GetTranslated(602,27, "Dock"), $x + 90, $y + 45, 90, -1)
		   _GUICtrlSetTip(-1, GetTranslated(602,29, "Use this to embed the Android Window into Bot."))
		   If $g_bBtnColor Then GUICtrlSetBkColor(-1, 0x22C4F5)
		   GUICtrlSetState(-1, $GUI_DISABLE)
	   $g_hChkBackgroundMode = GUICtrlCreateCheckbox(GetTranslated(602,14, "Background Mode"), $x + 1, $y + 72, 90, 24)
		   GUICtrlSetFont(-1, 7)
		   _GUICtrlSetTip(-1, GetTranslated(602,16, "Check this to ENABLE the Background Mode of the Bot.") & @CRLF & _
						      GetTranslated(602,17, "With this you can also hide the Android Emulator window out of sight."))
		   GUICtrlSetOnEvent(-1, "chkBackground")
		   GUICtrlSetState(-1, (($g_bAndroidAdbScreencap = True) ? ($GUI_CHECKED) : ($GUI_UNCHECKED)))
	   $ModSupportConfig = GUICtrlCreateButton(GetTranslated(602,34, "Support"), $x + 93, $y + 70, 87, -1)
		   $sTxtTip = GetTranslated(602,35, "Support Mod Mybot All Versions.")
		   _GUICtrlSetTip(-1, $sTxtTip)
		   If $g_bBtnColor Then GUICtrlSetBkColor(-1, 0x22C4F5)
	   $g_hLblDonate = GUICtrlCreateLabel(GetTranslated(601,19,"Support the development"), $x + 224, $y + 80, 220, 24, $SS_RIGHT)
		   GUICtrlSetCursor(-1, 0) ; https://www.autoitscript.com/autoit3/docs/functions/MouseGetCursor.htm
		   GUICtrlSetFont(-1, 8.5, $FW_BOLD) ;, $GUI_FONTITALIC + $GUI_FONTUNDER)
		   _GUICtrlSetTip(-1, GetTranslated(601,18,"Paypal Donate?"))
	   $g_hBtnAttackNowDB = GUICtrlCreateButton(GetTranslated(602,18, "DB Attack!"), $x + 190, $y - 4, 60, -1)
		   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hBtnAttackNowLB = GUICtrlCreateButton(GetTranslated(602,19, "LB Attack!"), $x + 190, $y + 23, 60, -1)
		   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hBtnAttackNowTS = GUICtrlCreateButton(GetTranslated(602,20, "TH Snipe!"), $x + 190, $y + 50, 60, -1)
		   GUICtrlSetState(-1, $GUI_HIDE)
   GUICtrlCreateGroup("", -99, -99, 1, 1)

   If $g_bAndroidAdbScreencap = True Then chkBackground() ; update background mode GUI

   $g_hPicTwoArrowShield = GUICtrlCreateIcon($g_sLibIconPath, $eIcn2Arrow, $x + 190, $y + 10, 48, 48)

   $g_hLblVersion = GUICtrlCreateLabel($g_sBotVersion, 200, $y + 60, 60, 17, $SS_CENTER)
	   GUICtrlSetColor(-1, $COLOR_MEDGRAY)

   $g_hPicArrowLeft = GUICtrlCreateIcon($g_sLibIconPath, $eIcnArrowLeft, $x + 249, $y + 30, 16, 16)
	  $sTxtTip = GetTranslated(602,25, "Switch between village info and stats")
	  _GUICtrlSetTip(-1, $sTxtTip)
   $g_hPicArrowRight = GUICtrlCreateIcon($g_sLibIconPath, $eIcnArrowRight, $x + 247 + 198, $y + 30, 16, 16)
	  _GUICtrlSetTip(-1, $sTxtTip)

   ;~ Village
   Local $x = 295, $y = $y_bottom + 20
   $g_hGrpVillage = GUICtrlCreateGroup(GetTranslated(603,32, "Village"), $x - 20, $y - 20, 180, 85)
	   $g_hLblResultGoldNow = GUICtrlCreateLabel("", $x - 5, $y + 2, 60, 15, $SS_RIGHT)
	   $g_hLblResultGoldHourNow = GUICtrlCreateLabel("", $x, $y + 2, 60, 15, $SS_RIGHT)
		   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hPicResultGoldNow = GUICtrlCreateIcon ($g_sLibIconPath, $eIcnGold, $x + 60, $y, 16, 16)
		   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hPicResultGoldTemp = GUICtrlCreateIcon ($g_sLibIconPath, $eIcnGold, $x - 5, $y, 16, 16)
	   $g_hLblResultElixirNow = GUICtrlCreateLabel("", $x - 5, $y + 22, 60, 15, $SS_RIGHT)
	   $g_hLblResultElixirHourNow = GUICtrlCreateLabel("", $x, $y + 22, 60, 15, $SS_RIGHT)
		   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hPicResultElixirNow = GUICtrlCreateIcon ($g_sLibIconPath, $eIcnElixir, $x + 60, $y + 20, 16, 16)
		   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hPicResultElixirTemp = GUICtrlCreateIcon ($g_sLibIconPath, $eIcnElixir, $x - 5, $y + 20, 16, 16)
	   $g_hLblResultDENow = GUICtrlCreateLabel("", $x, $y + 42, 55, 15, $SS_RIGHT)
	   $g_hLblResultDEHourNow = GUICtrlCreateLabel("", $x, $y + 42, 60, 15, $SS_RIGHT)
		   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hPicResultDENow = GUICtrlCreateIcon ($g_sLibIconPath, $eIcnDark, $x + 60, $y + 40, 16, 16)
		   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hPicResultDETemp = GUICtrlCreateIcon ($g_sLibIconPath, $eIcnDark, $x - 5, $y + 40, 16, 16)

	   $x += 75
	   ;trophy / runtime
	   $g_hLblResultTrophyNow = GUICtrlCreateLabel("", $x, $y + 2, 55, 15, $SS_RIGHT)
	   $g_hPicResultTrophyNow = GUICtrlCreateIcon ($g_sLibIconPath, $eIcnTrophy, $x + 59, $y , 16, 16)
	   $g_hLblResultRuntimeNow = GUICtrlCreateLabel("00:00:00", $x, $y + 2, 50, 15, $SS_RIGHT)
	   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hPicResultRuntimeNow = GUICtrlCreateIcon($g_sLibIconPath, $eIcnHourGlass, $x +57, $y, 16, 16)
	   GUICtrlSetState(-1, $GUI_HIDE)
	   ;builders/attacked
	   $g_hLblResultBuilderNow = GUICtrlCreateLabel("", $x, $y + 22, 55, 15, $SS_RIGHT)
	   $g_hPicResultBuilderNow = GUICtrlCreateIcon ($g_sLibIconPath, $eIcnBuilder, $x + 59, $y + 20, 16, 16)
	   $g_hLblResultAttackedHourNow = GUICtrlCreateLabel("0", $x, $y + 22, 50, 15, $SS_RIGHT)
	   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hPicResultAttackedHourNow = GUICtrlCreateIcon($g_sLibIconPath, $eIcnBldgTarget, $x +59, $y + 20, 16, 16)
	   GUICtrlSetState(-1, $GUI_HIDE)
	   ;gems/skipped
	   $g_hLblResultGemNow = GUICtrlCreateLabel("", $x + 5, $y + 42, 50, 15, $SS_RIGHT)
	   $g_hPicResultGemNow = GUICtrlCreateIcon ($g_sLibIconPath, $eIcnGem, $x + 59, $y + 40, 16, 16)
	   $g_hLblResultSkippedHourNow = GUICtrlCreateLabel("0", $x, $y + 42, 50, 15, $SS_RIGHT)
	   GUICtrlSetState(-1, $GUI_HIDE)
	   $g_hPicResultSkippedHourNow = GUICtrlCreateIcon ($g_sLibIconPath, $eIcnBldgX, $x + 59, $y + 40, 16, 16)
	   GUICtrlSetState(-1, $GUI_HIDE)

	   $x = 285
	   $g_hLblVillageReportTemp = GUICtrlCreateLabel(GetTranslated(602,22, "Village Report") & @CRLF & GetTranslated(602,23, "will appear here") & @CRLF & GetTranslated(602,24, "on first run."), $x + 27, $y + 5, 100, 45, BITOR($SS_CENTER, $BS_MULTILINE))

	   $g_hBtnTestVillage = GUICtrlCreateButton("TEST BUTTON", $x + 25 , $y + 54, 100, 18)
		   GUICtrlSetOnEvent(-1, "ButtonBoost")
		   GUICtrlSetState(-1, $GUI_HIDE)

   GUICtrlCreateGroup("", -99, -99, 1, 1)
EndFunc
