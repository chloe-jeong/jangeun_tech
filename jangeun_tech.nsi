!include "MUI2.nsh"

!define PACKAGE_VERSION	"1.0.1"
!define PRODUCT_NAME	"Jangeun Tech Uninstaller"

SetCompressor	lzma

Name "Jangeun Tech Uninstaller"
OutFile "output\jangeun_tech_uninstaller-${PACKAGE_VERSION}-setup.exe"
InstallDir "$PROGRAMFILES\${PRODUCT_NAME}"
InstallDirRegKey HKCU "Software\${PRODICT_NAME}" ""

!define MUI_ABORTWARNING

!define MUI_ICON "jangeun_tech_logo.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "jangeun_tech_logo.bmp"
!define MUI_HEADERIMAGE_RIGHT

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "license.txt"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

Section "Uninstall programs for 32 bits" UnINST
	SetOverwrite on

	ReadRegStr $0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Wacom Tablet Driver" "UninstallString"
	ExecWait "$0"

	ReadRegStr $0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Wacom WebTabletPlugin for Internet Explorer and Netscape" "UninstallString"
	ExecWait "$0"
SectionEnd

Section "Uninstall programs for 64 bits" UnINST64
	SetRegView 64
	SetOverwrite on

	ReadRegStr $0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Wacom Tablet Driver" "UninstallString"
	ExecWait "$0"

	ReadRegStr $0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Wacom WebTabletPlugin for Internet Explorer and Netscape" "UninstallString"
	ExecWait "$0"
SectionEnd

