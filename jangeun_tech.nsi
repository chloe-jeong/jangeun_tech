!include "MUI2.nsh"

!define PACKAGE_VERSION	"1.0.0"
!define PRODUCT_NAME	"Jangeun Tech Uninstaller"

Name "Jangeun Tech Uninstaller"
OutFile "output\jangeun_tech_uninstaller-${PACKAGE_VERSION}-setup.exe"
InstallDir "$PROGRAMFILES\${PRODUCT_NAME}"
InstallDirRegKey HKCU "Software\${PRODICT_NAME}" ""
RequestExecutionLevel admin

!define MUI_ABORTWARNING

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "license.txt"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

Section "Uninstall third-party programs" UnINST
	SetOverwrite on

	ReadRegStr $0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\LingShangTouch TouchCenter" "UninstallString"
	ExecWait '"$0"'

	nsExec::Exec 'TASKKILL /F /IM TouchPanel.exe'
	ReadRegStr $0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Morgan\TouchPanel" "UninstallString"
	ExecWait '"$0"'
SectionEnd

