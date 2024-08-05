;This program is free software; you can redistribute it and/or
;modify it under the terms of the GNU General Public License
;as published by the Free Software Foundation; either version 2
;of the License, or (at your option) any later version.

;This program is distributed in the hope that it will be useful,
;but WITHOUT ANY WARRANTY; without even the implied warranty of
;MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;GNU General Public License for more details.

;You should have received a copy of the GNU General Public License
;along with this program; if not, write to the Free Software
;Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

!define NAME "USB-Kqemu Stop"
!define FRIENDLYNAME "USB-Kqemu Stop"
!define APP "Kqemu"
!define VER "1.3.0pre11"
!define WEBSITE "http://fabrice.bellard.free.fr/qemu/"
!define DEFAULTEXE "Kqemu.sys"

;=== Program Details
Name "${FRIENDLYNAME}"
OutFile "${NAME}.exe"
Caption "${FRIENDLYNAME}"
VIProductVersion "1.3.3.7"
VIAddVersionKey ProductName "${FRIENDLYNAME}"
VIAddVersionKey Comments "Allows ${APP} to be run from a removable drive.  For additional details, visit ${WEBSITE}"
VIAddVersionKey CompanyName "Glucose"
VIAddVersionKey LegalCopyright "Glucose"
VIAddVersionKey FileDescription "${FRIENDLYNAME}"
VIAddVersionKey FileVersion "${VER}"
VIAddVersionKey ProductVersion "${VER}"
VIAddVersionKey InternalName "${FRIENDLYNAME}"
VIAddVersionKey LegalTrademarks "Released Under GNU GPL"
VIAddVersionKey OriginalFilename "${NAME}.exe"
;VIAddVersionKey PrivateBuild ""
;VIAddVersionKey SpecialBuild ""

;=== Runtime Switches
CRCCheck On
WindowIcon Off
SilentInstall Silent
AutoCloseWindow True
RequestExecutionLevel user

;=== Program Icon
Icon "usbstop.ico"

Section "Main"
	  ;; Stop kqemu
	  nsSCM::Stop /NOUNLOAD "kqemu"
	  Pop $0
	  DetailPrint "nsSCM::Stop : $0"
	  nsSCM::Remove /NOUNLOAD "kqemu"
	  Pop $0
	  DetailPrint "nsSCM::Remove : $0"
SectionEnd