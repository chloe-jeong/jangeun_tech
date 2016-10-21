!include "MUI2.nsh"

!define PACKAGE_VERSION	"1.0.0"
!define PRODUCT_NAME	"Jangeun Tech Uninstaller"

Name "Jangeun Tech Uninstaller"
OutFile "jangeun_tech_uninstaller-${PACKAGE_VERSION}-setup.exe"
InstallDir "$PROGRAMFILES\${PRODUCT_NAME}"
InstallDirRegKey HKCU "Software\${PRODICT_NAME}" ""
RequestExecutionLevel admin

!define MUI_ABORTWARNING

!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
  
!insertmacro MUI_LANGUAGE "English"

Section -pre
	SetOverwrite on

	ReadRegStr ${TouchCenter} HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\TouchCenter" "UninstallString"
	nsExec::Exec "${TouchCenter}"
SectionEnd

