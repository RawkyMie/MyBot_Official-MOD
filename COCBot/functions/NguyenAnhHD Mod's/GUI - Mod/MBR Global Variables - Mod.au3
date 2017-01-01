; #FUNCTION# ====================================================================================================================
; Name ..........: MBR Global Variables - Mod
; Description ...: Extension of MBR Global Variables for Mod
; Syntax ........: #include , Global
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

;Variables for SwitchAcc Mode - DEMEN
Global $profile = $sProfilePath & "\Profile.ini"
Global $ichkSwitchAcc = 0
Global $ichkTrain = 0

Global $icmbTotalCoCAcc
Global $nTotalCoCAcc = 8
Global $ichkSmartSwitch

Global $ichkCloseTraining

Global $nCurProfile = 1
Global $ProfileList
Global $nTotalProfile = 1

Global $aProfileType[8]		; Type of the all Profiles, 1 = active, 2 = donate, 3 = idle

Global $aMatchProfileAcc[8]	; Accounts match with All Profiles

Global $DonateSwitchCounter = 0

Global $bReMatchAcc = False

Global $aTimerStart[8]
Global $aTimerEnd[8]
Global $aRemainTrainTime[8]
Global $aUpdateRemainTrainTime[8]
Global $nNexProfile
Global $nMinRemainTrain

Global $aLocateAccConfig[8], $aAccPosY[8]

; Adding QuickTrainCombo - DEMEN
Global 	$iRadio_Army12, $iRadio_Army123

#region Check Collectors Outside
; collectors outside filter
Global $ichkDBMeetCollOutside, $iDBMinCollOutsidePercent, $iCollOutsidePercent ; check later if $iCollOutsidePercent obsolete

; constants
Global Const $THEllipseWidth = 200, $THEllipseHeigth = 150, $CollectorsEllipseWidth = 130, $CollectorsEllipseHeigth = 97.5
Global Const $centerX = 430, $centerY = 335 ; check later if $THEllipseWidth, $THEllipseHeigth obsolete
Global $hBitmapFirst
#endregion

Global $lastModversion = "" ;latest version from GIT
Global $lastModmessage = "" ;message for last version
Global $oldModversmessage = "" ;warning message for old bot

; Auto Hide
Global $ichkAutoHide ; AutoHide mode enabled disabled
Global $ichkAutoHideDelay

; CSV Deployment Speed Mod
Global $isldSelectedCSVSpeed[$iModeCount], $iCSVSpeeds[19]
$isldSelectedCSVSpeed[$DB] = 4
$isldSelectedCSVSpeed[$LB] = 4
$iCSVSpeeds[0] = .1
$iCSVSpeeds[1] = .25
$iCSVSpeeds[2] = .5
$iCSVSpeeds[3] = .75
$iCSVSpeeds[4] = 1
$iCSVSpeeds[5] = 1.25
$iCSVSpeeds[6] = 1.5
$iCSVSpeeds[7] = 1.75
$iCSVSpeeds[8] = 2
$iCSVSpeeds[9] = 2.25
$iCSVSpeeds[10] = 2.5
$iCSVSpeeds[11] = 2.75
$iCSVSpeeds[12] = 3
$iCSVSpeeds[13] = 5
$iCSVSpeeds[14] = 8
$iCSVSpeeds[15] = 10
$iCSVSpeeds[16] = 20
$iCSVSpeeds[17] = 50
$iCSVSpeeds[18] = 99

Global $ichkDontRemoveTroops = 0
