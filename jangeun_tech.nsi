!include "MUI2.nsh"

!define PACKAGE_VERSION	"1.0.0"
!define PRODUCT_NAME	"Jangeun Tech Uninstaller"

Name "Jangeun Tech Uninstaller"
OutFile "output\jangeun_tech_uninstaller-${PACKAGE_VERSION}-setup.exe"
InstallDir "$PROGRAMFILES\${PRODUCT_NAME}"
InstallDirRegKey HKCU "Software\${PRODICT_NAME}" ""
RequestExecutionLevel admin

!define MUI_ABORTWARNING

!define MUI_ICON "jangeun_tech_logo.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "jangeun_tech_logo.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP "jangeun_tech_logo.bmp"
!define MUI_HEADERIMAGE_RIGHT

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "license.txt"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

Section "Uninstall third-party programs" UnINST
	SetOverwrite on

	ReadRegStr $0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\LingShangTouch TouchCenter" "UninstallString"
	ExecWait "$0"

	ReadRegStr $0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Wacom Tablet Driver" "UninstallString"
	ExecWait "$0"

	ReadRegStr $0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Wacom WebTabletPlugin for Internet Explorer and Netscape" "UninstallString"
	ExecWait "$0"

	nsExec::Exec 'TASKKILL /F /IM TouchPanel.exe'
	ReadRegStr $0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Morgan\TouchPanel" "UninstallString"
	ExecWait "$0"
SectionEnd

